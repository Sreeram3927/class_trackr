import 'package:flutter/material.dart';

Widget subTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w600
    ),
  );
}

Widget subInfo(String code) {
  return Text(
    code,
    style: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500
    ),
  );

}

// Widget roomInfo(String mode, String room) {
//   return Column(
//     children: [

//       Text(
//         mode,
//         style: const TextStyle(
//           fontSize: 13.0,
//           fontWeight: FontWeight.w300
//         ),
//       ),

//       Text(
//         room,
//         style: const TextStyle(
//           fontSize: 25.0,
//           fontWeight: FontWeight.w600
//         ),
//       ),
//     ],
//   );
// }

Widget classTiming(String start, String end) {
  return Text(
    '$start - $end',
    style: const TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w700
    ),
  );
}

