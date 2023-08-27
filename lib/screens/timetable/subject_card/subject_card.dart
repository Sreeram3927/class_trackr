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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          width: 2,
          color: const Color(0xFF788585).withOpacity(0.7),
        ),
      ),
        child: Container(
          height: 160.0,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            
            Text(
              subjectCode,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),

            Text(
              time,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            )

          ]
        ),
      )
    );
  }
}