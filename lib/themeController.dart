// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  late final RxBool _isDarkMode;

  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    _isDarkMode = false.obs;
    loadThemeData();
    super.onInit();
  }

  void loadThemeData() async {
    final pref = await SharedPreferences.getInstance();
    final isDarkModeEnabled = pref.getBool('isDarkModeEnabled') ?? false;
    _isDarkMode.value = isDarkModeEnabled;
    Get.changeThemeMode(isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light);
  }

  void saveThemeData(bool isDarkModeEnabled) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isDarkModeEnabled', isDarkModeEnabled);
  }

  void toggleTheme(bool value) {
    _isDarkMode.value = value;
    saveThemeData(value);
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
