import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/mcq_bank.dart';
import '../models/course.dart';

/// Materi kursus: offline-first dengan sinkronisasi hemat kuota
/// (ramah paket Firebase gratis/Spark).
///
/// Sumber materi, dari yang paling diutamakan:
/// 1. Cache lokal (SharedPreferences) — hasil sinkron terakhir;
/// 2. Asset bawaan aplikasi (assets/content/*.json) — selalu tersedia,
///    dipakai saat install baru, offline, atau cache rusak.
///
/// Sinkronisasi ([sync]) berjalan di latar belakang saat aplikasi
/// dibuka, maksimal sekali tiap [_checkInterval]:
/// - baca `content/meta` (1 read) dan bandingkan `version` dengan cache;
/// - hanya kalau berbeda, unduh dokumen `content/{en,ja,id}` plus bank
///   Soal Pilihan Ganda `content/mcq_{ja,en}` (5 reads), validasi, lalu
///   simpan ke cache — dipakai mulai peluncuran berikutnya.
/// Dengan pola ini tiap perangkat rata-rata cuma ~1 read per hari,
/// jadi kuota gratis 50rb reads/hari cukup untuk puluhan ribu pengguna
/// — dan kalaupun kuota habis, semua orang tetap bisa belajar dari
/// cache/asset.
class ContentService {
  static const _langs = ['en', 'ja', 'id', 'ko', 'de'];
  static const _kVersion = 'content_version';
  static const _kLastCheck = 'content_last_check';
  static const _checkInterval = Duration(hours: 6);

  static String _kJson(String lang) => 'content_json_$lang';
  static String _kMcq(String lang) => 'content_mcq_$lang';
  static String _assetPath(String lang) => 'assets/content/$lang.json';

  /// Muat materi untuk dipakai aplikasi: cache lokal dulu, fallback
  /// asset bawaan. Tanpa [prefs] (mis. di test) langsung dari asset.
  static Future<List<Course>> loadCourses({SharedPreferences? prefs}) async {
    final courses = <Course>[];
    for (final lang in _langs) {
      final cached = prefs?.getString(_kJson(lang));
      Course? course;
      if (cached != null) {
        try {
          course =
              Course.fromJson(jsonDecode(cached) as Map<String, dynamic>);
        } catch (e) {
          debugPrint('BeomoraContent: cache $lang rusak, pakai asset ($e)');
        }
      }
      if (course == null) {
        final raw = await rootBundle.loadString(_assetPath(lang));
        course = Course.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      }
      courses.add(course);
    }
    return courses;
  }

  /// Muat bank Soal Pilihan Ganda hasil sinkron terakhir dari cache
  /// dan pasang sebagai bank aktif; tanpa cache (install baru/offline/
  /// rusak), bank bawaan aplikasi di mcq_bank.dart yang tetap dipakai.
  static void loadMcqBanks(SharedPreferences prefs) {
    for (final lang in mcqCourseIds) {
      final cached = prefs.getString(_kMcq(lang));
      if (cached == null) continue;
      try {
        applySyncedMcqBank(lang, mcqListFromJson(cached));
      } catch (e) {
        debugPrint('BeomoraContent: cache mcq $lang rusak, '
            'pakai bawaan ($e)');
      }
    }
  }

  /// Sinkronkan cache lokal dengan Firestore. Aman dipanggil tanpa
  /// di-await (fire-and-forget); semua galat ditelan karena materi
  /// bawaan selalu tersedia sebagai fallback.
  static Future<void> sync(SharedPreferences prefs,
      {bool force = false}) async {
    if (Firebase.apps.isEmpty) return;
    final now = DateTime.now().millisecondsSinceEpoch;
    final lastCheck = prefs.getInt(_kLastCheck) ?? 0;
    if (!force && now - lastCheck < _checkInterval.inMilliseconds) return;
    try {
      final db = FirebaseFirestore.instance;
      final meta = await db
          .doc('content/meta')
          .get()
          .timeout(const Duration(seconds: 10));
      await prefs.setInt(_kLastCheck, now);
      final serverVersion = (meta.data()?['version'] as num?)?.toInt();
      if (serverVersion == null ||
          serverVersion == (prefs.getInt(_kVersion) ?? 0)) {
        return; // belum di-seed, atau sudah paling baru
      }

      // Unduh & validasi SEMUA materi dulu, baru simpan — cache tidak
      // pernah berisi campuran versi.
      final fresh = <String, String>{};
      for (final lang in _langs) {
        final doc = await db
            .doc('content/$lang')
            .get()
            .timeout(const Duration(seconds: 15));
        final raw = doc.data()?['json'] as String?;
        if (raw == null) return; // konten server belum lengkap
        Course.fromJson(jsonDecode(raw) as Map<String, dynamic>); // validasi
        fresh[lang] = raw;
      }
      // Bank Soal Pilihan Ganda ikut versi yang sama; dokumen yang
      // belum diunggah admin dilewati (bank bawaan jadi fallback).
      final freshMcq = <String, String>{};
      for (final lang in mcqCourseIds) {
        final doc = await db
            .doc('content/mcq_$lang')
            .get()
            .timeout(const Duration(seconds: 15));
        final raw = doc.data()?['json'] as String?;
        if (raw == null) continue;
        mcqListFromJson(raw); // validasi
        freshMcq[lang] = raw;
      }
      for (final e in fresh.entries) {
        await prefs.setString(_kJson(e.key), e.value);
      }
      for (final e in freshMcq.entries) {
        await prefs.setString(_kMcq(e.key), e.value);
      }
      await prefs.setInt(_kVersion, serverVersion);
      debugPrint(
          'BeomoraContent: materi tersinkron ke versi $serverVersion '
          '(dipakai mulai peluncuran berikutnya)');
    } catch (e) {
      debugPrint('BeomoraContent: sync dilewati ($e)');
    }
  }

  /// (Khusus admin) Unggah materi dari asset bawaan ke Firestore dan
  /// naikkan versinya — semua perangkat akan tersinkron otomatis.
  /// Ditulis sebagai satu batch atomik lalu DIVERIFIKASI baca-ulang
  /// dari server. Mengembalikan pesan galat, atau null kalau sukses.
  static Future<String?> uploadFromAssets() async {
    if (Firebase.apps.isEmpty) return 'Firebase belum dikonfigurasi';
    try {
      final db = FirebaseFirestore.instance;
      final batch = db.batch();
      for (final lang in _langs) {
        final raw = await rootBundle.loadString(_assetPath(lang));
        Course.fromJson(jsonDecode(raw) as Map<String, dynamic>); // validasi
        batch.set(db.doc('content/$lang'), {
          'json': raw,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }
      // Bank Soal Pilihan Ganda dari mcq_bank.dart ikut diunggah.
      for (final lang in mcqCourseIds) {
        batch.set(db.doc('content/mcq_$lang'), {
          'json': mcqListToJson(mcqBundledFor(lang)),
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }
      final version = DateTime.now().millisecondsSinceEpoch;
      batch.set(db.doc('content/meta'), {
        'version': version,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      await batch.commit().timeout(const Duration(seconds: 30));

      // Verifikasi: baca ulang dari server, bukan dari cache.
      final meta = await db
          .doc('content/meta')
          .get(const GetOptions(source: Source.server))
          .timeout(const Duration(seconds: 15));
      if ((meta.data()?['version'] as num?)?.toInt() != version) {
        return 'Verifikasi gagal: versi di server tidak cocok';
      }
      return null;
    } catch (e) {
      debugPrint('BeomoraContent upload gagal: $e');
      return '$e';
    }
  }
}
