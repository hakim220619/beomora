import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/progress_provider.dart';

/// Satu baris Papan Juara.
class LeaderEntry {
  final String uid;
  final String name;
  final String? photoUrl;
  final int weeklyXp;
  final bool premium; // lencana 👑

  const LeaderEntry({
    required this.uid,
    required this.name,
    required this.photoUrl,
    required this.weeklyXp,
    this.premium = false,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'photoUrl': photoUrl,
        'weeklyXp': weeklyXp,
        'premium': premium,
      };

  factory LeaderEntry.fromJson(Map<String, dynamic> m) => LeaderEntry(
        uid: m['uid'] as String,
        name: m['name'] as String? ?? 'Pelajar',
        photoUrl: m['photoUrl'] as String?,
        weeklyXp: (m['weeklyXp'] as num?)?.toInt() ?? 0,
        premium: m['premium'] == true,
      );
}

/// Papan Juara dari pengguna sungguhan di Firestore — hemat kuota:
/// - query `users` urut `weeklyXp` (indeks bawaan, tanpa composite),
///   limit 30, lalu disaring ke minggu berjalan di sisi klien;
/// - hasil di-cache 5 menit di SharedPreferences, jadi buka-tutup
///   layar berkali-kali cuma sekali query (≤30 reads / 5 menit /
///   perangkat, dan hanya saat layar Papan Juara dibuka).
class LeaderboardService {
  static const _kCache = 'leaderboard_cache_v1';
  static const _ttl = Duration(minutes: 5);
  static const _fetchLimit = 30;
  static const topN = 20;

  static Future<List<LeaderEntry>> fetch({bool force = false}) async {
    final prefs = await SharedPreferences.getInstance();
    final week = ProgressProvider.weekOf(DateTime.now());

    final cached = _readCache(prefs, week);
    if (!force && cached != null) return cached;

    if (Firebase.apps.isEmpty) return cached ?? const [];
    try {
      final snap = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('weeklyXp', descending: true)
          .limit(_fetchLimit)
          .get()
          .timeout(const Duration(seconds: 15));
      final entries = <LeaderEntry>[
        for (final doc in snap.docs)
          if (doc.data()['weekKey'] == week &&
              ((doc.data()['weeklyXp'] as num?)?.toInt() ?? 0) > 0)
            LeaderEntry(
              uid: doc.id,
              name: doc.data()['name'] as String? ?? 'Pelajar',
              photoUrl: doc.data()['photoUrl'] as String?,
              weeklyXp: (doc.data()['weeklyXp'] as num).toInt(),
              premium: doc.data()['premium'] == true,
            ),
      ].take(topN).toList();

      await prefs.setString(
        _kCache,
        jsonEncode({
          'at': DateTime.now().millisecondsSinceEpoch,
          'week': week,
          'entries': [for (final e in entries) e.toJson()],
        }),
      );
      return entries;
    } catch (e) {
      debugPrint('BeomoraLeaderboard: fetch gagal ($e)');
      // Offline/gagal: pakai cache minggu ini walau kedaluwarsa.
      return _readCache(prefs, week, ignoreTtl: true) ?? const [];
    }
  }

  static List<LeaderEntry>? _readCache(SharedPreferences prefs, String week,
      {bool ignoreTtl = false}) {
    final raw = prefs.getString(_kCache);
    if (raw == null) return null;
    try {
      final c = jsonDecode(raw) as Map<String, dynamic>;
      if (c['week'] != week) return null;
      final age = DateTime.now().millisecondsSinceEpoch -
          ((c['at'] as num?)?.toInt() ?? 0);
      if (!ignoreTtl && age > _ttl.inMilliseconds) return null;
      return [
        for (final e in c['entries'] as List)
          LeaderEntry.fromJson(e as Map<String, dynamic>)
      ];
    } catch (_) {
      return null;
    }
  }
}
