import 'package:flutter/material.dart';

Widget pickDate(void Function() fn, Widget child) {
  return Stack(children: [
    child,
    Positioned(
      bottom: 15.0,
      right: 15.0,
      child: IconButton(
        onPressed: fn,
        icon: const Icon(Icons.edit_calendar_rounded),
      ),
    ),
  ]);
}

Widget changeDate(
    void Function() fn, IconData icon, DateTime date, String limit) {
  bool dt;
  if (limit == 'start') {
    dt = date == DateTime(2022, 09, 01);
  } else {
    dt = date == DateTime(2022, 12, 31);
  }

  return IconButton(
    onPressed: dt ? () {} : fn,
    icon: Icon(icon),
  );
}

Widget dateText(DateTime date) {
  return Text(
    '${date.day}/${date.month}/${date.year}',
    style: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
  );
}
