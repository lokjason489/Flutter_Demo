import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/index.dart';

ThemeData getLightTheme(String lang) {
  return ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xFF8fb4ff), // primary color
      primaryContainer: Color(0xFF7ab1f5),
      secondary: Color(0xFFebf1ff), // secondary color (light blue)
      secondaryContainer: Color(0xFFDBF3FD),
      tertiary: Color(0xFF672bde),
      background: Color(0xFFFFFFFF), // background color (white)
      surface: Color(0xFFF2F2F2), // surface color (white)
      error: Color(0xFFE53935), // error color (red)
      onPrimary: Color(0xFF333333), // on primary color (dark grey)
      onSecondary: Color(0xFF333333), // on secondary color (dark grey)
      onSurface: Color(0xFF333333), // on surface color (dark grey)
      onBackground: Color(0xFF333333), // on background color (dark grey)
      onError: Color(0xFFFFFFFF), // on error color (white)
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: Colors.black,
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headlineSmall: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.black,
        fontSize: 18,
      ),
      titleLarge: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.black,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.grey[800],
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.grey[600],
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.grey[800],
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.grey[600],
        fontSize: 14,
      ),
    ),
    fontFamily: 'Sniglet',
    fontFamilyFallback: ['Sniglet'],
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
  );
}

ThemeData getDarkTheme(String lang) {
  return ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xFF93c4fd), // primary color
      primaryContainer: Color(0xFF7ab1f5),
      secondary: Color(0xFFB3D4E0), // secondary color (light blue)
      secondaryContainer: Color(0xFF355263),
      background: Color(0xFF333333), // background color (dark grey)
      surface: Color(0xFFF6F6F6), // surface color (light grey)
      error: Color(0xFFE53935), // error color (red)
      onPrimary: Color(0xFFFFFFFF), // on primary color (white)
      onSecondary:
          Color.fromARGB(255, 86, 85, 85), // on secondary color (dark grey)
      onSurface: Color(0xFFE6E6E6), // on surface color (light grey)
      onBackground: Color(0xFFFFFFFF), // on background color (white)
      onError: Color(0xFFFFFFFF), // on error color (white)
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headlineSmall: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.white,
        fontSize: 18,
      ),
      titleLarge: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.white,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.grey[400],
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.grey[500],
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.grey[400],
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        fontFamily: lang == 'tc'
            ? 'SNsanafonmaru'
            : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
        color: Colors.grey[500],
        fontSize: 14,
      ),
    ),
    fontFamily: lang == 'tc'
        ? 'SNsanafonmaru'
        : (lang == "sc" ? 'MaShanZheng' : "Sniglet"),
    fontFamilyFallback: ['Sniglet'],
    scaffoldBackgroundColor: const Color(0xFF333333),
    useMaterial3: true,
  );
}

final TranslationController _translationController =
    Get.put(TranslationController());

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Color(0xFF8fb4ff), // primary color
    primaryContainer: Color(0xFF7ab1f5),
    secondary: Color(0xFFebf1ff), // secondary color (light blue)
    secondaryContainer: Color(0xFFDBF3FD),
    tertiary: Color(0xFF672bde),
    background: Color(0xFFFFFFFF), // background color (white)
    surface: Color(0xFFF2F2F2), // surface color (white)
    error: Color(0xFFE53935), // error color (red)
    onPrimary: Color(0xFF333333), // on primary color (dark grey)
    onSecondary: Color(0xFF333333), // on secondary color (dark grey)
    onSurface: Color(0xFF333333), // on surface color (dark grey)
    onBackground: Color(0xFF333333), // on background color (dark grey)
    onError: Color(0xFFFFFFFF), // on error color (white)
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(0, 0, 0, 0),
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black,
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headlineSmall: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.black,
      fontSize: 18,
    ),
    titleLarge: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyLarge: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.black,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.grey[800],
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.grey[600],
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.grey[800],
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.grey[600],
      fontSize: 14,
    ),
  ),
  fontFamily: 'Sniglet',
  fontFamilyFallback: ['Sniglet'],
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Color(0xFF93c4fd), // primary color
    primaryContainer: Color(0xFF7ab1f5),
    secondary: Color(0xFFB3D4E0), // secondary color (light blue)
    secondaryContainer: Color(0xFF355263),
    background: Color(0xFF333333), // background color (dark grey)
    surface: Color(0xFFF6F6F6), // surface color (light grey)
    error: Color(0xFFE53935), // error color (red)
    onPrimary: Color(0xFFFFFFFF), // on primary color (white)
    onSecondary:
        Color.fromARGB(255, 86, 85, 85), // on secondary color (dark grey)
    onSurface: Color(0xFFE6E6E6), // on surface color (light grey)
    onBackground: Color(0xFFFFFFFF), // on background color (white)
    onError: Color(0xFFFFFFFF), // on error color (white)
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(0, 0, 0, 0),
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headlineSmall: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.white,
      fontSize: 18,
    ),
    titleLarge: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyLarge: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.white,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.grey[400],
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.grey[500],
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.grey[400],
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      fontFamily: _translationController.currLang.languageCode == 'tc'
          ? 'SNsanafonmaru'
          : (_translationController.currLang.languageCode == "sc"
              ? 'MaShanZheng'
              : "Sniglet"),
      color: Colors.grey[500],
      fontSize: 14,
    ),
  ),
  fontFamily: 'Sniglet',
  fontFamilyFallback: ['Sniglet'],
  scaffoldBackgroundColor: const Color(0xFF333333),
  useMaterial3: true,
);
