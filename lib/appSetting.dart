import 'package:flutter/material.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined,
                size: 28, color: Theme.of(context).colorScheme.onPrimary),
          ),
          title: Text(
            '設定',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
            '設定',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ));
  }
}
