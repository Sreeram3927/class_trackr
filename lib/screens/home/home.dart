import 'package:flutter/material.dart';
import 'package:infinity_project/data/meta_data.dart';
import 'package:infinity_project/screens/home/app_drawer.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,

      body: const TimeTable(),

      drawer: const AppDrawer(),

    );
  }
}