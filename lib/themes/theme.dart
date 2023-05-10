import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color backgroundColor = Colors.white;
const Color hintTextColor = Colors.black54;
const Color accentColor = Colors.deepOrange;

var themeData = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: backgroundColor,
    elevation: 0,
    selectedItemColor: accentColor,
    unselectedItemColor: hintTextColor,
    type: BottomNavigationBarType.fixed,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: accentColor,
    elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: accentColor,
        statusBarIconBrightness: Brightness.dark,
      ),
  ),
  scaffoldBackgroundColor: backgroundColor,
);

