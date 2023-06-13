import 'package:get/get.dart';
import 'package:macau_exam/pages/index.dart';
import 'index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(name: RouteNames.main, page: () => const HomePage()),
    GetPage(name: RouteNames.exam, page: () => const ExamPage()),
    GetPage(name: RouteNames.settings, page: () => const SettingsPage()),
    GetPage(name: RouteNames.profile, page: () => const ProfilePage()),
    GetPage(name: RouteNames.appSetting, page: () => const AppSetting()),
  ];
}
