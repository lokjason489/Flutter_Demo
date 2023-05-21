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

// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
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

  @override
  void initState() {
    super.initState();
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
      fallbackLocale: const Locale('en', 'US'),
      translations: TranslationService(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: SafeArea(
          child: PageView(
            key: const Key('pageView'),
            controller: _pageController,
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
