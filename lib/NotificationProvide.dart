import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> loadNotification() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isEnableNotification') ?? false;
}

Future<void> saveNotification(bool isEnableNotification) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isEnableNotification', isEnableNotification);
}

class NotificationProvider extends ChangeNotifier {
  bool _isEnableNotification = false;

  NotificationProvider() {
    loadNotification().then((value) {
      _isEnableNotification = value;
      notifyListeners();
    });
  }

  bool get isEnableNotification => _isEnableNotification;

  void toggleNotification({required bool value}) {
    _isEnableNotification = value;
    saveNotification(_isEnableNotification);
    notifyListeners();
  }
}
