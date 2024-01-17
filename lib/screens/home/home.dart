import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late int _selectedIndex;
  final List<BottomNavigationBarItem> _bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today_rounded),
      label: 'Time Table',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  final PageController _pageController = PageController();

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (_selectedIndex == 0) {
          SystemNavigator.pop();
        } else {
          _changePage(0);
        }
      },
      child: Scaffold(
      
        body: PageView(
          onPageChanged: _changePage,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            TimeTable(),
            Settings(),
          ],
        ),
        
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavBarItems,
          currentIndex: _selectedIndex,
          onTap: _changePage,
        ),
      ),
    );
  }
}