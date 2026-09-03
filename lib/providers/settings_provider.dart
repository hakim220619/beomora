import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const _kUiLang = 'ui_lang';
  static const _kTheme = 'theme_mode';
  static const _kSound = 'sound_on';
  static const _kOnboarded = 'onboarded';
  static const _kReminderOn = 'reminder_on';
  static const _kReminderHour = 'reminder_hour';
  static const _kReminderMinute = 'reminder_minute';
  static const _kShowIcons = 'show_icons';

  final SharedPreferences _prefs;

  String _uiLang;
  ThemeMode _themeMode;
  bool _soundOn;
  bool _onboarded;
  bool _reminderOn;
  int _reminderHour;
  int _reminderMinute;
  bool _showIcons;

  SettingsProvider(this._prefs)
      : _uiLang = _prefs.getString(_kUiLang) ?? 'id',
        _themeMode = _readTheme(_prefs),
        _soundOn = _prefs.getBool(_kSound) ?? true,
        _onboarded = _prefs.getBool(_kOnboarded) ?? false,
        _reminderOn = _prefs.getBool(_kReminderOn) ?? true,
        _reminderHour = _prefs.getInt(_kReminderHour) ?? 19,
        _reminderMinute = _prefs.getInt(_kReminderMinute) ?? 0,
        _showIcons = _prefs.getBool(_kShowIcons) ?? false;

  /// Tema hanya dua pilihan: terang (siang) atau gelap (malam).
  /// Nilai lama "system" dipetakan ke terang.
  static ThemeMode _readTheme(SharedPreferences prefs) {
    final index = prefs.getInt(_kTheme);
    final mode =
        index == null ? ThemeMode.light : ThemeMode.values[index];
    return mode == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light;
  }

  String get uiLang => _uiLang;
  ThemeMode get themeMode => _themeMode;
  bool get soundOn => _soundOn;
  bool get onboarded => _onboarded;
  bool get reminderOn => _reminderOn;
  TimeOfDay get reminderTime =>
      TimeOfDay(hour: _reminderHour, minute: _reminderMinute);

  /// Emoji hiasan di layar Belajar & Latihan (default: sembunyi).
  bool get showIcons => _showIcons;

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

  void setOnboarded() {
    _onboarded = true;
    _prefs.setBool(_kOnboarded, true);
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
