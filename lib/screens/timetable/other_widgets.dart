import 'package:flutter/material.dart';

Widget pickDate(void Function() fn, String tip, Widget child) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
    child: Stack(children: [
      child,
      Positioned(
        bottom: 15.0,
        right: 15.0,
        child: IconButton(
          onPressed: fn,
          icon: const Icon(Icons.edit_calendar_rounded),
          tooltip: tip,
        ),
      ),
    ]),
  );
}

Widget changeDate(void Function() fn, String tip, IconData icon, DateTime date, String limit) {
  bool dt;
  if (limit == 'start') {
    dt = date == DateTime(2023, 01, 01);
  } else {
    dt = date == DateTime(2023, 05, 31);
  }

  return IconButton(
    onPressed: dt ? () {} : fn,
    icon: Icon(icon),
    tooltip: tip,
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
