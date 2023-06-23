import 'package:flutter/material.dart';

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

    Color textColor = const Color(0xFF0B0500);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF788585).withOpacity(0.45),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          width: 2,
          color: const Color(0xFF788585).withOpacity(0.7)
        ),
      ),
      height: 150.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Text(
            title,
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.w600,
              color: textColor
            ),
            textAlign: TextAlign.center,
          ),
          
          Text(
            subjectCode,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: textColor
            ),
          ),

          Text(
            time,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              color: textColor
            ),
          )

        ]
      ),

    );
  }
}