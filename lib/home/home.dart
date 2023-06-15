import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var currentPage = DrawerSections.timeTable;

  @override
  Widget build(BuildContext context) {

    Widget screen = const TimeTable();
    if (currentPage == DrawerSections.timeTable) {
      screen = const TimeTable();
    } else if (currentPage == DrawerSections.settings) {
      screen = const Settings();
    }

    return SafeArea(
      child: Scaffold(
    
        appBar: AppBar(

          elevation: 0.0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
          toolbarHeight: 55.0,

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

        body: screen,

        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                drawerHeader(),
                drawerList(),
              ],
            ),
          ),
        )
      ),
    );
  }

  
  Widget drawerHeader() {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/images/flutter_logo.png')),
            ),
          ),

          const Text(
            "Project Infinity",
            style: TextStyle(color: Colors.white ,fontSize: 20.0),
          )

        ],
      )
    );
  }

  Widget drawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "TimeTable", Icons.dashboard_outlined,
              currentPage == DrawerSections.timeTable ? true : false),
          menuItem(2, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          const Divider(),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.timeTable;
            } else if (id == 2) {
              currentPage = DrawerSections.settings;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

enum DrawerSections {
  timeTable,
  settings,
}