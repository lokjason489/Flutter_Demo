import 'package:flutter/material.dart';
import 'package:macau_exam/theme.dart';
import 'package:macau_exam/footer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '設定',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
