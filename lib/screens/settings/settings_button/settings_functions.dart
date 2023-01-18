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

Widget selectData(List val, String currentVal) {
  return const AlertDialog(
    actions: [
      Radio(value: [], groupValue: null, onChanged: null)
    ],
  );
}
