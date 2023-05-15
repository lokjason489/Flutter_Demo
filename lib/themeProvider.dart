import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> loadThemeData() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isDarkModeEnabled') ?? false;
}

Future<void> saveThemeData(bool isDarkModeEnabled) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isDarkModeEnabled', isDarkModeEnabled);
}

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider() {
    loadThemeData().then((value) {
      _isDarkMode = value;
      notifyListeners();
    });
  }

  bool get isDarkMode => _isDarkMode;

  void toggleTheme({required bool value}) {
    _isDarkMode = value;
    saveThemeData(_isDarkMode);
    notifyListeners();
  }
}
