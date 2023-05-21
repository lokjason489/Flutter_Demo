import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  late final RxBool _isDarkMode;

  bool get isDarkMode => _isDarkMode.value;
  final _box = GetStorage();

  @override
  Future<void> onInit() async {
    _isDarkMode = false.obs;
    await loadThemeData();
    super.onInit();
  }

  Future<void> loadThemeData() async {
    bool? isDarkMode = _box.read('IsDarkModeEnabled');
    if (isDarkMode == null) {
      isDarkMode =
          SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      await _box.write('IsDarkModeEnabled', isDarkMode);
    }
    _isDarkMode.value = isDarkMode;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> saveThemeData(bool isDarkModeEnabled) async {
    await _box.write('IsDarkModeEnabled', isDarkModeEnabled);
  }

  Future<void> toggleTheme(bool value) async {
    _isDarkMode.value = value;
    await saveThemeData(_isDarkMode.value);
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
