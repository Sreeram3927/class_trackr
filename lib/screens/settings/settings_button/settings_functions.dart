import 'package:flutter/material.dart';
import 'package:infinity_project/data/day_order_not_f.dart';
import 'package:infinity_project/screens/settings/shared_preferences/user_preferences.dart';

Widget alertCard(BuildContext context, String data) {
  return AlertDialog(
    title: Text(data),
    actions: [
      Center(
          child: TextButton(
        child: const Text('OK'),
        onPressed: () {
          Navigator.pop(context);
        },
      ))
    ],
  );
}

Widget selectData(BuildContext context, String title, bool course) {
  List data = course ? DayOrder.course : DayOrder.lang;

  return AlertDialog(
    title: Center(child: Text(title)),
    content: Wrap(
      direction: Axis.vertical,
      children: List.generate(data.length, (index) {
        return GestureDetector(
          child: Text(course ? data[index]: data[index][0]),
          onTap: () {
            if (course) {
              UserPreferences.setData('course', data[index]);
            } else {
              UserPreferences.setData('lang', data[index]);
              UserPreferences.setData('langCode', data[index][1]);
            }

            Navigator.pop(context);
          },
        );
      }),
    ),
  );
}
