import 'package:flutter/material.dart';

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

Widget selectData(String title, List data) {
  return AlertDialog(
    title: Center(child: Text(title)),
    content: Wrap(
      direction: Axis.vertical,
      children: List.generate(data.length, (index) {
        return Text(data[index]);
      }),
    ),
  );
}
