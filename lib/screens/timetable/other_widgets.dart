import 'package:flutter/material.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/screens/timetable/subject_card/subject_card.dart';

Widget changeDate(void Function() fn, String tip, IconData icon, DateTime date) {
  return IconButton(
    onPressed: DataManager.dateOutOfBounds(date) ? () {} : fn,
    icon: Icon(icon),
    tooltip: tip,
  );
}

Widget dateText(void Function() fn, DateTime date) {
  return TextButton(
    onPressed: fn,
    child: Text(
      '${date.day}/${date.month}/${date.year}',
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    )
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
  return ListView.separated(
    itemCount: data.length,
  
    itemBuilder: (context, index) {
      List<String> details = Subject.subData[data[index][3]];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SubjectCard(
          title: details[0],
          subjectCode: details[1],
          startTime: data[index][1],
          endTime: data[index][2],
        ),
      );
    },
  
    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15.0),
  );
}
