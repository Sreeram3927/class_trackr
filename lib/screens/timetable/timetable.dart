import 'package:flutter/material.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/screens/timetable/other_widgets.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  DateTime _currentDate = DateTime.now();
  int? _currentDayOrder;
  late TimetableData _currentData;
  bool _isHoliday = true;

  final DataManager _manager = DataManager();
  final UserData _userData = UserData();

  void _getData() {
    _isHoliday = _manager.isHoliday(_currentDate);
    if (!_isHoliday) {
      _currentDayOrder = _manager.getDayOrder(_currentDate);
      _currentData = _userData.getTimetable();
    }
  }

  void selectDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: _manager.minDate,
      lastDate: _manager.maxDate,
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
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> dateInfoData = [
      changeDate(previousDate, 'previous', Icons.arrow_left_sharp, _currentDate),
      currentDateText(selectDate, setCurrentDate,_currentDate),
      changeDate(nextDate, 'next', Icons.arrow_right_sharp, _currentDate),
    ];

    return Column(
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
            : displayData(_currentData, _currentDayOrder!),
        ),
  
      ],
    );
  }
}
