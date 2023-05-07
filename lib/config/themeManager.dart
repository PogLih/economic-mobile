import 'package:flutter/material.dart';

class ThemeManager {
  static final Color primaryColor = Color.fromRGBO(248, 147, 0, 1);
  static final Color secondaryColor = Color.fromRGBO(250, 250, 250, 1);
  static final light = ThemeData();
  static final String font = 'NotoSans';
  static ThemeData lightTheme = light.copyWith(
      textTheme: TextTheme(
          labelLarge: TextStyle(
              fontFamily: font,
              color: secondaryColor,
              fontWeight: FontWeight.w700),
          headlineMedium: TextStyle(
              fontFamily: font,
              color: primaryColor,
              fontWeight: FontWeight.w700)),
      colorScheme: light.colorScheme.copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        brightness: Brightness.light,
      ));


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    accentColor: secondaryColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontFamily: font,
      ),
      button: TextStyle(
        color: Colors.black,
        fontFamily: font,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
