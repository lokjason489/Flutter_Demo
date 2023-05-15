import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Color(0xFF93c4fd), // primary color
    primaryContainer: Color(0xFF7ab1f5),
    secondary: Color(0xFFeef2ff), // secondary color
    secondaryContainer: Color(0xFF7a75f5),
    background: Color(0xFFFFFFFF), // background color (light grey)
    surface: Color(0xFFF2F2F2), // surface color (white)
    error: Color(0xFFE53935), // error color (red)
    onPrimary: Color(0xFF93c5fd), // on primary color (black)
    onSecondary:
        Color.fromARGB(255, 200, 208, 238), // on secondary color (white)
    onSurface: Color(0xFF333333), // on surface color (dark grey)
    onBackground: Color(0xFF333333), // on background color (dark grey)
    onError: Color(0xFFFFFFFF), // on error color (white)
    brightness: Brightness.light,
  ),
  // colorScheme: const ColorScheme(
  //   primary: Color(0xFF93c4fd), // primary color (rgb 165 243 252)
  //   primaryContainer: Color(0xFF75E4F2),
  //   secondary: Color(0xFF7ab1f5), // secondary color (purple)
  //   secondaryContainer: Color(0xFF0060A3),
  //   surface: Color(0xFFF2F2F2), // surface color (light grey)
  //   background: Color(0xFFFFFFFF), // background color (white)
  //   error: Color(0xFFE53935), // error color (red)
  //   onPrimary: Color(0xFFFFFFFF), // on primary color (white)
  //   onSecondary: Color(0xFF000000), // on secondary color (black)
  //   onSurface: Color(0xFF333333), // on surface color (dark grey)
  //   onBackground: Color(0xFF333333), // on background color (dark grey)
  //   onError: Color(0xFFFFFFFF), // on error color (white)
  //   brightness: Brightness.light,
  // ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(0, 0, 0, 0),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Color(0xFF93c4fd), // primary color
    primaryContainer: Color(0xFF7ab1f5),
    secondary: Color(0xFFeef2ff), // secondary color
    secondaryContainer: Color(0xFF7a75f5),
    background: Color(0xFF222222), // background color (dark grey)
    surface: Color(0xFF333333), // surface color (grey)
    error: Color(0xFFE53935), // error color (red)
    onPrimary: Color(0xFFFFFFFF), // on primary color (white)
    onSecondary: Color.fromARGB(255, 86, 85, 85), // on secondary color (black)
    onSurface: Color(0xFFF6F6F6), // on surface color (light grey)
    onBackground: Color(0xFFF6F6F6), // on background color (light grey)
    onError: Color(0xFFFFFFFF), // on error color (white)
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(0, 0, 0, 0),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF212121),
  useMaterial3: true,
);
