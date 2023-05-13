import 'package:flutter/material.dart';
import 'package:macau_exam/home.dart';
import 'package:macau_exam/theme.dart';
import 'package:macau_exam/testpage.dart';
import 'package:macau_exam/settings.dart';
import 'package:macau_exam/profile.dart';

class NavigationItem {
  final String title;
  final IconData icon;
  final Widget content;

  NavigationItem(
      {required this.title, required this.icon, required this.content});
}

final List<NavigationItem> navigationItems = [
  NavigationItem(
      title: '主頁', icon: Icons.home_outlined, content: const HomePage()),
  NavigationItem(
      title: '測試', icon: Icons.edit_square, content: const TestPage()),
  NavigationItem(
      title: '設定', icon: Icons.reset_tv_rounded, content: const SettingsPage()),
  NavigationItem(
      title: '我', icon: Icons.person_outline, content: const ProfilePage()),
];

class MyFooter extends StatefulWidget {
  final PageController pageController;
  const MyFooter({Key? key, required this.pageController}) : super(key: key);
  @override
  _MyFooterState createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //check is not mobile than the icon and text will be bigger and in the same line
    if (screenWidth > 500) {
      return SizedBox(
        height: 60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
          currentIndex: _selectedIndex,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              widget.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          items: [
            for (var item in navigationItems)
              BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.title,
                tooltip: item.title,
              ),
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 55,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
          currentIndex: _selectedIndex,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          landscapeLayout: navigationItems.length > 3
              ? BottomNavigationBarLandscapeLayout.linear
              : BottomNavigationBarLandscapeLayout.centered,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              widget.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          items: [
            for (var item in navigationItems)
              BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.title,
                tooltip: item.title,
              ),
          ],
        ),
      );
    }
  }
}
