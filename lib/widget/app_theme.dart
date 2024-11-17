import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff39A552);
  static const Color backgroundLight = Colors.white;
  static const Color black = Color(0xff303030);
  static const Color lightBlack = Color(0xff545A69);
  static const Color white = Color(0xffffffff);
  static const Color gray = Color(0xffCBC9CB);
  static const Color red = Color(0xffC91C22);
  static const Color blue = Color(0xff003E90);
  static const Color pink = Color(0xffED1E79);
  static const Color brown = Color(0xffCF7E48);
  static const Color yellow = Color(0xffF2D352);
  static const Color lightBlue = Color(0xff4882CF);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primary,
    appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        ),
        titleTextStyle:
            TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: white)),
    textTheme: TextTheme(
        titleLarge:
            TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: white)),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: black,
      foregroundColor: white,
    ),
  );
}
