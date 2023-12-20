import 'package:flutter/material.dart';
import 'package:productive/assets/constants/colors.dart';

class AppTheme {
  static darkTheme() => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: textButtonColor,
        )),
        fontFamily: 'Barlow',
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        drawerTheme: const DrawerThemeData(
          backgroundColor: scaffoldBackgroundColor,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: appBarColor),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: scaffoldBackgroundColor,
          onPrimary: onPrimaryColor,
          secondary: secondaryColor,
          onSecondary: onPrimaryColor,
          error: errorColor,
          onError: onPrimaryColor,
          background: scaffoldBackgroundColor,
          onBackground: onPrimaryColor,
          surface: scaffoldBackgroundColor,
          onSurface: onPrimaryColor,
        ),
      );
}
