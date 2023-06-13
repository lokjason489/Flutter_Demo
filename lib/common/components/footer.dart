import 'package:flutter/material.dart';

class NavigationItem {
  final String title;
  final IconData icon;
  final IconData activeIcon;

  NavigationItem({
    required this.title,
    required this.icon,
    required this.activeIcon,
  });
}

final List<NavigationItem> navigationItems = [
  NavigationItem(
    title: '主頁',
    icon: Icons.home_outlined,
    activeIcon: Icons.home_rounded,
  ),
  NavigationItem(
    title: '測試',
    icon: Icons.edit_calendar_outlined,
    activeIcon: Icons.edit_calendar_rounded,
  ),
  NavigationItem(
    title: '設定',
    icon: Icons.read_more_outlined,
    activeIcon: Icons.read_more_rounded,
  ),
  NavigationItem(
    title: '我',
    icon: Icons.person_outlined,
    activeIcon: Icons.person_rounded,
  ),
];

class MyFooter extends StatefulWidget {
  final Function(int) onTabTapped;
  const MyFooter({Key? key, required this.onTabTapped}) : super(key: key);

  @override
  _MyFooterState createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //check is not mobile than the icon and text will be bigger and in the same line
    return SizedBox(
      height: screenWidth > 500 ? 65 : 60,
      child: NavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Theme.of(context).colorScheme.background,
        indicatorColor: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.secondary,
        selectedIndex: _selectedIndex,
        labelBehavior: screenWidth > 500
            ? NavigationDestinationLabelBehavior.alwaysShow
            : NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          widget.onTabTapped(index);
        },
        destinations: navigationItems
            .map(
              (e) => NavigationDestination(
                  icon: Icon(e.icon,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.4)),
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
