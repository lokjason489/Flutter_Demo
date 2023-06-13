import 'package:flutter/material.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

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
