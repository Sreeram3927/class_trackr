import 'package:infinity_project/data/date_of_day_order.dart';
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

  // static List getCurrentData(String course) {
  //   if (course == 'MH-Core')
  // }

}
