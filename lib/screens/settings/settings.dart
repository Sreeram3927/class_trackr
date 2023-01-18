import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/settings_button/settings_button.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Widget> settings = [
      darkTheme(context),
      sourceCode(),
      aboutApp(context, 'App Name', 'IP_SD', 'IP_SD'),
      aboutApp(context, 'App Version', '0.3.1', 'For updates check Discord')
    ];    

    return ListView.builder(
      itemCount: settings.length,
      itemBuilder: (context, index) => settings[index],
    );
  }
}
