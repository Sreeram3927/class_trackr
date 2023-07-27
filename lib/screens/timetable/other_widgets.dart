import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/screens/timetable/subject_card/subject_card.dart';

Widget changeDate(void Function() fn, String tip, IconData icon, DateTime date) {
  void dateError() {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: "Date out of range",
      fontSize: 20
    );
  }
  return Tooltip(
    message: tip,
    child: TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => const Color(0xFF788585)
        ),
      ),
      onPressed: DataManager.dateOutOfBounds(date, tip) ? dateError : fn,
      child: Icon(
        icon,
        color: Colors.black87,
        size: 30.0
      ),    
    ),
  );
}

Widget currentDateText(void Function() fn, DateTime date) {
  return TextButton(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) => const Color(0xFF788585)
      ),
    ),
    onPressed: fn,
    child: Text(
      '${date.day}/${date.month}/${date.year}',
      style: const TextStyle(
        letterSpacing: 1.7,
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
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

Widget displayData(List data) {
  return RawScrollbar(
    thumbVisibility: true,
    thumbColor: const Color(0xFF38302E),
    thickness: 7.5,
    radius: const Radius.circular(10.0),
    child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        bool lab = data[index][3].contains('P');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
          child: SubjectCard(
            title: data[index][2] + (lab ? ' (Lab)' : ''),
            subjectCode: data[index][1],
            time: data[index][0],
          ),
        );
      },
    ),
  );
}
