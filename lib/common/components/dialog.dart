import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  final String title;
  final String message;
  final String positiveButtonText;
  final String negativeButtonText;
  final VoidCallback onPositivePressed;
  final VoidCallback? onNegativePressed;

  const MyDialog({
    super.key,
    required this.title,
    required this.message,
    required this.positiveButtonText,
    required this.onPositivePressed,
    this.negativeButtonText = 'Cancel',
    this.onNegativePressed,
  });

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      title: Text(widget.title),
      content: Text(widget.message),
      backgroundColor: Theme.of(context).colorScheme.background,
      actions: <Widget>[
        TextButton(
          onPressed:
              widget.onNegativePressed ?? () => Navigator.of(context).pop(),
          child: Text(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
              ),
              widget.negativeButtonText),
        ),
        FilledButton(
          clipBehavior: Clip.antiAlias,
          autofocus: true,
          onPressed: widget.onPositivePressed,
          child: Text(
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
              ),
              widget.positiveButtonText),
        ),
      ],
    );
  }
}

void show(
    {required BuildContext context,
    required MyDialog Function(dynamic context) builder}) {
  showDialog(context: context, builder: builder);
}
