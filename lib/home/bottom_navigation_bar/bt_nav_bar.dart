import 'package:flutter/material.dart';
import 'package:infinity_project/home/home.dart';


class BtNavBar extends StatefulWidget {
  const BtNavBar({super.key});

  @override
  State<BtNavBar> createState() => _BtNavBarState();
}

class _BtNavBarState extends State<BtNavBar> {
  int  _index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(

      height: 70,

      selectedIndex: _index,
      onDestinationSelected: (index) {
        setState(() {
          _index = index;
          Home.idx.value = index;
        });
      },

      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      
      destinations: const [

        NavigationDestination(
          icon: Icon(Icons.calendar_today_outlined), 
          selectedIcon: Icon(Icons.calendar_today_rounded),
          label: 'Time Table'
        ),

        // BottomNavigationBarItem(
        //   icon: Icon(Icons.notifications_active_outlined), 
        //   activeIcon: Icon(Icons.notifications_active_rounded),
        //   label: 'Reminders'
        // ),

        NavigationDestination(
          icon: Icon(Icons.settings_outlined), 
          selectedIcon: Icon(Icons.settings_rounded),
          label: 'Settings'
        ),

        NavigationDestination(
          icon: Icon(Icons.info_outline_rounded),
          selectedIcon: Icon(Icons.info_rounded), 
          label: 'About'
        ),
      ]

    );
  }
}