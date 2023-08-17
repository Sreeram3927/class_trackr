import 'package:flutter/material.dart';
import 'package:infinity_project/home/app_drawer.dart';
import 'package:infinity_project/home/information.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Map<String, List<dynamic>> _screens = {
    'TimeTable': [const TimeTable(), Icons.calendar_today_rounded],
    'Settings': [const Settings(), Icons.settings_rounded],
  };

  late String title;
  late Widget screen;

  Future<void> _selectScreen(BuildContext context) async {
    final result = await showDialog(
    context: context,
    builder: (context) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeInOut,
        )),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: 0.8,
          child: AppDrawer(screenNames: _screens, selectedScreen: title),
        ),
      );
    },
  );
    if (result == null) return;
    setState(() {
      title = result;
      screen = _screens[title]![0];
    });
  }

  @override
  void initState() {
    super.initState();
    title = _screens.keys.first;
    screen = _screens[title]![0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: const Color(0xFFCCDAD1),
    
        appBar: AppBar(
          elevation: 5.0,
          backgroundColor: const Color(0xFF38302E),
          foregroundColor: const Color(0xFFCCDAD1),
          toolbarHeight: 55.0,

          title: Text(
            title,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800
            )
          ),
          centerTitle: true,

          leading: IconButton(
            onPressed: () {
              _selectScreen(context);
            }, 
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

        body: screen,

        // drawer: const AppDrawer()
      ),
    );
  }
}