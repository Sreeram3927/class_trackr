import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/models/course.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/screens/timetable/subject_card/subject_card.dart';

Widget changeDate(VoidCallback fn, String tip, IconData icon, DateTime date) {
  void dateError() {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Date out of range",
      fontSize: 20
    );
  }
  return IconButton(
    onPressed: DataManager().dateOutOfBounds(date, tip) ? dateError : fn,
    icon: Icon(
      icon,
      size: 30.0
    ),    
  );
}

Widget currentDateText(VoidCallback fn, VoidCallback fn2, DateTime date) {
  return OutlinedButton(
    onPressed: fn,
    onLongPress: fn2,
    child: Text(
      '${date.day}/${date.month}/${date.year}',
      style: const TextStyle(
        letterSpacing: 1.7,
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
      ),
    )
  );
}

Widget holiday() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 35.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Holiday',
          style: TextStyle(fontSize: 50.0),
        ),
        SizedBox(height: 35.0,),
        Text(
          """
Today is marked as a holiday.

If you believe this information is incorrect or if you have any questions, please feel free to contact the developer.
          
Your feedback is valuable in ensuring the accuracy of our timetable app.
          """,
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.justify,
        )
      ]
    ),
  );
}

Widget displayData(TimetableData timetableData, int dayOrder) {

  final List<Course> data = timetableData.getTimetable(dayOrder);

  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      final course = data[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
        child: SubjectCard(
          title: course.name,
          subjectCode: course.code,
          time: course.timing,
        ),
      );
    },
  );
}
