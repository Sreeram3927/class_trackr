import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/settings_button/settings_functions.dart';

Widget aboutApp(
    BuildContext context, String title, String subtitle, String data) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    onTap: () {
      showDialog(
          context: context,
          builder: (context) {
            return alertCard(context, data);
          });
    },
  );
}
