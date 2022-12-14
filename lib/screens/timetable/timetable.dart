import 'package:flutter/material.dart';
import 'package:infinity_project/data/day_order_manager.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/other_widgets/holiday.dart';
import 'package:infinity_project/screens/timetable/subject_card/subject_card.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  DateTime _curDate = DateTime.now();
  List _curDayOrder = [];
  bool _holiday = true;

  void selectDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _curDate,
      firstDate: DateTime(2022, 09, 01),
      lastDate: DateTime(2022, 12, 31),
    );

    if (newDate == null) return;

    setState(() {
      _curDate = newDate;
      _holiday = DayOrderManager.holiday(_curDate);
      _curDayOrder = DayOrderManager.getDayOrder(_curDate);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _holiday = DayOrderManager.holiday(_curDate);
    _curDayOrder = DayOrderManager.getDayOrder(_curDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_curDate.day}/${_curDate.month}/${_curDate.year}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            ElevatedButton(
              onPressed: selectDate,
              // style: ButtonStyle(

              // ),
              child: const Icon(Icons.edit_calendar_outlined),
            )
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Expanded(
          child: _holiday
              ? const Holiday()
              : ListView.separated(
                  itemCount: _curDayOrder.length,
                  itemBuilder: (context, index) {
                    List<String> details =
                        Subject.subData[_curDayOrder[index][3]];
                    return SubjectCard(
                      title: details[0],
                      subjectCode: details[1],
                      staff: details[2],
                      mode: details[3],
                      where: details[4],
                      startTime: _curDayOrder[index][1],
                      endTime: _curDayOrder[index][2],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10.0,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
