import 'dart:math';

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
      fontWeight: FontWeight.bold,
      letterSpacing: -14,
    ),
    titleMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 22,
      color: Colors.grey.shade800,
    ),
  ),
);

TextStyle sectionHeadingStyle(Size screen) {
  return TextStyle(
    color: Colors.black,
    letterSpacing: -4,
    fontWeight: FontWeight.w500,
    fontSize: min(screen.width * 0.14, 104),
  );
}
