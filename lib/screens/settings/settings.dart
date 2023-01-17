import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/settings_button/settings_button.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List _settings = [
    'App Theme',
    'Source Code',
    'App Name',
    'App Version'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _settings.length,
        itemBuilder: (context, index) {

          String title = _settings[index];
          String subTitle = SettingsButton.buttons[title][0];
          
          return ListTile(
            title: Text(title),
            subtitle: Text(subTitle),
            onTap: (() {
              
            }),
          );
        });
  }
}
