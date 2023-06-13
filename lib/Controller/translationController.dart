import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslationController extends GetxController {
  late Locale _lang = Get.locale ?? const Locale('en', 'US');

  Locale get fallbackLocale => TranslationService.fallbackLocale;
  Locale get currLang => _lang;
  late TranslationService _translationService;

  @override
  Future<void> onInit() async {
    super.onInit();
    await TranslationService().onInit();
    Get.put(TranslationService());
    _translationService = Get.find<TranslationService>();
  }

  Future<void> setLocale(Locale value) async {
    _lang = value;
    await _translationService.setLocale(value);
    update();
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
    String? lang = _box.read('language');
    if (lang == null) {
      _box.write('language', fallbackLocale.languageCode);
      lang = fallbackLocale.languageCode;
    }
    final locale = Locale(lang);
    Get.updateLocale(locale);
  }

  Future<void> setLocale(Locale locale) async {
    final langCode = locale.languageCode;
    Get.updateLocale(locale);
    await _box.write('language', langCode);
  }

  final Map<String, String> en = {
    "title": "Hello",
    "subtitle": "Welcome to my app",
    "darkMore": "Dark mode",
    "language": "Language",
    "notification": "Notification",
    "setting": "Setting",
    "showDialog": "Show Dialog",
    "month": "Month",
    "week": "Week",
    "twoWeeks": "2 Weeks",
  };

  final Map<String, String> tc = {
    "title": "你好",
    "subtitle": "歡迎使用我的應用程序",
    "darkMore": "深色模式",
    "language": "語言",
    "notification": "通知",
    "setting": "設置",
    "showDialog": "顯示對話框",
    "month": "月",
    "week": "星期",
    "twoWeeks": "2 星期",
  };

  final Map<String, String> sc = {
    "title": "你好",
    "subtitle": "欢迎使用我的应用程序",
    "darkMore": "深色模式",
    "language": "语言",
    "notification": "通知",
    "setting": "设置",
    "showDialog": "显示对话框",
    "month": "月",
    "week": "星期",
    "twoWeeks": "2 星期",
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'tc_ZH': tc,
        'sc_ZH': sc,
      };
}
