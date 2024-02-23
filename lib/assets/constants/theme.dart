import 'package:flutter/material.dart';

class AppTheme {
  static txtStyles() => ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          )
        ),
      );
}
