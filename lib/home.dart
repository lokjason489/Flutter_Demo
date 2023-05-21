import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macau_exam/dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void Function() onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => MyDialog(
        title: 'My Dialog',
        message:
            'Use showDialog with Dialog.fullscreen, AlertDialog, or SimpleDialog',
        positiveButtonText: 'OK',
        onPositivePressed: () => Navigator.of(context).pop(),
      ),
    );
    return () {};
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('title'.tr, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text(
            'subtitle'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () => onPressed(context),
            child: Text(
              'showDialog'.tr,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
