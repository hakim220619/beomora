import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const _kUiLang = 'ui_lang';
  static const _kTheme = 'theme_mode';
  static const _kSound = 'sound_on';
  static const _kOnboarded = 'onboarded';

  final SharedPreferences _prefs;

  String _uiLang;
  ThemeMode _themeMode;
  bool _soundOn;
  bool _onboarded;

  SettingsProvider(this._prefs)
      : _uiLang = _prefs.getString(_kUiLang) ?? 'id',
        _themeMode = _readTheme(_prefs),
        _soundOn = _prefs.getBool(_kSound) ?? true,
        _onboarded = _prefs.getBool(_kOnboarded) ?? false;

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
}
