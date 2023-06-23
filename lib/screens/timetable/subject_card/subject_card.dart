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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF66717E).withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          width: 2,
          color: const Color(0xFF232E21).withOpacity(0.5)
        ),
      ),
      height: 150.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Text(
            title,
            style: const TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3D348B)
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

    );
  }
}