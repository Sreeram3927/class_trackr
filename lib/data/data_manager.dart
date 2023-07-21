import 'package:infinity_project/data/date_of_day_order.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/data/timetable_data.dart';
import 'package:intl/intl.dart';

class DataManager {

  static bool isHoliday(DateTime date) {    
    String val = DateFormat('dd/MM').format(date);
    if (DayOrderDate.dayOrder_1.contains(val)) {return false;} 
    else if (DayOrderDate.dayOrder_2.contains(val)) {return false;} 
    else if (DayOrderDate.dayOrder_3.contains(val)) {return false;} 
    else if (DayOrderDate.dayOrder_4.contains(val)) {return false;} 
    else if (DayOrderDate.dayOrder_5.contains(val)) {return false;}
    else {return true;}
  }

  static int getDayOrder(DateTime date) {
    String val = DateFormat('dd/MM').format(date);
    if (DayOrderDate.dayOrder_1.contains(val)) {return 1;} 
    else if (DayOrderDate.dayOrder_2.contains(val)) {return 2;} 
    else if (DayOrderDate.dayOrder_3.contains(val)) {return 3;} 
    else if (DayOrderDate.dayOrder_4.contains(val)) {return 4;} 
    else if (DayOrderDate.dayOrder_5.contains(val)) {return 5;}
    else {return 9;}
  }

  static List getCurrentData(int dayOrder) {
    List timetable = TimeTableData.timetable[TimeTableData.currentCourse][dayOrder];
    List data = [];

    for (int i = 0; i < timetable.length; i++) {
      Subject.subData.forEach((courseCode, courseInfo) {
        final List slots = courseInfo['slots'];
        if (slots.contains(timetable[i][1])) {
          data.add([TimeTableData.hour[timetable[i][0]], courseCode, courseInfo['name'], timetable[i][1]]);
        }
      });
    }

    // for (int i = 0; i < timetable.length; i++) {
    //   data.add([TimeTableData.hour[timetable[i][0]], timetable[i][1]]);
    // }
    return data;
  }

  static DateTime minDate = DateTime(2023, 07, 01);
  static DateTime maxDate = DateTime(2023, 12, 31);

  static bool dateOutOfBounds(DateTime date, String tip) {
    if (tip == 'previous') {
      return date.subtract(const Duration(days: 1)).isBefore(minDate);
    } else if (tip == 'next') {
      return date.add(const Duration(days: 1)).isAfter(maxDate);
    } else {
      return false;
    }
  }
}
