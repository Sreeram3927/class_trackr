import 'package:flutter/material.dart';
import 'package:infinity_project/screens/about/about.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'timetable/timetable.dart';

class MainScreen extends StatelessWidget {
  static ValueNotifier<int> idx = ValueNotifier(0);

  final screens = [
    const TimeTable(),
    Settings(),
    const About(),
  ];

  MainScreen({super.key});

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
