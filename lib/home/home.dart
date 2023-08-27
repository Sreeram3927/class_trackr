import 'package:flutter/material.dart';
import 'package:infinity_project/home/app_drawer.dart';
import 'package:infinity_project/home/information.dart';
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
    
      appBar: AppBar(
        elevation: 5.0,
        toolbarHeight: 55.0,

        title: const Text(
          'TimeTable',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w800
          )
        ),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InformationScreen())
              );
            }, 
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: "Informations",
          ),
        ],
      ),

      body: const TimeTable(),

      drawer: const AppDrawer(),

    );
  }
}