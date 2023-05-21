import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationController extends GetxController {
  late Locale _lang = TranslationService.fallbackLocale;
  late SharedPreferences prefs;

  Locale get currLang => _lang;

  @override
  Future<void> onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    Get.put(TranslationService());
    String? lang = prefs.getString('language');
    if (lang == null) {
      _lang = TranslationService.fallbackLocale;
      await prefs.setString('language', _lang.languageCode);
      setLocale(_lang);
    } else {
      _lang = Locale(lang);
      setLocale(_lang);
    }
  }

  void setLocale(Locale value) async {
    _lang = value;
    final pref = await SharedPreferences.getInstance();
    await pref.setString('language', value.languageCode);
    Get.updateLocale(value);
    Get.find<TranslationService>().setLocale(value, pref);
    update();
  }

  Future<void> getLocale() async {
    String? lang = prefs.getString('language');
    if (lang == null) {
      _lang = TranslationService.fallbackLocale;
    } else {
      _lang = Locale(lang);
    }
  }
}

class TranslationService extends Translations {
  static const fallbackLocale = Locale('en', 'US');
  static final locales = [
    const Locale('en', 'US'),
    const Locale('sc', 'ZH'),
    const Locale('tc', 'ZH'),
  ];

  final _box = GetStorage();

  Future<void> onInit() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? lang = _box.read('language');
    if (lang == null) {
      lang = fallbackLocale.languageCode;
      await _box.write('language', lang);
    }
    final locale = Locale(lang);
    Get.updateLocale(locale);
    await setLocale(locale, _prefs);
  }

  Future<void> setLocale(Locale locale, SharedPreferences prefs) async {
    final langCode = locale.languageCode;
    Get.updateLocale(locale);
    await prefs.setString('language', langCode);
  }

  final Map<String, String> en = {
    "title": "Hello",
    "subtitle": "Welcome to my app",
    "darkMore": "Dark mode",
    "language": "Language",
    "notification": "Notification",
    "setting": "Setting",
    "showDialog": "Show Dialog",
  };

  final Map<String, String> tc = {
    "title": "你好",
    "subtitle": "歡迎使用我的應用程序",
    "darkMore": "深色模式",
    "language": "語言",
    "notification": "通知",
    "setting": "設置",
    "showDialog": "顯示對話框",
  };

  final Map<String, String> sc = {
    "title": "你好",
    "subtitle": "欢迎使用我的应用程序",
    "darkMore": "深色模式",
    "language": "语言",
    "notification": "通知",
    "setting": "设置",
    "showDialog": "显示对话框",
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'tc_ZH': tc,
        'sc_ZH': sc,
      };
}
