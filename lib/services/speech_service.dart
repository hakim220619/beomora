import 'dart:async';

import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// Kenapa mesin pengenal suara tidak bisa dipakai.
enum SpeechUnavailable {
  /// Izin mikrofon / pengenalan suara ditolak, atau perangkat tanpa mesin.
  permission,

  /// Mesin ada, tapi bahasa kursus tidak didukung / belum terpasang.
  locale,
}

/// Pembungkus speech_to_text (mesin bawaan Android/iOS): dengarkan satu
/// ucapan, kembalikan semua tebakan transkripnya. Gagal diam-diam.
class SpeechService {
  SpeechService._();
  static final SpeechService instance = SpeechService._();

  final SpeechToText _stt = SpeechToText();
  bool? _ready;
  final Map<String, String?> _localeIds = {};

  Completer<List<String>>? _pending;
  List<String> _last = const [];

  /// Status/galat baru dihiraukan setelah sesi aktif benar-benar mulai
  /// (status 'listening' atau hasil pertama). Status "berhenti" sisa
  /// sesi sebelumnya yang telat datang tidak boleh menutup sesi baru.
  bool _armed = false;

  /// Setelah 'notListening', hasil akhir masih bisa menyusul; tunggu
  /// sebentar (atau sampai 'done') sebelum menilai.
  Timer? _graceTimer;

  /// Berhenti otomatis setelah pengguna diam sejenak.
  Timer? _silenceTimer;

  /// Pengaman kalau mesin tidak pernah mulai mendengar.
  Timer? _startTimer;

  static const _silence = Duration(milliseconds: 1200);
  static const _grace = Duration(milliseconds: 1500);

  Future<bool> _init() async {
    if (_ready == true) return true;
    try {
      _ready = await _stt.initialize(
        onError: (_) {
          if (_armed) _finish();
        },
        onStatus: (s) {
          if (s == SpeechToText.listeningStatus) {
            _armed = true;
            return;
          }
          if (!_armed) return;
          if (s == SpeechToText.doneStatus) {
            _finish();
          } else if (s == SpeechToText.notListeningStatus) {
            _graceTimer?.cancel();
            _graceTimer = Timer(_grace, _finish);
          }
        },
      );
    } catch (_) {
      _ready = false;
    }
    return _ready!;
  }

  /// Siapkan mesin untuk [ttsLocale] (mis. 'ja-JP'). null = siap.
  Future<SpeechUnavailable?> prepare(String ttsLocale) async {
    if (!await _init()) return SpeechUnavailable.permission;
    return await _localeFor(ttsLocale) == null
        ? SpeechUnavailable.locale
        : null;
  }

  /// Cari id locale mesin: persis 'ja_JP' dulu, kalau tidak ada pakai
  /// locale apa pun dengan bahasa yang sama ('en_GB' untuk 'en-US').
  Future<String?> _localeFor(String ttsLocale) async {
    if (_localeIds.containsKey(ttsLocale)) return _localeIds[ttsLocale];
    String? found;
    try {
      final want = ttsLocale.replaceAll('-', '_').toLowerCase();
      final lang = want.split('_').first;
      final ids = (await _stt.locales()).map((l) => l.localeId).toList();
      String norm(String id) => id.replaceAll('-', '_').toLowerCase();
      found =
          ids.where((id) => norm(id) == want).firstOrNull ??
          ids.where((id) => norm(id).split('_').first == lang).firstOrNull;
      // Beberapa mesin Android tidak melaporkan daftar locale sama sekali;
      // coba saja dengan locale kursus.
      if (ids.isEmpty) found = ttsLocale.replaceAll('-', '_');
    } catch (_) {}
    _localeIds[ttsLocale] = found;
    return found;
  }

  /// Dengarkan satu ucapan sampai pengguna diam / [stop] dipanggil.
  /// [onPartial] menerima transkrip sementara. [isEnough] dicek tiap
  /// transkrip baru; kalau true (ucapan sudah cocok target), langsung
  /// berhenti tanpa menunggu diam. Hasil: semua tebakan transkrip (bisa
  /// kosong kalau tidak ada suara yang terdengar).
  Future<List<String>> listenOnce(
    String ttsLocale, {
    void Function(String partial)? onPartial,
    bool Function(List<String> heard)? isEnough,
  }) async {
    if (!await _init()) return const [];
    final localeId = await _localeFor(ttsLocale);
    await cancel();
    final done = Completer<List<String>>();
    _pending = done;
    _last = const [];
    _armed = false;
    try {
      await _stt.listen(
        onResult: (SpeechRecognitionResult r) {
          if (!identical(_pending, done)) return;
          _armed = true;
          final words = <String>{
            r.recognizedWords,
            ...r.alternates.map((a) => a.recognizedWords),
          }.where((w) => w.trim().isNotEmpty).toList();
          if (words.isNotEmpty) _last = words;
          onPartial?.call(r.recognizedWords);
          if (r.finalResult) {
            _finish();
          } else if (words.isNotEmpty) {
            if (isEnough?.call(words) ?? false) {
              stop();
            } else {
              _silenceTimer?.cancel();
              _silenceTimer = Timer(_silence, stop);
            }
          }
        },
        listenOptions: SpeechListenOptions(
          localeId: localeId,
          partialResults: true,
          cancelOnError: true,
          listenMode: ListenMode.dictation,
          listenFor: const Duration(seconds: 15),
          pauseFor: const Duration(seconds: 3),
        ),
      );
      _startTimer = Timer(const Duration(seconds: 4), () {
        if (!_armed) _finish();
      });
    } catch (_) {
      _finish();
    }
    return done.future.timeout(
      const Duration(seconds: 20),
      onTimeout: () {
        _stt.cancel();
        return _last;
      },
    );
  }

  void _finish() {
    _graceTimer?.cancel();
    _silenceTimer?.cancel();
    _startTimer?.cancel();
    final p = _pending;
    if (p == null || p.isCompleted) return;
    _pending = null;
    p.complete(_last);
  }

  /// Berhenti mendengar; hasil yang sudah terdengar tetap dinilai.
  Future<void> stop() async {
    try {
      await _stt.stop();
    } catch (_) {}
  }

  Future<void> cancel() async {
    try {
      if (_stt.isListening) await _stt.cancel();
    } catch (_) {}
    _finish();
  }
}
