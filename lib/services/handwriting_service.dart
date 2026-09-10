import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Satu goresan di kanvas: titik + waktu (ms) per titik, dalam koordinat
/// kanvas. Dipakai kanvas tulis dan diubah ke [Ink] saat dikenali.
class InkStroke {
  final List<Offset> points = [];
  final List<int> times = [];

  void add(Offset p, int t) {
    points.add(p);
    times.add(t);
  }

  bool get isEmpty => points.isEmpty;
}

/// Pembungkus ML Kit Digital Ink: model per bahasa (unduh/hapus/cek) dan
/// pengenalan goresan menjadi kandidat teks. Model disimpan ML Kit di
/// penyimpanan internal app; kita tidak menyentuh path berkas apa pun.
///
/// Memanggil kanal native plugin secara langsung, bukan lewat kelas Dart
/// paketnya: di google_mlkit_digital_ink_recognition 0.15.0 sisi Dart dan
/// iOS memakai kanal "…_recognizer" sedangkan Android mendaftarkan
/// "…_recognition", sehingga lewat kelas paket setiap panggilan di Android
/// berakhir MissingPluginException. Versi yang memperbaikinya butuh Dart
/// 3.12. Di sini kedua nama dicoba dan yang menjawab diingat.
class HandwritingService {
  HandwritingService._();
  static final HandwritingService instance = HandwritingService._();

  /// Kanal plugin yang dicoba berurutan untuk pengenalan (Dart/iOS dulu,
  /// lalu Android).
  static const List<String> channelNames = [
    'google_mlkit_digital_ink_recognizer',
    'google_mlkit_digital_ink_recognition',
  ];

  /// Kanal milik app (MainActivity.kt) untuk cek/unduh/hapus model. Di
  /// Android plugin 0.15.0 fungsi manageModel-nya kosong dan tidak pernah
  /// membalas, jadi pengelolaan model dicoba lewat kanal ini dulu; di iOS
  /// kanal ini tidak ada dan jatuh ke kanal plugin yang implementasinya
  /// benar.
  static const String nativeManageChannel = 'beomora/ink';

  /// Kanal yang dicoba untuk pengelolaan model, berurutan.
  static const List<String> manageChannelNames = [
    nativeManageChannel,
    ...channelNames,
  ];

  /// Batas tunggu cek model; kalau native tidak membalas, dianggap belum
  /// terunduh supaya UI tidak menggantung.
  static const Duration checkTimeout = Duration(seconds: 15);

  /// Batas tunggu pengenalan; lewat ini dianggap tidak ada kandidat.
  static const Duration recognizeTimeout = Duration(seconds: 20);
  static const _methodManage = 'vision#manageInkModels';
  static const _methodStart = 'vision#startDigitalInkRecognizer';
  static const _methodClose = 'vision#closeDigitalInkRecognizer';

  MethodChannel? _resolved; // kanal pengenalan yang terbukti menjawab
  MethodChannel? _resolvedManage; // kanal pengelolaan model yang menjawab

  /// Kandidat teratas yang dianggap benar kalau salah satunya cocok.
  static const int topCandidates = 3;

  /// Kode bahasa model ML Kit (BCP 47) per kursus.
  static String? languageFor(String courseId) => const {
    'ja': 'ja',
    'ko': 'ko',
    'en': 'en',
    'de': 'de',
    'id': 'id',
  }[courseId];

  /// Perkiraan ukuran model (MB) untuk ditampilkan; API ML Kit tidak
  /// memberi ukuran sebenarnya.
  static int estimatedModelMb(String language) =>
      const {'ja': 30, 'ko': 25}[language] ?? 20;

  /// Panggil [method]; kalau kanal pertama tidak punya implementasi, coba
  /// nama berikutnya. MissingPluginException hanya dilempar kalau semua
  /// nama gagal (plugin memang tidak terpasang, mis. di web/desktop).
  Future<T?> _invoke<T>(String method, Map<String, dynamic> args) async {
    final resolved = _resolved;
    if (resolved != null) return resolved.invokeMethod<T>(method, args);
    MissingPluginException? last;
    for (final name in channelNames) {
      final channel = MethodChannel(name);
      try {
        final result = await channel.invokeMethod<T>(method, args);
        _resolved = channel;
        return result;
      } on MissingPluginException catch (e) {
        last = e;
      }
    }
    throw last!;
  }

  /// Seperti [_invoke] tetapi untuk pengelolaan model, urutan
  /// [manageChannelNames].
  Future<T?> _manage<T>(Map<String, dynamic> args) async {
    final resolved = _resolvedManage;
    if (resolved != null) return resolved.invokeMethod<T>(_methodManage, args);
    MissingPluginException? last;
    for (final name in manageChannelNames) {
      final channel = MethodChannel(name);
      try {
        final result = await channel.invokeMethod<T>(_methodManage, args);
        _resolvedManage = channel;
        return result;
      } on MissingPluginException catch (e) {
        last = e;
      }
    }
    throw last!;
  }

  Future<bool> isModelDownloaded(String language) async {
    try {
      final r = await _manage<Object?>({
        'task': 'check',
        'model': language,
      }).timeout(checkTimeout);
      return r == true;
    } catch (e) {
      debugPrint('HandwritingService: cek model $language gagal: $e');
      return false;
    }
  }

  /// Unduh model; `true` kalau sukses atau sudah ada. Melempar kalau gagal
  /// (tanpa jaringan, Wi-Fi diwajibkan tapi tidak ada, dsb.).
  Future<bool> downloadModel(String language, {required bool wifiOnly}) async {
    try {
      final r = await _manage<Object?>({
        'task': 'download',
        'model': language,
        'wifi': wifiOnly,
      });
      return r.toString() == 'success';
    } catch (e) {
      // Tampil di logcat/console sebagai "flutter : HandwritingService ..."
      // supaya penyebab gagal unduh bisa dilacak dari perangkat.
      debugPrint('HandwritingService: unduh model $language gagal: $e');
      rethrow;
    }
  }

  Future<bool> deleteModel(String language) async {
    final r = await _manage<Object?>({'task': 'delete', 'model': language});
    return r.toString() == 'success';
  }

  /// Pesan singkat dari error plugin/ML Kit untuk ditampilkan ke pengguna
  /// di bawah pesan gagal (mis. "error: MlKitException: ...").
  static String describeError(Object e) {
    if (e is PlatformException) {
      final parts = [e.code, e.message, e.details]
          .where((p) => p != null && p.toString().trim().isNotEmpty)
          .map((p) => p.toString().trim())
          .toList();
      return parts.join(': ');
    }
    return e.toString();
  }

  /// Kenali goresan; kembalikan teks kandidat terurut dari yang paling
  /// mungkin. Kosong kalau tidak ada goresan atau engine gagal.
  Future<List<String>> recognize(
    List<InkStroke> strokes,
    String language, {
    Size? area,
  }) async {
    final ink = {
      'strokes': [
        for (final s in strokes)
          if (!s.isEmpty)
            {
              'points': [
                for (var i = 0; i < s.points.length; i++)
                  {'x': s.points[i].dx, 'y': s.points[i].dy, 't': s.times[i]},
              ],
            },
      ],
    };
    if ((ink['strokes'] as List).isEmpty) return const [];
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      final result = await _invoke<List<Object?>>(_methodStart, {
        'id': id,
        'ink': ink,
        'context': area == null
            ? null
            : {
                'preContext': null,
                'writingArea': {'width': area.width, 'height': area.height},
              },
        'model': language,
      }).timeout(recognizeTimeout);
      return [
        for (final c in result ?? const [])
          if (c is Map && c['text'] is String) c['text'] as String,
      ];
    } catch (e) {
      debugPrint('HandwritingService: pengenalan $language gagal: $e');
      return const [];
    } finally {
      // Lepaskan recognizer di native tanpa menunggu: handler CLOSE plugin
      // 0.15.0 di Android tidak pernah membalas, jadi menunggunya membuat
      // hasil pengenalan tidak pernah sampai ke UI.
      unawaited(
        _invoke<Object?>(_methodClose, {
          'id': id,
        }).timeout(const Duration(seconds: 5)).then((_) {}, onError: (_) {}),
      );
    }
  }

  /// Kunci pembanding: huruf kecil, tanpa spasi. Alfabet Latin dinilai
  /// tanpa peduli huruf besar; kana/hangul dibandingkan apa adanya.
  static String normalize(String s) =>
      s.toLowerCase().replaceAll(RegExp(r'\s+'), '');

  /// Benar kalau [target] muncul di [topCandidates] kandidat teratas.
  static bool matches(String target, List<String> candidates) {
    final key = normalize(target);
    return candidates.take(topCandidates).any((c) => normalize(c) == key);
  }
}
