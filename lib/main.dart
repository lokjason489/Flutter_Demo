import 'package:flutter/material.dart';
import 'package:macau_exam/theme.dart';
import 'package:macau_exam/footer.dart';
import 'package:macau_exam/home.dart';
import 'package:macau_exam/testpage.dart';
import 'package:macau_exam/settings.dart';
import 'package:macau_exam/profile.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: myTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: PageView(
          controller: _pageController,
          children: const [
            HomePage(),
            TestPage(),
            SettingsPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: MyFooter(pageController: _pageController),
      ),
    );
  }
}
