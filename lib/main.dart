import 'package:flutter/material.dart';
import 'package:macau_exam/theme.dart';
import 'package:macau_exam/footer.dart';
import 'package:macau_exam/home.dart';
import 'package:macau_exam/examPage.dart';
import 'package:macau_exam/settings.dart';
import 'package:macau_exam/profile.dart';
import 'package:macau_exam/themeController.dart';
import 'package:get/get.dart';
import 'package:macau_exam/translationController.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

const int maxFailedLoadAttempts = 3;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static of(BuildContext context) {}
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController =
      Get.put(PageController(initialPage: 0));
  final int _currentIndex = 0;
  final ThemeController _themeController = Get.put(ThemeController());
  final TranslationController _translationController =
      Get.put(TranslationController());
  late bool isAskedNotification;
  final _box = GetStorage();

  @override
  void initState() {
    super.initState();
    isAskedNotification = _box.read('isAskedNotification') ?? false;
    if (!isAskedNotification) {
      Permission.notification.request().then((value) {
        _box.write('isAskedNotification', true);
        print(value);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      locale: _translationController.currLang,
      fallbackLocale: _translationController.fallbackLocale,
      translations: TranslationService(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: SafeArea(
          child: PageView(
            key: const Key('pageView'),
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              ExamPage(),
              SettingsPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: MyFooter(currentIndex: _currentIndex),
      ),
    );
  }
}
