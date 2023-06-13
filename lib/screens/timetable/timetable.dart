import 'package:flutter/material.dart';
import 'package:infinity_project/data/data_manager.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/other_widgets/holiday.dart';
import 'package:infinity_project/screens/settings/shared_preferences/user_preferences.dart';
import 'package:infinity_project/screens/timetable/other_widgets.dart';
import 'package:infinity_project/screens/timetable/subject_card/subject_card.dart';

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
    _currentDayOrder = DataManager.getDayOrder(_currentDate);
    _currentData = DataManager.getCurrentData(_currentDayOrder);
  }

  void selectDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: DateTime(2023, 01, 01),
      lastDate: DateTime(2023, 05, 31),
    );
    if (newDate == null) return;
    setState(() {
      _currentDate = newDate;
      _getData();
    });
  }

  void prevDate() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month, _currentDate.day - 1);
      _getData();
    });
  }

  void nxtDate() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month, _currentDate.day + 1);
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
    List<Widget> topBar = [
      changeDate(
          prevDate, 'Previous Date', Icons.arrow_left_sharp, _currentDate, 'start'),
      dateText(_currentDate),
      changeDate(
          nxtDate, 'Next Date', Icons.arrow_right_sharp, _currentDate, 'end'),
    ];

    return pickDate(
      selectDate,
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: topBar,
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: _isHoliday
                ? const Holiday()
                : ListView.separated(
                    itemCount: _currentData.length,
                    itemBuilder: (context, index) {
                      List<String> details =
                          Subject.subData[_currentData[index][3]];
                      return SubjectCard(
                        title: details[0],
                        subjectCode: details[1],
                        startTime: _currentData[index][1],
                        endTime: _currentData[index][2],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10.0),
                  ),
          ),
        ],
      ),
    );
  }
}
