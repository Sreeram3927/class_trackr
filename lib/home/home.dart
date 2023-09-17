import 'package:flutter/material.dart';
import 'package:infinity_project/data/meta_data.dart';
import 'package:infinity_project/home/app_drawer.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void checkVersion() {
    if (AppMetaData.storedVersion != AppMetaData.version) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('New Update Available'),
            content: const Text('Please update the app to the latest version.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,

      body: const TimeTable(),

      drawer: const AppDrawer(),

    );
  }
}