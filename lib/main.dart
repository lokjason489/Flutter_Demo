import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:macau_exam/theme.dart';
import 'common/components/index.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Controller/index.dart';
import 'package:permission_handler/permission_handler.dart';
import 'common/index.dart';
import 'pages/index.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  await GetStorage.init();
  await initializeDateFormatting();
  runApp(const MyApp());
}

const int maxFailedLoadAttempts = 3;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static of(BuildContext context) {}
}

final List<Widget> _page = [
  const HomePage(),
  const StickerPage(),
  const SettingsPage(),
  const ProfilePage(),
];

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final ThemeController _themeController = Get.put(ThemeController());
  final TranslationController _translationController =
      Get.put(TranslationController());
  late bool isAskedNotification;
  final _box = GetStorage();
  bool isReverse = false;

  @override
  void initState() {
    super.initState();
    isAskedNotification = _box.read('isAskedNotification') ?? false;
    if (!isAskedNotification) {
      Permission.notification.request().then((value) {
        _box.write('isAskedNotification', true);
      });
    }
  }

  Widget _buildLoading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: _translationController.currLang,
      fallbackLocale: _translationController.fallbackLocale,
      translations: TranslationService(),
      theme: getLightTheme(_translationController.currLang.languageCode),
      darkTheme: getDarkTheme(_translationController.currLang.languageCode),
      themeMode: _themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: PageTransitionSwitcher(
          reverse: isReverse,
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (
            Widget child,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
          ) =>
              SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          ),
          child: _page[_currentIndex],
        ),
        bottomNavigationBar: MyFooter(
          key: const Key("MyFooter"),
          onTabTapped: (index) {
            _currentIndex > index ? isReverse = true : isReverse = false;
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
