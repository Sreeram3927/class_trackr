import 'package:flutter/material.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/screens/timetable/subject_card/subject_card.dart';

Widget pickDate(void Function() fn, Widget child) {
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
          tooltip: 'Select date from Calendar',
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

Widget holiday() {
  return const Center(
    child: Text(
      'holiday',
      style: TextStyle(fontSize: 50.0),
    ),
  );
}

Widget displayData(List data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: ListView.separated(
      itemCount: data.length,
  
      itemBuilder: (context, index) {
        List<String> details = Subject.subData[data[index][3]];
        return SubjectCard(
          title: details[0],
          subjectCode: details[1],
          startTime: data[index][1],
          endTime: data[index][2],
        );
      },
  
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15.0),
    ),
  );
}
