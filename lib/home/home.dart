import 'package:flutter/material.dart';
import 'package:infinity_project/home/title_bar/title_bar.dart';
import 'package:infinity_project/screens/about/about.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';
import 'bottom_navigation_bar/bt_nav_bar.dart';


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
    return const TimeTable();
    // Scaffold(

    //   body:Column(
    //     children: [
    //       Expanded(
    //         child: ValueListenableBuilder(
    //           valueListenable: idx,
    //           builder: (context, value, child) {
    //             return screens[value];
    //           },
    //         )
    //       ),
    //     ],
    //   ),

    //   //bottomNavigationBar: const BtNavBar(),

    // );
  }
}