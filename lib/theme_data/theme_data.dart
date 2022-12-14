import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.grey[800],

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(),
      type: BottomNavigationBarType.fixed
    )
  );
 
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryContainer: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    // textTheme: TextTheme(
    //   titleMedium: const TextStyle(
    //     color: Colors.white,
    //     fontSize: 20.0,
    //   ),
    //   subtitle1: const TextStyle(
    //     color: Colors.white70,
    //     fontSize: 18.0,
    //   ),
    // ),
  );

}