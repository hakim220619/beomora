import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter/widgets.dart';

import '../providers/auth_provider.dart';
import '../providers/progress_provider.dart';

/// Sinkronisasi progres belajar ke Firestore — hemat kuota gratis.
///
/// Progres tetap offline-first di SharedPreferences; Firestore hanya
/// cadangan/sinkron antar perangkat, menumpang di dokumen profil
/// `users/{uid}` (field `progress`) sehingga:
/// - restore saat login = 0 read ekstra (dokumen itu memang sudah
///   dibaca untuk profil);
/// - tulisan di-debounce 8 detik setelah perubahan terakhir dan
///   dipaksa terkirim saat aplikasi turun ke latar belakang / logout —
///   kira-kira hanya beberapa write per sesi belajar.
///
/// Kebijakan pencocokan ada di [ProgressProvider.reconcileCloudJson]:
/// server menang saat lokal masih segar (install baru / ganti akun)
/// atau server lebih baru; selain itu lokal menang dan di-push.
class ProgressSyncService {
  ProgressSyncService({required this.auth, required this.progress}) {
    auth.addListener(_onAuthChanged);
    progress.addListener(_onProgressChanged);
    // Paksa kirim saat aplikasi tak lagi terlihat, supaya perubahan
    // detik-detik terakhir tidak menunggu debounce.
    _lifecycle = AppLifecycleListener(
      onHide: () => unawaited(flush()),
      onPause: () => unawaited(flush()),
    );
    // Kirim sisa perubahan sebelum keluar akun, lalu bersihkan progres
    // lokal supaya akun berikutnya tidak mewarisi progres akun lama.
    auth.onBeforeSignOut = flush;
    auth.onSignedOut = progress.resetAll;
    _onAuthChanged();
  }

  final AuthProvider auth;
  final ProgressProvider progress;

  // ignore: unused_field
  late final AppLifecycleListener _lifecycle;
  String? _uid;
  Timer? _debounce;
  String? _lastPushed;

  void _onAuthChanged() {
    // Teruskan status premium ke ProgressProvider (hati ∞, XP 2×,
    // pelindung streak).
    progress.setPremium(auth.isPremium);
    if (!auth.configured) return;
    if (!auth.signedIn) {
      _uid = null;
      _debounce?.cancel();
      _lastPushed = null;
      return;
    }
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null || uid == _uid) return;
    _uid = uid;
    _reconcile();
  }

  void _onProgressChanged() {
    if (_uid == null) return;
    if (progress.exportCloudJson() == _lastPushed) return;
    _debounce?.cancel();
    _debounce =
        Timer(const Duration(seconds: 8), () => unawaited(_push()));
  }

  void _reconcile() {
    // Profil belum terbaca dari server (mis. offline): jangan ambil
    // keputusan — push berikutnya tetap berjalan seperti biasa.
    if (!auth.cloudProgressKnown) return;
    final raw = auth.cloudProgress;
    if (raw == null) {
      unawaited(_push()); // akun baru → cadangan pertama
      return;
    }
    switch (progress.reconcileCloudJson(raw)) {
      case CloudMerge.applied:
      case CloudMerge.identical:
        _lastPushed = raw;
      case CloudMerge.localWins:
        unawaited(_push());
    }
  }

  /// Kirim progres sekarang juga (dipakai saat app ke latar belakang
  /// dan sebelum logout). Aman dipanggil kapan pun.
  Future<void> flush() => _push();

  Future<void> _push() async {
    final uid = _uid;
    if (uid == null) return;
    _debounce?.cancel();
    final json = progress.exportCloudJson();
    if (json == _lastPushed) return;
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set(
        {
          'progress': json,
          'progressUpdatedAt': FieldValue.serverTimestamp(),
          // Field lepas yang bisa di-query — bahan Papan Juara.
          'xp': progress.xp,
          'weeklyXp': progress.weeklyXp,
          'weekKey': progress.weekKey,
          'premium': auth.isPremium, // lencana 👑 di Papan Juara
        },
        SetOptions(merge: true),
      ).timeout(const Duration(seconds: 20));
      _lastPushed = json;
    } catch (e) {
      // Gagal (offline dsb.) — perubahan berikutnya atau peluncuran
      // berikutnya akan mencoba lagi.
      debugPrint('BeomoraSync: push tertunda ($e)');
    }
  }
}
