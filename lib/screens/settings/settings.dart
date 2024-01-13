import 'package:flutter/material.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:infinity_project/screens/settings/edit_timetable.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final UserData _userData = UserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w800
          ),
        ),
        centerTitle: true,
        toolbarHeight: 55.0,
        elevation: 5.0,
      ),

      body: ListView(
        children: [
    
          ListTile(
            title: const Text(
              'Change Timetable',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              _userData.getTimetable().name!,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w300
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => changeTimetable()
              );
            }
          ),

        ],
      ),
    );
  }

  Widget changeTimetable() {

    final data = _userData.timetables;
    final currentValue = _userData.getCurTimetable;

    void setValue(int value) {
      setState(() {
        _userData.setCurTimetable = value;
      });
      Navigator.pop(context);
    }

    return AlertDialog(
      title: const Text(
        'Change Timetable',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(data.length, (index) {

          final bool hasData = data[index]!.name != null;

          return Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio(
                value: index,
                groupValue: currentValue,
                onChanged: (value) {
                  if (hasData) {
                    setValue(value!.toInt());
                  }
                },
              ),
              GestureDetector(
                child: Text(
                  data[index]?.name ?? 'Unavailable',
                  style: TextStyle(
                    color: hasData ? Colors.black : Colors.grey,
                  ),
                ),
                onTap: () {
                  if (hasData) {
                    setValue(index);
                  }
                },
              ),
              // IconButton.filledTonal(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => EditTimetablePage(
              //           timetable: data[index]!,
              //         )
              //       )
              //     );
              //   },
              //   icon: const Icon(Icons.edit, size: 17.0,),
              // )
            ],
          );
        }),
      ),
    );
  }
}
