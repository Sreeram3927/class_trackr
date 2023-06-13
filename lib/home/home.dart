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
    return const SafeArea(
      child: Scaffold(
    
        body: TimeTable()
        // Column(
        //   children: [
        //     Expanded(
        //       child: ValueListenableBuilder(
        //         valueListenable: idx,
        //         builder: (context, value, child) {
        //           return screens[value];
        //         },
        //       )
        //     ),
        //   ],
        // ),
    
        //bottomNavigationBar: const BtNavBar(),
    
      ),
    );
  }
}