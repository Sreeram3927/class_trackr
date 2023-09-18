import 'package:infinity_project/data/day_order/date_of_day_order.dart';
import 'package:infinity_project/data/timetable/subjects.dart';
import 'package:infinity_project/data/timetable/timetable_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future<void> setData(String key, String data) async => await _preferences.setString(key, data);
  static getData(String key) => _preferences.getString(key);

  static void setList(String key, List<String> data) => _preferences.setStringList(key, data);
  static getList(String key) => _preferences.getStringList(key);

  static void setVersion(String key, int value) => _preferences.setInt(key, value);
  static getVersion(String key) => _preferences.getInt(key);

  static void refreshData() {
    TimeTableData.currentCourse = UserPreferences.getData('course') ?? 'MH-Core';
    Subject.currentBatch = UserPreferences.getData('batch') ?? 'Batch 1';
  }
  static void refreshDayOrders() {
    DayOrderDate.dayOrder_1 = UserPreferences.getList('day_order_1') ?? DayOrderDate.defaultDayOrder_1;
    DayOrderDate.dayOrder_2 = UserPreferences.getList('day_order_2') ?? DayOrderDate.defaultDayOrder_2;
    DayOrderDate.dayOrder_3 = UserPreferences.getList('day_order_3') ?? DayOrderDate.defaultDayOrder_3;
    DayOrderDate.dayOrder_4 = UserPreferences.getList('day_order_4') ?? DayOrderDate.defaultDayOrder_4;
    DayOrderDate.dayOrder_5 = UserPreferences.getList('day_order_5') ?? DayOrderDate.defaultDayOrder_5;
  }

  static bool showHome = _preferences.getBool('showHome') ?? false;
  // static bool showHome = false;
  static void setShowHome(bool value) => _preferences.setBool('showHome', value);
  static void updateShowHome() => showHome = _preferences.getBool('showHome') ?? false;

}
