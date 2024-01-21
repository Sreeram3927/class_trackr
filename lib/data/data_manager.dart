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
    required Map<String, dynamic> dayOrders,
  }) {
    _userData.setDataVersion = dataVersion;
    _do.setAllDayOrders(
      do1: dayOrders['day_order_1']! as List<String>,
      do2: dayOrders['day_order_2']! as List<String>,
      do3: dayOrders['day_order_3']! as List<String>,
      do4: dayOrders['day_order_4']! as List<String>,
      do5: dayOrders['day_order_5']! as List<String>,
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

  DateTime minDate = DateTime(2000);
  DateTime maxDate = DateTime(2100);

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
