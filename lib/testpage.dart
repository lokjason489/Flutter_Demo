import 'package:flutter/material.dart';
import 'package:macau_exam/theme.dart';
import 'package:macau_exam/footer.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '測試',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
