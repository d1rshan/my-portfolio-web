import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Colors.grey.shade900,
  colorScheme: ColorScheme.dark(),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 220,
      fontWeight: FontWeight.bold,
      letterSpacing: -14,
    ),
    displayMedium: TextStyle(
      fontSize: 110,
      // fontWeight: FontWeight.bold,
      letterSpacing: -7,
    ),
    displaySmall: TextStyle(
      color: Colors.grey.shade700,
      fontSize: 40,
      letterSpacing: -2,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey.shade700,
      fontSize: 22,
      // fontWeight: FontWeight.w600,
    ),
  ),
);

final lightTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.white,
    tertiary: Colors.grey.shade500,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 220,
      fontWeight: FontWeight.bold,
      letterSpacing: -14,
    ),
    displayMedium: TextStyle(
      fontSize: 100,
      letterSpacing: -4,
    ),
    displaySmall: TextStyle(
      color: Colors.grey.shade700,
      fontSize: 40,
      letterSpacing: -2,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 22,
    ),
  ),
);
