import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const _kUiLang = 'ui_lang';
  static const _kTheme = 'theme_mode';
  static const _kSound = 'sound_on';
  static const _kReminderOn = 'reminder_on';
  static const _kReminderHour = 'reminder_hour';
  static const _kReminderMinute = 'reminder_minute';
  static const _kShowIcons = 'show_icons';
  static const _kHandwriting = 'handwriting_on';
  static const _kHandwritingWifi = 'handwriting_wifi_only';
  static const _kPlaySpeed = 'vocab_play_speed_x';
  static const _kPlayShuffle = 'vocab_play_shuffle';
  static const _kSpellMode = 'vocab_quiz_spell';
  static const _kStarred = 'vocab_starred_'; // + id kursus

  final SharedPreferences _prefs;

  String _uiLang;
  ThemeMode _themeMode;
  bool _soundOn;
  bool _reminderOn;
  int _reminderHour;
  int _reminderMinute;
  bool _showIcons;
  bool _handwritingOn;
  bool _handwritingWifiOnly;
  double _playSpeed;

  SettingsProvider(this._prefs)
    : _uiLang = _prefs.getString(_kUiLang) ?? 'id',
      _themeMode = _readTheme(_prefs),
      _soundOn = _prefs.getBool(_kSound) ?? true,
      _reminderOn = _prefs.getBool(_kReminderOn) ?? true,
      _reminderHour = _prefs.getInt(_kReminderHour) ?? 19,
      _reminderMinute = _prefs.getInt(_kReminderMinute) ?? 0,
      _showIcons = _prefs.getBool(_kShowIcons) ?? false,
      _handwritingOn = _prefs.getBool(_kHandwriting) ?? false,
      _handwritingWifiOnly = _prefs.getBool(_kHandwritingWifi) ?? true,
      _playSpeed = (_prefs.getDouble(_kPlaySpeed) ?? 1.0).clamp(0.5, 2.0);

  /// Tema hanya dua pilihan: terang (siang) atau gelap (malam).
  /// Bawaan (belum pernah memilih): gelap/papan tulis. Nilai lama
  /// "system" dipetakan ke terang.
  static ThemeMode _readTheme(SharedPreferences prefs) {
    final index = prefs.getInt(_kTheme);
    final mode = index == null ? ThemeMode.dark : ThemeMode.values[index];
    return mode == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light;
  }

  String get uiLang => _uiLang;
  ThemeMode get themeMode => _themeMode;
  bool get soundOn => _soundOn;
  bool get reminderOn => _reminderOn;
  TimeOfDay get reminderTime =>
      TimeOfDay(hour: _reminderHour, minute: _reminderMinute);

  /// Emoji hiasan di layar Belajar & Latihan (default: sembunyi).
  bool get showIcons => _showIcons;

  /// Fitur Tulis Huruf (pengenalan tulisan tangan). Disimpan per perangkat,
  /// tidak disinkron, karena modelnya ada di perangkat ini saja.
  bool get handwritingOn => _handwritingOn;

  /// Unduh model tulisan tangan hanya lewat Wi-Fi (default: ya).
  bool get handwritingWifiOnly => _handwritingWifiOnly;

  /// Kecepatan putar kosakata sebagai kelipatan normal (0.5×–2×).
  double get playSpeed => _playSpeed;

  /// Putar kosakata secara acak (true) atau urut dari atas (false).
  bool get playShuffle => _prefs.getBool(_kPlayShuffle) ?? false;

  void setPlayShuffle(bool on) {
    _prefs.setBool(_kPlayShuffle, on);
    notifyListeners();
  }

  /// Jenis soal Latihan Kosakata: susun huruf (true) / pilihan ganda.
  bool get vocabSpellMode => _prefs.getBool(_kSpellMode) ?? false;

  void setVocabSpellMode(bool on) {
    _prefs.setBool(_kSpellMode, on);
    notifyListeners();
  }

  void setPlaySpeed(double speed) {
    _playSpeed = speed.clamp(0.5, 2.0);
    _prefs.setDouble(_kPlaySpeed, _playSpeed);
    notifyListeners();
  }

  /// Kosakata berbintang per kursus (kata target, urut saat ditandai).
  /// Tampil sebagai bagian "Favorit" paling atas di Latihan Kosakata.
  List<String> starredWords(String courseId) =>
      _prefs.getStringList('$_kStarred$courseId') ?? const [];

  bool isStarred(String courseId, String word) =>
      starredWords(courseId).contains(word);

  void toggleStarred(String courseId, String word) {
    final list = [...starredWords(courseId)];
    list.contains(word) ? list.remove(word) : list.add(word);
    _prefs.setStringList('$_kStarred$courseId', list);
    notifyListeners();
  }

  /// Lepas bintang dari [words] sekaligus (tombol reset Favorit).
  void removeStarred(String courseId, Iterable<String> words) {
    final drop = words.toSet();
    final list = [
      for (final w in starredWords(courseId))
        if (!drop.contains(w)) w,
    ];
    _prefs.setStringList('$_kStarred$courseId', list);
    notifyListeners();
  }

  void setHandwritingOn(bool on) {
    _handwritingOn = on;
    _prefs.setBool(_kHandwriting, on);
    notifyListeners();
  }

  void setHandwritingWifiOnly(bool on) {
    _handwritingWifiOnly = on;
    _prefs.setBool(_kHandwritingWifi, on);
    notifyListeners();
  }

  void setUiLang(String lang) {
    _uiLang = lang;
    _prefs.setString(_kUiLang, lang);
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    _prefs.setInt(_kTheme, mode.index);
    notifyListeners();
  }

  void setSoundOn(bool on) {
    _soundOn = on;
    _prefs.setBool(_kSound, on);
    notifyListeners();
  }

  void setReminderOn(bool on) {
    _reminderOn = on;
    _prefs.setBool(_kReminderOn, on);
    notifyListeners();
  }

  void setShowIcons(bool on) {
    _showIcons = on;
    _prefs.setBool(_kShowIcons, on);
    notifyListeners();
  }

  void setReminderTime(TimeOfDay time) {
    _reminderHour = time.hour;
    _reminderMinute = time.minute;
    _prefs.setInt(_kReminderHour, time.hour);
    _prefs.setInt(_kReminderMinute, time.minute);
    notifyListeners();
  }
}
