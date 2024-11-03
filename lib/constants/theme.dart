import 'package:flutter/material.dart';

class ChatGPTTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: _Colors.primaryGreen,
      scaffoldBackgroundColor: _Colors.lightGray,
      backgroundColor: _Colors.lightGray,
      textTheme: _textThemeLight,
      appBarTheme: const AppBarTheme(
        color: _Colors.darkCharcoal,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: _Colors.accentBlue,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(
        color: _Colors.primaryGreen,
      ),
      cardColor: Colors.white,
      dividerColor: _Colors.lightGray,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: _Colors.lightGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: _Colors.accentBlue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: _Colors.lightGray),
        ),
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _Colors.primaryGreen,
      scaffoldBackgroundColor: _Colors.darkCharcoal,
      backgroundColor: _Colors.darkCharcoal,
      textTheme: _textThemeDark,
      appBarTheme: const AppBarTheme(
        color: _Colors.darkCharcoal,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: _Colors.primaryGreen,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(
        color: _Colors.primaryGreen,
      ),
      cardColor: _Colors.lightGray,
      dividerColor: _Colors.mutedBlue,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _Colors.darkCharcoal,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _Colors.primaryGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _Colors.primaryGreen, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _Colors.mutedBlue),
        ),
        hintStyle: TextStyle(color: Colors.grey[300]),
      ),
    );
  }

  static TextTheme get _textThemeLight => TextTheme(
        displayLarge:
            const TextStyle(color: _Colors.darkCharcoal, fontSize: 32),
        bodyLarge: const TextStyle(color: _Colors.mutedBlue, fontSize: 16),
        bodyMedium:
            TextStyle(color: _Colors.mutedBlue.withOpacity(0.7), fontSize: 14),
      );

  static TextTheme get _textThemeDark => TextTheme(
        displayLarge: const TextStyle(color: Colors.white, fontSize: 32),
        bodyLarge: const TextStyle(color: Colors.white, fontSize: 16),
        bodyMedium:
            TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
      );
}

class _Colors {
  static const Color darkCharcoal = Color(0xFF202123);
  static const Color lightGray = Color(0xFFF0F0F0);
  static const Color primaryGreen = Color(0xFF00A67E);
  static const Color mutedBlue = Color(0xFF3E4E63);
  static const Color accentBlue = Color(0xFF10A37F);
}
