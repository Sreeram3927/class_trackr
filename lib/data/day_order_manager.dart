import 'package:infinity_project/data/date_of_day_order.dart';
import 'package:infinity_project/data/day_order_not_f.dart';
import 'package:intl/intl.dart';

class DayOrderManager {

  static holiday(DateTime date) {    
    String val = DateFormat('dd/MM').format(date);
    if (DayOrderDate.dayOrder_1.contains(val)) {return false;} 
    else if (DayOrderDate.dayOrder_2.contains(val)) {return false;} 
    else if (DayOrderDate.dayOrder_3.contains(val)) {return false;} 
    else if (DayOrderDate.dayOrder_4.contains(val)) {return false;} 
    else if (DayOrderDate.dayOrder_5.contains(val)) {return false;}
    else {return true;}
  }

  static getDayOrder(DateTime date) {
    String val = DateFormat('dd/MM').format(date);
    if (DayOrderDate.dayOrder_1.contains(val)) {return DayOrder.core['dO1'];} 
    else if (DayOrderDate.dayOrder_2.contains(val)) {return DayOrder.core['dO2'];} 
    else if (DayOrderDate.dayOrder_3.contains(val)) {return DayOrder.core['dO3'];} 
    else if (DayOrderDate.dayOrder_4.contains(val)) {return DayOrder.core['dO4'];} 
    else if (DayOrderDate.dayOrder_5.contains(val)) {return DayOrder.core['dO5'];}
    else {return ['Hour 69', '6:09 am', '6:09 am', '420'];}
  }

}
