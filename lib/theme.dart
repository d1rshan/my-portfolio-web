import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.light(),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 180,
      fontWeight: FontWeight.bold,
      letterSpacing: -14,
      // shadows: [
      //   Shadow(
      //     blurRadius: 4.0,
      //     color: Colors.grey.shade900.withOpacity(0.7),
      //     offset: Offset(2, 2),
      //   ),
      //   Shadow(
      //     blurRadius: 6.0,
      //     color: Colors.black.withOpacity(0.4),
      //     offset: Offset(4, 4),
      //   ),
      // ],
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
