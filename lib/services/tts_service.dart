import 'package:flutter_tts/flutter_tts.dart';

/// Dipanggil setiap engine mulai mengucapkan satu kata: [start]/[end]
/// adalah offset karakter (relatif ke teks yang diserahkan ke [speak]).
typedef TtsProgress = void Function(int start, int end);

/// Pembungkus flutter_tts: gagal diam-diam kalau engine/locale tak tersedia.
class TtsService {
  TtsService._() {
    try {
      _tts.setProgressHandler((_, start, end, _) {
        _onProgress?.call(start, end);
      });
    } catch (_) {
      // Handler tak bisa dipasang (plugin tidak ada) — abaikan.
    }
  }
  static final TtsService instance = TtsService._();

  final FlutterTts _tts = FlutterTts();
  String? _currentLocale;
  TtsProgress? _onProgress;

  Future<void> speak(String text, String locale) async {
    try {
      if (_currentLocale != locale) {
        await _tts.setLanguage(locale);
        _currentLocale = locale;
      }
      await _tts.setSpeechRate(0.45);
      await _tts.stop();
      await _tts.speak(text);
    } catch (_) {
      // TTS tidak tersedia di perangkat ini — abaikan.
    }
  }

  /// Bacakan teks panjang dan tunggu sampai selesai. [rate] 0.45 =
  /// normal (sama dengan [speak]), ~0.3 = lambat. [onProgress] dipanggil
  /// per kata yang diucapkan (Android API 26+ dan iOS; engine lain boleh
  /// tidak melapor sama sekali).
  ///
  /// Mengembalikan `false` kalau engine melapor ucapan TIDAK selesai
  /// (dihentikan lewat [stop], atau dibuang karena engine masih sibuk);
  /// `true` kalau selesai atau kalau TTS tidak tersedia sama sekali.
  Future<bool> speakAndWait(
    String text,
    String locale, {
    double rate = 0.45,
    TtsProgress? onProgress,
  }) async {
    _onProgress = onProgress;
    try {
      if (_currentLocale != locale) {
        await _tts.setLanguage(locale);
        _currentLocale = locale;
      }
      await _tts.setSpeechRate(rate);
      await _tts.stop();
      await _tts.awaitSpeakCompletion(true);
      final r = await _tts.speak(text);
      return r != 0;
    } catch (_) {
      // TTS tidak tersedia — anggap selesai agar UI tidak menggantung.
      return true;
    } finally {
      if (identical(_onProgress, onProgress)) _onProgress = null;
      try {
        await _tts.awaitSpeakCompletion(false);
      } catch (_) {}
    }
  }

  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (_) {}
  }
}
