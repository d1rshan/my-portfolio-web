import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 180,
      fontWeight: FontWeight.bold,
      letterSpacing: -14,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 145,
      fontWeight: FontWeight.bold,
      letterSpacing: -7,
    ),
    displaySmall: TextStyle(
      color: Colors.grey.shade200,
      fontSize: 40,
      letterSpacing: -2,
    ),
    bodyMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ),
);
final lightTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 220,
      fontWeight: FontWeight.bold,
      letterSpacing: -14,
    ),
    displayMedium: TextStyle(
      fontSize: 130,
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
