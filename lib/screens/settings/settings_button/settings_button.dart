import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/settings_button/settings_functions.dart';

Widget aboutApp(
    BuildContext context, String title, String subtitle, String data) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    onTap: () {
      showDialog(
          context: context, builder: (context) => alertCard(context, data));
    },
  );
}

Widget sourceCode() {
  return ListTile(
    title: const Text('Source Code'),
    trailing: const Icon(Icons.code_rounded),
    onTap: () {},
  );
}

Widget darkTheme(BuildContext context) {
  return ListTile(
    title: const Text('Dark Theme'),
    trailing: const Icon(Icons.sync_disabled_rounded),
    onTap: () {
      showDialog(
          context: context,
          builder: (context) =>
              alertCard(context, 'Dark Theme coming soon...'));
    },
  );
}

Widget feedbackForm() {
  return ListTile(
    title: const Text('Feedback Form'),
    trailing: const Icon(Icons.my_library_books_outlined),
    onTap: () {},
  );
}

Widget changeData(BuildContext context, String title, String subtitle,bool course) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => selectData(title, course)
      );
    }
  );
}
