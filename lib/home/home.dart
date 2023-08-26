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
    return SafeArea(
      child: Scaffold(

        // backgroundColor: const Color(0xFFCCDAD1),
        key: _scaffoldKey,
    
        appBar: AppBar(
          elevation: 5.0,
          // backgroundColor: const Color(0xFF38302E),
          // foregroundColor: const Color(0xFFCCDAD1),
          toolbarHeight: 55.0,

          title: const Text(
            'TimeTable',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800
            )
          ),
          centerTitle: true,

          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            icon: const Icon(Icons.menu),
            tooltip: "Menu",
          ),

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

      ),
    );
  }
}