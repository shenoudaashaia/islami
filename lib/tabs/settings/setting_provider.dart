import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  String language = "en";
  SharedPreferences? prefs;

  bool get isDark => theme == ThemeMode.dark;

  String get BackgroundImagePath =>
      isDark ? 'assets/images/dark_bg.png' : 'assets/images/default_bg.png';

  void changeThemMode(ThemeMode selectedThemMode) {
    theme = selectedThemMode;
    setThemeToCash(selectedThemMode);
    loadTheme();
    notifyListeners();
  }

  void changeLanguage(SelectedLanguage) {
    language = SelectedLanguage;
    setllanguageToCash(SelectedLanguage);
    notifyListeners();
  }

  Future setThemeToCash(ThemeMode selectedThemMode) async {
    prefs = await SharedPreferences.getInstance();
    String themeName = selectedThemMode == ThemeMode.light ? 'light' : 'dark';
    await prefs!.setString('theme', themeName);
  }

  loadTheme() async {
    prefs = await SharedPreferences.getInstance();
    String? themeName = prefs!.getString('theme');
    if (themeName != null) {
      theme = themeName == 'light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }

  Future setllanguageToCash(SelectedLanguage) async {
    prefs = await SharedPreferences.getInstance();
    String LanguageName = SelectedLanguage == "en" ? 'en' : 'ar';
    await prefs!.setString('Language', LanguageName);
  }

  loadlanguage() async {
    prefs = await SharedPreferences.getInstance();
    String? LanguageName = prefs!.getString('Language');
    if (LanguageName != null) {
      language = LanguageName == 'en' ? 'en' : "ar";
      notifyListeners();
    }
  }
}
