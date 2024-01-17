import 'package:infinity_project/data/day_order.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:intl/intl.dart';

class DataManager {

  final DayOrder _do = DayOrder();
  final UserData _userData = UserData();
  
  late final List<String> d1;
  late final List<String> d2;
  late final List<String> d3;
  late final List<String> d4;
  late final List<String> d5;

  DataManager() {
    d1 = _do.dayOrder_1();
    d2 = _do.dayOrder_2();
    d3 = _do.dayOrder_3();
    d4 = _do.dayOrder_4();
    d5 = _do.dayOrder_5();
  }
  

  void updateData({
    required int dataVersion,
    required Map<int, List<String>> dayOrders,
  }) {
    _userData.setDataVersion = dataVersion;
    _do.setAllDayOrders(
      do1: dayOrders[1]!,
      do2: dayOrders[2]!,
      do3: dayOrders[3]!,
      do4: dayOrders[4]!,
      do5: dayOrders[5]!,
    );
  }

  bool isHoliday(DateTime date) {
    String val = DateFormat('dd/MM/yy').format(date);
    if (d1.contains(val) || d2.contains(val) || d3.contains(val) || d4.contains(val) || d5.contains(val)) {
      return false;
    } else {
      return true;
    }
  }

  int getDayOrder(DateTime date) {
    String val = DateFormat('dd/MM/yy').format(date);
    if (d1.contains(val)) {return 1;} 
    else if (d2.contains(val)) {return 2;} 
    else if (d3.contains(val)) {return 3;} 
    else if (d4.contains(val)) {return 4;} 
    else if (d5.contains(val)) {return 5;}
    else {return 0;}
  }

  // List getCurrentData(int dayOrder) {
  //   List timetable = TimeTableData.timetable[TimeTableData.currentCourse][dayOrder];
  //   List data = [];

  //   for (int i = 0; i < timetable.length; i++) {
  //     Subject.subData.forEach((courseCode, courseInfo) {
  //       final List slots = Subject.getSlots(courseCode);
  //       if (slots.contains(timetable[i][1])) {
  //         data.add([TimeTableData.hour[timetable[i][0]], courseCode, courseInfo['name'], timetable[i][1]]);
  //       }
  //     });
  //   }
    
  //   return data;
  // }

  DateTime minDate = DateTime(2024, 01, 01);
  DateTime maxDate = DateTime(2024, 06, 30);

  bool dateOutOfBounds(DateTime date, String tip) {
    if (tip == 'previous') {
      return date.subtract(const Duration(days: 1)).isBefore(minDate);
    } else if (tip == 'next') {
      return date.add(const Duration(days: 1)).isAfter(maxDate);
    } else {
      return false;
    }
  }
}
