import 'package:flutter/material.dart';

class SettingsFunctions {
  static Widget settingsTheme = Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Dark Theme coming soon....'),
        GestureDetector(
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.blue),
          ),
          //onTap: () => Navigator.pop(context),
        )
      ],
    ),
  );
}
