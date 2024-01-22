import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';
import 'package:infinity_project/services/db.dart';
import 'package:url_launcher/url_launcher.dart';

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
      if (backendData['app_level'] > _userData.getAppLevel && mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Update Available'),
            content: const Text('A new update is available for the app. Please update to the latest version to continue using the app.'),
            actions: [
              TextButton(
                onPressed: () async {
                  final Uri link = Uri.parse('https://github.com/Sreeram3927/class_trackr/releases');
                  try {
                    await launchUrl(
                      link,
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    Fluttertoast.showToast(msg: 'Coudn\'t open link. Please try again later.');
                  }
                },
                child: Text('Update', style: TextStyle(color: Theme.of(context).primaryColor),),
              ),
            ],
          )
        );
      }
    } catch (e) {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Failed to update Day order.',
              textAlign: TextAlign.center,
            ),
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
    _userData.getTimetableDatas();
    _userData.updateVersion();
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

          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const InformationScreen())
          //       );
          //     }, 
          //     icon: const Icon(Icons.info_outline_rounded),
          //   ),
          // ],
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