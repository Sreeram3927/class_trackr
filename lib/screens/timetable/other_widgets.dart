import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/screens/timetable/subject_card/subject_card.dart';

Widget changeDate(void Function() fn, String tip, IconData icon, DateTime date) {
  void dateError() {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Date out of bound",
      fontSize: 20
    );
  }
  return TextButton(
    onPressed: DataManager.dateOutOfBounds(date, tip) ? dateError : fn,
    child: Icon(
      icon,
      color: Colors.black87,
      size: 30.0
    ),    
  );
}

Widget currentDateText(void Function() fn, DateTime date) {
  return TextButton(
    onPressed: fn,
    child: Text(
      '${date.day}/${date.month}/${date.year}',
      style: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
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
  return ListView.builder(
    itemCount: data.length,
  
    itemBuilder: (context, index) {
      List<String> details = Subject.subData[data[index][1]];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
        child: SubjectCard(
          title: details[0],
          subjectCode: details[1],
          time: data[index][0],
        ),
      );
    },
  );
}
