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
    if (configured) _init();
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
    _prefs.remove(_kName);
    _prefs.remove(_kEmail);
    _prefs.remove(_kPhoto);
    notifyListeners();
  }
}
