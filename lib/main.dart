import 'package:flutter/material.dart';
import 'package:macau_exam/theme.dart';
import 'package:macau_exam/footer.dart';
import 'package:macau_exam/home.dart';
import 'package:macau_exam/examPage.dart';
import 'package:macau_exam/settings.dart';
import 'package:macau_exam/profile.dart';
import 'package:macau_exam/themeProvider.dart';
import 'package:provider/provider.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

const int maxFailedLoadAttempts = 3;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static of(BuildContext context) {}
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController(initialPage: 0);
  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      home: Scaffold(
        body: PageView(
          key: const Key('pageView'),
          controller: _pageController,
          // physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            ExamPage(),
            SettingsPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: MyFooter(
            pageController: _pageController, currentIndex: _currentIndex),
      ),
    );
  }
}
