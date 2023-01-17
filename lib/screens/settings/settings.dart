import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/settings_button/settings_button.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List<Widget> _settings = [
    aboutApp('App Name', 'IP_SD'),
    aboutApp('App Version', '0.3.1')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _settings.length,
      itemBuilder: (context, index) => _settings[index],
    );
  }
}
