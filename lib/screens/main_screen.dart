import 'package:flutter/material.dart';
import 'timetable/timetable.dart';


class MainScreen extends StatelessWidget {

  static ValueNotifier<int> idx = ValueNotifier(0);

  final screens = const [
    TimeTable(),
    Center(child: Text('Reminders', style: TextStyle(fontSize: 80),),),
    Center(child: Text('Settings', style: TextStyle(fontSize: 80),),),
    Center(child: Text('About', style: TextStyle(fontSize: 80),),),
  ];

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
      child: ValueListenableBuilder(

        valueListenable: idx,

        builder: (context, value, child) {

          return screens[value];
          
        },

      ),
    );
  }
}