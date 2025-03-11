import 'package:flutter/material.dart';

class ThemeManager {
  static Color primaryColor = const Color(0xff004182);
  static Color blackColor = const Color(0xff000000);
  static Color whiteColor = const Color(0xffffffff);

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
        iconTheme: IconThemeData(color: primaryColor)),
    textTheme: TextTheme(
      titleMedium: TextStyle(
          color: whiteColor, fontSize: 20, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          color: blackColor, fontSize: 18, fontWeight: FontWeight.w300),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      elevation: 0,
      unselectedIconTheme: IconThemeData(
        color: whiteColor
      ),
      // selectedIconTheme: IconThemeData(
      //   color: primaryColor
      // )
    ),
  );
}
