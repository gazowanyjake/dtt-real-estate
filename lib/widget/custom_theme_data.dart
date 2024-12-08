import 'package:flutter/material.dart';

class CustomThemeData {
  static const Color red = Color(0xFFE65541);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF7F7F7);
  static const Color darkGray = Color(0xFFEBEBEB);

  static const Color strongBlack = Color(0xCC000000);
  static const Color mediumBlack = Color(0x66000000);
  static const Color lightBlack = Color(0x33000000);

  static const String fontFamily = 'GothamSSm';

  static final ThemeData themeData = ThemeData(
    primaryColor: white,
    scaffoldBackgroundColor: lightGray,
    colorScheme: ColorScheme.light(
      primary: white,
      secondary: darkGray,
      surface: red,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        color: strongBlack,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        color: strongBlack,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500, // Medium
        color: strongBlack,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400, // Book
        color: mediumBlack,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w300, // Light
        color: mediumBlack,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w400, // Book
        color: lightBlack,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400, // Book
        color: lightBlack,
      ),
    ),
  );
}
