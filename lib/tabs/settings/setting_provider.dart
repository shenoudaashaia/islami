import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String language = "en";

  bool get isDark => themeMode == ThemeMode.dark;

  String get BackgroundImagePath =>
      isDark ? 'assets/images/dark_bg.png' : 'assets/images/default_bg.png';

  void changeThemMode(ThemeMode selectedThemMode) {
    themeMode = selectedThemMode;
    notifyListeners();
  }

  void changeLanguage(SelectedLanguage) {
    language = SelectedLanguage;
    notifyListeners();
  }
}
