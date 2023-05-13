import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Colors.white,
    brightness: Brightness.light,
    secondary: Color(0xFF4D535E),
    background: Color(0xFFF2F2F2),
    surface: Colors.white,
    onPrimary: Color(0xFF067160),
    onSecondary: Color(0xFF4D535E),
    onBackground: Color(0xFFF2F2F2),
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  ),
  useMaterial3: true,
);
