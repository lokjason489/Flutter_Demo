import 'package:flutter/material.dart';
import 'package:macau_exam/appSetting.dart';
import 'package:macau_exam/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveThemeData(bool isDarkModeEnabled) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isDarkModeEnabled', isDarkModeEnabled);
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 150),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const AppSetting(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var tween = Tween(begin: begin, end: end);
                  var curvedAnimation = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  );
                  return SlideTransition(
                    position: tween.animate(curvedAnimation),
                    child: child,
                  );
                },
              ),
            );
          },
          icon: Icon(Icons.settings,
              color: Theme.of(context).colorScheme.onPrimary, size: 28),
        ),
        actions: [
          if (Theme.of(context).brightness == Brightness.light)
            IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(value: true);
                },
                icon: Icon(Icons.dark_mode,
                    color: Theme.of(context).colorScheme.onPrimary)),
          if (Theme.of(context).brightness == Brightness.dark)
            IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(value: false);
                },
                icon: Icon(Icons.light_mode,
                    color: Theme.of(context).colorScheme.onPrimary))
        ],
      ),
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'john.doe@example.com',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 10),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec lectus eget est consequat bibendum. Nullam tincidunt neque vel vulputate finibus. Fusce auctor, augue a lacinia elementum, felis quam tempus turpis, id bibendum quam massa vel ex. Duis ut nibh non mi varius faucibus.',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
