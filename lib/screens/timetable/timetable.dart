import 'package:flutter/material.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/data/user_preferences.dart';
import 'package:infinity_project/home/app_drawer.dart';
import 'package:infinity_project/home/information.dart';
import 'package:infinity_project/screens/timetable/other_widgets.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  DateTime _currentDate = DateTime.now();
  int _currentDayOrder = 9;
  List _currentData = [];
  bool _isHoliday = true;

  void _getData() {
    _isHoliday = DataManager.isHoliday(_currentDate);
    if (!_isHoliday) {
      _currentDayOrder = DataManager.getDayOrder(_currentDate);
      _currentData = DataManager.getCurrentData(_currentDayOrder);
    }
  }

  void selectDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: DataManager.minDate,
      lastDate: DataManager.maxDate,
    );

    if (newDate == null) return;

    setState(() {
      _currentDate = newDate;
      _getData();
    });
  }

  void previousDate() {
    setState(() {
      _currentDate = _currentDate.subtract(const Duration(days: 1));
      _getData();
    });
  }

  void nextDate() {
    setState(() {
      _currentDate = _currentDate.add(const Duration(days: 1));
      _getData();
    });
  }

  void setCurrentDate() {
    setState(() {
      _currentDate = DateTime.now();
      _getData();
    });
  }

  @override
  void initState() {
    super.initState();
    UserPreferences.refreshData();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> dateInfoData = [
      changeDate(previousDate, 'previous', Icons.arrow_left_sharp, _currentDate),
      currentDateText(selectDate, setCurrentDate,_currentDate),
      changeDate(nextDate, 'next', Icons.arrow_right_sharp, _currentDate),
    ];

    return Scaffold(

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

      drawer: const AppDrawer(),

      body: Column(
        children: [
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: dateInfoData
          ),
    
          const SizedBox(height: 2.5),
    
          if (!_isHoliday) Text(
            'Day Order ${_currentDayOrder.toString()}',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
    
          const SizedBox(height: 3.0),
    
          Expanded(
            child: _isHoliday
              ? holiday()
              : displayData(_currentData),
          ),
    
        ],
      ),
    );
  }
}
