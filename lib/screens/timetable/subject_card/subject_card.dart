import 'package:flutter/material.dart';
import 'package:infinity_project/screens/timetable/subject_card/glass_morphism.dart';

class SubjectCard extends StatelessWidget {

  final String title;
  final String subjectCode;
  final String time;

  const SubjectCard({
    super.key,
    required this.title,
    required this.subjectCode,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GlassMorph(
      child: Container(
        height: 150.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Text(
              title,
              style: const TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
            
            Text(
              subjectCode,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500
              ),
            ),

            Text(
              time,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700
              ),
            )

          ]
        ),

      ) 
    );
  }
}