import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/auth_config.dart';

/// Login/daftar HANYA lewat akun Google via Firebase Authentication,
/// dengan profil pengguna di Cloud Firestore (`users/{uid}`).
///
/// Alur:
/// 1. Google memberi identitas (popup di web; google_sign_in di
///    Android/iOS lalu ditukar ke FirebaseAuth.signInWithCredential).
/// 2. Setelah terautentikasi, profil dicek di `users/{uid}`:
///    - ada  → langsung masuk ([signedIn]);
///    - tidak ada → [needsRegistration] menyala dan UI membuka halaman
///      pendaftaran; [register] menulis profil ke Firestore, MENUNGGU
///      konfirmasi server, lalu MEMBACA ULANG dokumen dari server
///      sebagai verifikasi sebelum pengguna dianggap terdaftar.
///
/// Kalau Firebase belum dikonfigurasi (lib/firebase_options.dart masih
/// placeholder), aplikasi menampilkan panduan setup.
class AuthProvider extends ChangeNotifier {
  static const _kName = 'auth_name';
  static const _kEmail = 'auth_email';
  static const _kPhoto = 'auth_photo';

  /// Kunci cache status premium — juga dibaca ProgressProvider saat
  /// startup (sebelum profil server termuat).
  static const kPremiumPref = 'auth_premium';
  static const kPremiumUntilPref = 'auth_premium_until';

  final SharedPreferences _prefs;

  String? name;
  String? email;
  String? photoUrl;
  bool busy = false;

  /// Sudah terautentikasi Google tapi belum punya profil di Firestore —
  /// UI wajib mengarahkan ke halaman pendaftaran.
  bool needsRegistration = false;

  /// Detail galat terakhir, untuk membantu diagnosis konfigurasi.
  String? lastErrorDetail;

  /// Progres dari field `progress` dokumen profil, mentah (JSON) —
  /// dikonsumsi ProgressSyncService saat login/restore.
  String? cloudProgress;

  /// true kalau dokumen profil benar-benar terbaca dari Firestore
  /// (false = mode cache offline; progres server tidak diketahui).
  bool cloudProgressKnown = false;

  /// Kait untuk ProgressSyncService: kirim sisa progres sebelum keluar
  /// akun, dan bersihkan progres lokal setelahnya.
  Future<void> Function()? onBeforeSignOut;
  VoidCallback? onSignedOut;

  AuthProvider(this._prefs) {
    name = _prefs.getString(_kName);
    email = _prefs.getString(_kEmail);
    photoUrl = _prefs.getString(_kPhoto);
    _premiumFlag = _prefs.getBool(kPremiumPref) ?? false;
    _premiumUntil = _prefs.getInt(kPremiumUntilPref);
    _globalPremium = _prefs.getBool(kGlobalPremiumPref) ?? false;
    _premiumGrantUntil = _prefs.getInt(kPremiumGrantPref);
    if (configured) _init();
  }

  // ---------- Premium ----------

  bool _premiumFlag = false;
  int? _premiumUntil; // epoch ms; null = seumur hidup

  /// Premium aktif: saklar global admin menyala, ATAU hadiah admin
  /// masih berlaku, ATAU premium pribadi (flag menyala dan — kalau
  /// berlangganan — belum lewat masanya).
  bool get isPremium =>
      _globalPremium || _grantActive || _personalPremium;

  bool get _personalPremium =>
      _premiumFlag &&
      (_premiumUntil == null ||
          DateTime.now().millisecondsSinceEpoch < _premiumUntil!);

  // ---------- Hadiah premium dari admin ----------

  /// Batas hadiah premium (epoch ms) dari field `premiumGrantUntil`
  /// dokumen profil. HANYA admin yang bisa menulis field itu
  /// (firestore.rules), dan klien tidak pernah ikut menulisnya —
  /// jadi hadiah kebal tertimpa sync progres, dan pencabutan langsung
  /// berlaku saat profil dibaca ulang.
  static const kPremiumGrantPref = 'auth_premium_grant';
  int? _premiumGrantUntil;

  bool get _grantActive =>
      _premiumGrantUntil != null &&
      DateTime.now().millisecondsSinceEpoch < _premiumGrantUntil!;

  /// (Khusus admin) Hadiahkan premium berbatas waktu ke pengguna lain
  /// berdasarkan email; [duration] null = cabut hadiah. Mengembalikan
  /// kunci l10n/pesan galat, atau null kalau sukses. Berlaku di
  /// perangkat penerima saat aplikasinya dibuka ulang.
  Future<String?> grantPremiumByEmail(
      String email, Duration? duration) async {
    if (!configured) return 'Firebase belum dikonfigurasi';
    try {
      final q = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email.trim().toLowerCase())
          .limit(1)
          .get()
          .timeout(const Duration(seconds: 15));
      if (q.docs.isEmpty) return 'admin_grant_notfound';
      await q.docs.first.reference.update({
        'premiumGrantUntil': duration == null
            ? FieldValue.delete()
            : DateTime.now().add(duration).millisecondsSinceEpoch,
      }).timeout(const Duration(seconds: 15));
      return null;
    } catch (e) {
      debugPrint('BeomoraAuth grant gagal: $e');
      return '$e';
    }
  }

  // ---------- Premium untuk semua (saklar admin) ----------

  /// Saklar global dari dokumen `content/config` field `premiumForAll`:
  /// selama menyala, SEMUA pengguna diperlakukan premium tanpa membeli.
  /// Dibaca tiap aplikasi dibuka (cache prefs untuk offline); hanya
  /// admin yang bisa menulisnya — aturan Firestore koleksi `content`
  /// menegakkan itu di sisi server.
  static const kGlobalPremiumPref = 'global_premium';
  static const _configDocPath = 'content/config';

  bool _globalPremium = false;
  bool get globalPremium => _globalPremium;

  Future<void> _fetchGlobalPremium() async {
    try {
      final doc = await FirebaseFirestore.instance
          .doc(_configDocPath)
          .get()
          .timeout(const Duration(seconds: 10));
      applyGlobalPremium(doc.data()?['premiumForAll'] == true);
    } catch (_) {
      // Offline dsb. — pertahankan nilai cache dari prefs.
    }
  }

  @visibleForTesting
  void applyGlobalPremium(bool on) {
    if (on == _globalPremium) return;
    _globalPremium = on;
    _prefs.setBool(kGlobalPremiumPref, on);
    notifyListeners();
  }

  /// (Khusus admin) Nyalakan/matikan premium untuk semua pengguna.
  /// Menulis `content/config` lalu memverifikasi baca-ulang dari
  /// server. Mengembalikan pesan galat, atau null kalau sukses.
  Future<String?> setGlobalPremium(bool on) async {
    if (!configured) return 'Firebase belum dikonfigurasi';
    try {
      final doc = FirebaseFirestore.instance.doc(_configDocPath);
      await doc.set({
        'premiumForAll': on,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)).timeout(const Duration(seconds: 15));
      final check = await doc
          .get(const GetOptions(source: Source.server))
          .timeout(const Duration(seconds: 15));
      if (check.data()?['premiumForAll'] != on) {
        return 'Verifikasi gagal: nilai di server tidak cocok';
      }
      applyGlobalPremium(on);
      return null;
    } catch (e) {
      debugPrint('BeomoraAuth setGlobalPremium gagal: $e');
      return '$e';
    }
  }

  /// Aktifkan premium (dipanggil PurchaseService setelah pembelian
  /// sukses). [until] null = seumur hidup. Disimpan ke prefs + dokumen
  /// profil Firestore agar ikut pindah perangkat.
  Future<void> activatePremium({DateTime? until}) async {
    _premiumFlag = true;
    _premiumUntil = until?.millisecondsSinceEpoch;
    _persistPremiumPrefs();
    notifyListeners();
    try {
      final user = pendingUser;
      if (user != null) {
        await _userDoc(user.uid).set({
          'premium': true,
          'premiumUntil': _premiumUntil,
        }, SetOptions(merge: true)).timeout(const Duration(seconds: 15));
      }
    } catch (e) {
      // Tersimpan lokal; dokumen akan menyusul pada sesi berikutnya.
      debugPrint('BeomoraAuth premium sync tertunda: $e');
    }
  }

  /// Terapkan status premium dari dokumen profil server TANPA
  /// menurunkan premium lokal yang masih aktif — dokumen bisa
  /// ketinggalan (mis. Play Billing baru saja memulihkan langganan
  /// sebelum profil tiba, atau write saat pembelian dulu gagal).
  /// Server hanya boleh menaikkan/memperpanjang; penurunan terjadi
  /// alami lewat kedaluwarsa [_premiumUntil] (langganan berhenti →
  /// restore tidak memperpanjang lagi).
  @visibleForTesting
  void applyServerPremium(Map<String, dynamic> profile) {
    // Hadiah admin: server otoritas penuh — selalu ikuti apa adanya
    // (memberi maupun mencabut), karena klien tidak pernah menulisnya.
    _premiumGrantUntil = (profile['premiumGrantUntil'] as num?)?.toInt();
    if (_premiumGrantUntil != null) {
      _prefs.setInt(kPremiumGrantPref, _premiumGrantUntil!);
    } else {
      _prefs.remove(kPremiumGrantPref);
    }
    final flag = profile['premium'] == true;
    final until = (profile['premiumUntil'] as num?)?.toInt();
    final serverActive = flag &&
        (until == null ||
            DateTime.now().millisecondsSinceEpoch < until);
    // Bandingkan dengan premium PRIBADI — saklar global admin tidak
    // boleh menghalangi penyimpanan premium pelanggan sungguhan.
    if (!_personalPremium) {
      // Lokal tidak aktif → ikuti server apa adanya.
      _premiumFlag = flag;
      _premiumUntil = until;
    } else if (serverActive &&
        _premiumUntil != null &&
        (until == null || until > _premiumUntil!)) {
      // Server lebih panjang (atau seumur hidup) → naikkan.
      _premiumFlag = true;
      _premiumUntil = until;
    }
    _persistPremiumPrefs();
  }

  void _persistPremiumPrefs() {
    _prefs.setBool(kPremiumPref, _premiumFlag);
    if (_premiumUntil != null) {
      _prefs.setInt(kPremiumUntilPref, _premiumUntil!);
    } else {
      _prefs.remove(kPremiumUntilPref);
    }
  }

  /// Firebase sudah di-init di main() — kalau belum, mode panduan.
  bool get configured => Firebase.apps.isNotEmpty;

  /// Terdaftar penuh: identitas Google + profil Firestore tersimpan.
  bool get signedIn => email != null && !needsRegistration;

  /// Nama depan untuk sapaan & leaderboard.
  String? get firstName => name?.split(' ').first;

  /// Admin konten: boleh mengunggah materi ke server (lihat
  /// firestore.rules).
  bool get isAdmin => signedIn && email == AuthConfig.adminEmail;

  /// Info akun Google untuk pra-isi formulir pendaftaran.
  User? get pendingUser =>
      configured ? FirebaseAuth.instance.currentUser : null;

  /// UID Firebase sesi aktif (null saat mode tamu/belum login).
  String? get uid =>
      configured ? FirebaseAuth.instance.currentUser?.uid : null;

  DocumentReference<Map<String, dynamic>> _userDoc(String uid) =>
      FirebaseFirestore.instance.collection('users').doc(uid);

  Future<void> _init() async {
    // Saklar "premium untuk semua" dari server — latar belakang.
    unawaited(_fetchGlobalPremium());
    // Sesi Firebase dipulihkan otomatis; dengarkan untuk memulihkan
    // profil saat aplikasi dibuka ulang.
    FirebaseAuth.instance.authStateChanges().listen(_restore);
    if (!kIsWeb) {
      try {
        final webId = AuthConfig.googleWebClientId;
        final iosId = AuthConfig.googleIosClientId;
        await GoogleSignIn.instance.initialize(
          clientId: iosId.isEmpty ? null : iosId,
          serverClientId: webId.isEmpty ? null : webId,
        );
      } catch (e) {
        lastErrorDetail = '$e';
      }
    }
  }

  /// Pemulihan sesi saat startup. Sesi tanpa profil Firestore (keluar
  /// aplikasi sebelum menyelesaikan pendaftaran) dikeluarkan agar
  /// login berikutnya kembali diarahkan ke pendaftaran.
  Future<void> _restore(User? user) async {
    if (user == null || busy) return;
    try {
      final doc = await _userDoc(user.uid).get();
      if (doc.exists) {
        _store(user, doc.data());
      } else {
        await signOut();
      }
    } catch (_) {
      // Firestore tak terjangkau (mis. offline) — pertahankan profil
      // dari cache lokal kalau memang milik akun yang sama.
      if (_prefs.getString(_kEmail) == user.email) {
        _store(user, null);
      }
    }
  }

  /// Mulai login Google interaktif. Mengembalikan kunci l10n pesan
  /// galat, atau null kalau sukses / dibatalkan pengguna. Setelah
  /// sukses, periksa [needsRegistration]: kalau menyala, buka halaman
  /// pendaftaran.
  Future<String?> signIn() async {
    if (!configured) return 'login_not_configured';
    busy = true;
    notifyListeners();
    try {
      if (kIsWeb) {
        await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
      } else {
        final account = await GoogleSignIn.instance.authenticate();
        final idToken = account.authentication.idToken;
        if (idToken == null) {
          lastErrorDetail = 'ID token kosong dari Google Sign-In';
          return 'login_failed';
        }
        await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(idToken: idToken),
        );
      }

      // Autentikasi beres — cek profil di Firestore.
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        lastErrorDetail = 'Sesi Firebase kosong setelah login';
        return 'login_failed';
      }
      final doc = await _userDoc(user.uid)
          .get()
          .timeout(const Duration(seconds: 15));
      if (doc.exists) {
        _store(user, doc.data());
      } else {
        // Belum terdaftar — jangan simpan apa pun dulu.
        needsRegistration = true;
      }
      return null;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      lastErrorDetail =
          '${e.code.name}${e.description == null ? '' : ': ${e.description}'}';
      debugPrint('BeomoraAuth signIn failed: $lastErrorDetail');
      return 'login_failed';
    } on FirebaseAuthException catch (e) {
      // Popup web ditutup pengguna = batal, bukan galat.
      if (e.code == 'popup-closed-by-user' ||
          e.code == 'cancelled-popup-request' ||
          e.code == 'web-context-canceled') {
        return null;
      }
      lastErrorDetail = '${e.code}: ${e.message}';
      debugPrint('BeomoraAuth signIn failed: $lastErrorDetail');
      return e.code == 'operation-not-allowed'
          ? 'provider_disabled'
          : 'login_failed';
    } on FirebaseException catch (e) {
      // Galat Firestore (mis. rules belum di-publish).
      lastErrorDetail = '${e.code}: ${e.message}';
      debugPrint('BeomoraAuth signIn failed: $lastErrorDetail');
      return e.code == 'permission-denied'
          ? 'rules_not_published'
          : 'login_failed';
    } catch (e) {
      lastErrorDetail = '$e';
      debugPrint('BeomoraAuth signIn failed: $lastErrorDetail');
      return 'login_failed';
    } finally {
      busy = false;
      notifyListeners();
    }
  }

  /// Simpan profil pendaftaran ke Firestore. Mengembalikan kunci l10n
  /// pesan galat, atau null kalau sukses.
  ///
  /// Keamanan data: `set()` di-await sampai server mengonfirmasi
  /// tulisan (bukan sekadar cache lokal), lalu dokumen DIBACA ULANG
  /// langsung dari server ([Source.server]) — pengguna baru dianggap
  /// terdaftar setelah data terbukti tersimpan.
  Future<String?> register(String displayName) async {
    final user = pendingUser;
    final trimmed = displayName.trim();
    if (user == null) return 'login_failed';
    if (trimmed.isEmpty) return 'register_name_empty';
    busy = true;
    notifyListeners();
    try {
      final doc = _userDoc(user.uid);
      await doc.set({
        'name': trimmed,
        'email': user.email,
        'photoUrl': user.photoURL,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 20));

      // Verifikasi: baca ulang dari server, bukan dari cache.
      final saved = await doc
          .get(const GetOptions(source: Source.server))
          .timeout(const Duration(seconds: 15));
      if (!saved.exists || saved.data()?['name'] != trimmed) {
        lastErrorDetail =
            'Verifikasi gagal: dokumen users/${user.uid} tidak ditemukan di server';
        return 'register_failed';
      }

      needsRegistration = false;
      _store(user, saved.data());
      return null;
    } on FirebaseException catch (e) {
      lastErrorDetail = '${e.code}: ${e.message}';
      debugPrint('BeomoraAuth register failed: $lastErrorDetail');
      return e.code == 'permission-denied'
          ? 'rules_not_published'
          : 'register_failed';
    } catch (e) {
      lastErrorDetail = '$e';
      debugPrint('BeomoraAuth register failed: $lastErrorDetail');
      return 'register_failed';
    } finally {
      busy = false;
      notifyListeners();
    }
  }

  /// Batalkan pendaftaran yang belum selesai: keluarkan sesi Google
  /// supaya tidak ada akun "setengah terdaftar".
  Future<void> cancelRegistration() async {
    needsRegistration = false;
    await signOut();
  }

  Future<void> signOut() async {
    // Beri kesempatan progres tersinkron dulu (best effort).
    try {
      await onBeforeSignOut?.call().timeout(const Duration(seconds: 5));
    } catch (_) {}
    try {
      if (configured) await FirebaseAuth.instance.signOut();
    } catch (_) {}
    try {
      if (!kIsWeb) await GoogleSignIn.instance.signOut();
    } catch (_) {}
    needsRegistration = false;
    _clear();
    onSignedOut?.call();
  }

  /// Simpan profil aktif (prioritas data Firestore, fallback data
  /// akun Google) ke memori + cache lokal.
  void _store(User user, Map<String, dynamic>? profile) {
    if (profile != null) {
      cloudProgressKnown = true;
      cloudProgress = profile['progress'] as String?;
      applyServerPremium(profile);
    }
    name = (profile?['name'] as String?) ??
        user.displayName ??
        (user.email ?? 'Pelajar').split('@').first;
    email = user.email ?? '';
    photoUrl = (profile?['photoUrl'] as String?) ?? user.photoURL;
    _prefs.setString(_kName, name!);
    _prefs.setString(_kEmail, email!);
    if (photoUrl != null) {
      _prefs.setString(_kPhoto, photoUrl!);
    } else {
      _prefs.remove(_kPhoto);
    }
    notifyListeners();
  }

  void _clear() {
    name = null;
    email = null;
    photoUrl = null;
    cloudProgress = null;
    cloudProgressKnown = false;
    _premiumFlag = false;
    _premiumUntil = null;
    _premiumGrantUntil = null;
    _prefs.remove(kPremiumPref);
    _prefs.remove(kPremiumUntilPref);
    _prefs.remove(kPremiumGrantPref);
    _prefs.remove(_kName);
    _prefs.remove(_kEmail);
    _prefs.remove(_kPhoto);
    notifyListeners();
  }
}
