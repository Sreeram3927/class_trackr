import 'package:flutter/material.dart';
import 'package:infinity_project/screens/timetable/glass_morphism.dart';
import 'package:infinity_project/screens/timetable/subject_card/subject_info.dart';

class SubjectCard extends StatelessWidget {

  final String title;
  final String subjectCode;
  final String staff;
  final String mode;
  final String where;
  final String startTime;
  final String endTime;

  const SubjectCard({
    super.key,
    required this.title,
    required this.subjectCode,
    required this.staff,
    required this.mode,
    required this.where,
    required this.startTime,
    required this.endTime
  });

  @override
  Widget build(BuildContext context) {
    return GlassMorph(
      child: Container(
        height: 150.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            subTitle(title),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subInfo(subjectCode, staff),
                const SizedBox(),
                roomInfo(mode, where),
                const SizedBox(),
              ],
            ),
            
            classTiming(startTime, endTime),

          ]
        ),

      ) 
    );
  }
}