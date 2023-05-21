import 'package:flutter/material.dart';
import 'package:macau_exam/home.dart';
import 'package:macau_exam/ExamPage.dart';
import 'package:macau_exam/settings.dart';
import 'package:macau_exam/profile.dart';
import 'package:get/get.dart';

class NavigationItem {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  final Widget content;

  NavigationItem(
      {required this.title,
      required this.icon,
      required this.activeIcon,
      required this.content});
}

final List<NavigationItem> navigationItems = [
  NavigationItem(
      title: '主頁',
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      content: const HomePage()),
  NavigationItem(
      title: '測試',
      icon: Icons.edit_calendar_outlined,
      activeIcon: Icons.edit_calendar_rounded,
      content: const ExamPage()),
  NavigationItem(
      title: '設定',
      icon: Icons.read_more_outlined,
      activeIcon: Icons.read_more_rounded,
      content: const SettingsPage()),
  NavigationItem(
      title: '我',
      icon: Icons.person_outlined,
      activeIcon: Icons.person_rounded,
      content: const ProfilePage()),
];

class MyFooter extends StatefulWidget {
  final int currentIndex;
  const MyFooter({Key? key, required this.currentIndex}) : super(key: key);
  @override
  _MyFooterState createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  int _selectedIndex = 0;
  final PageController _pageController = Get.find<PageController>();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
    _pageController.addListener(_handlePageViewChange);
  }

  void _handlePageViewChange() {
    setState(() {
      _selectedIndex = _pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //check is not mobile than the icon and text will be bigger and in the same line
    return SizedBox(
      height: screenWidth > 500 ? 65 : 60,
      child: NavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Theme.of(context).colorScheme.background,
        indicatorColor: Theme.of(context).colorScheme.onSecondary,
        surfaceTintColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Theme.of(context).colorScheme.secondaryContainer,
        selectedIndex: _selectedIndex,
        labelBehavior: screenWidth > 500
            ? NavigationDestinationLabelBehavior.alwaysShow
            : NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) {
          setState(() {
            // _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        destinations: navigationItems
            .map(
              (e) => NavigationDestination(
                  icon: Icon(e.icon,
                      color: Theme.of(context).colorScheme.onPrimary),
                  selectedIcon: Icon(e.activeIcon,
                      color: Theme.of(context).colorScheme.primary),
                  tooltip: e.title,
                  label: e.title),
            )
            .toList(),
      ),
      // Positioned(
      //   top: 0,
      //   left: screenWidth / navigationItems.length * _selectedIndex,
      //   width: screenWidth / navigationItems.length,
      //   child: Container(
      //     height: 2,
      //     color: Theme.of(context).colorScheme.onPrimary,
      //   ),
      // ),
    );
  }
}
