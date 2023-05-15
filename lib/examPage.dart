import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<ExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '測試',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
