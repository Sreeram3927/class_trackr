import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:infinity_project/screens/home/information.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';
import 'package:infinity_project/services/db.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final DataManager _manager = DataManager();
  final UserData _userData = UserData();

  final DatabaseService _db = DatabaseService();
  Future<void> _initBackend() async {
    try {
      final backendData = await _db.getInitData();
      if (backendData['data_version'] != _userData.getDataVersion) {
        _manager.updateData(
          dataVersion: backendData['data_version'],
          dayOrders: backendData['day_orders'],
        );
      }
    } catch (e) {
      if(context.mounted) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to connect to the server."),
          )
        );
      }
    }
  }

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
    _initBackend();
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

        appBar: AppBar(

          title: Text(
            _bottomNavBarItems[_selectedIndex].label!,
            style: const TextStyle(
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
            ),
          ],
        ),
      
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

        // floatingActionButton: FloatingActionButton(
        //   onPressed: _db.updateDayOrders,
        //   child: const Icon(Icons.upgrade_rounded),
        // )
      ),
    );
  }
}