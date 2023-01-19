import 'package:flutter/material.dart';
import 'package:infinity_project/data/day_order_not_f.dart';

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
          child: Text(data[index][0]),
          onTap: () {
            if (course) {
              DayOrder.isCore = data[index][1];
              DayOrder.curCourse = data[index][0];
            } else {
              DayOrder.curLang = data[index][0];
            }

            Navigator.pop(context);
          },
        );
      }),
    ),
  );
}
