import 'package:flutter/material.dart';

class ThemeValues {
  
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorSchemeSeed: Colors.green,

    appBarTheme: const AppBarTheme(
      // backgroundColor: Colors.green,
      // foregroundColor: Colors.white,
      // color: Theme.of(context).colorScheme.primary,,
      titleTextStyle: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w800
      )
    ),

  );

}