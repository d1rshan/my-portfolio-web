import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.light(),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 330,
      fontWeight: FontWeight.bold,
      letterSpacing: -14,
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
