import 'package:flutter/material.dart';
import 'package:infinity_project/data/user_preferences.dart';

// Widget alertCard(BuildContext context, String data) {
//   return AlertDialog(
//     title: Text(data),
//     actions: [
//       Center(
//           child: TextButton(
//         child: const Text('OK'),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ))
//     ],
//   );
// }

Widget selectCourse({
  required String name,
  required String valueKey,
  required List data,
  required int currentValue,
  required void Function() refresh
}) {

  // List<dynamic> data = TimeTableData.courses;
  // int currentValue = data.indexOf(TimeTableData.currentCourse);

  return AlertDialog(
    backgroundColor: const Color(0xFFCCDAD1),
    title: Text(
      name,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 21.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    content: Wrap(
      direction: Axis.vertical,
      children: List.generate(data.length, (index) {
        return Row(
          children: [
            Radio(
              value: index,
              groupValue: currentValue,
              onChanged: (value) {  
                UserPreferences.setData(valueKey, data[value!.toInt()]);
                refresh();
              },
            ),
            GestureDetector(
              child: Text(data[index]),
              onTap: () {
                UserPreferences.setData(valueKey, data[index]);
                refresh();
              },
            )
          ],
        );
      }),
    ),
  );
}
