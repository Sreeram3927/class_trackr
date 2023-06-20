import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';
import 'package:url_launcher/url_launcher.dart';


enum DrawerSections {
  timeTable,
  settings,
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _currentPage = DrawerSections.timeTable;

  Future<void> _discord() async {
    Uri discordUrl = Uri.parse("https://www.google.com/");
    if (!await launchUrl(
      discordUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $discordUrl');
    }
  
  }

  @override
  Widget build(BuildContext context) {

    Widget screen = const TimeTable();
    String title = "TimeTable";

    if (_currentPage == DrawerSections.timeTable) {
      screen = const TimeTable();
      title = "TimeTable";
    } else if (_currentPage == DrawerSections.settings) {
      screen = const Settings();
      title = "Settings";
    }

    return SafeArea(
      child: Scaffold(

        backgroundColor: const Color.fromRGBO(230, 230, 250, 1),
    
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(217, 189, 233, 0.5),
          foregroundColor: Colors.black87,
          toolbarHeight: 55.0,

          title: Text(
            title,
            style: const TextStyle(
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
          menuItem(1, "TimeTable", Icons.calendar_today_rounded, _currentPage == DrawerSections.timeTable ? true : false),
          
          menuItem(2, "Settings", Icons.settings_outlined, _currentPage == DrawerSections.settings ? true : false),
          
          const Divider(),
         
          menuItem(5, "Settings", Icons.settings_outlined, _currentPage == DrawerSections.settings ? true : false),

          menuItem(3, "Discord", Icons.discord_rounded, false),

          menuItem(4, "Check for Updates", Icons.update_rounded, false),
          
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
          if (id > 2) {
            _discord();
          } else {
            setState(() {
              if (id == 1) {
                _currentPage = DrawerSections.timeTable;
              } else if (id == 2) {
                _currentPage = DrawerSections.settings;
              } else if (id == 5) {
                _currentPage = DrawerSections.settings;
              }
            });
          }
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