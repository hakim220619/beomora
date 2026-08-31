import 'package:flutter_tts/flutter_tts.dart';

/// Pembungkus flutter_tts: gagal diam-diam kalau engine/locale tak tersedia.
class TtsService {
  TtsService._();
  static final TtsService instance = TtsService._();

  final FlutterTts _tts = FlutterTts();
  String? _currentLocale;

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

  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (_) {}
  }
}
