import 'package:flutter/material.dart';
import 'package:infinity_project/screens/about/about.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';


class Home extends StatelessWidget {
  static ValueNotifier<int> idx = ValueNotifier(0);

  final screens = const [
    TimeTable(),
    Settings(),
    About(),
  ];
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
        appBar: AppBar(

          elevation: 0.0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
          toolbarHeight: 55.0,

          leading: IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.menu_rounded),
          ),

          title: const Text(
            "TimeTable",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800
            )
          ),
          centerTitle: true,

          actions: [
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.help_rounded),
            ),
          ],
        ),

        body: const TimeTable()
      ),
    );
  }
}