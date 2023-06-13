import 'package:infinity_project/data/timetable_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future<void> setData(String key, String data) async => await _preferences.setString(key, data);

  static getData(String key) => _preferences.getString(key);

  static void refreshData() {
    TimeTableData.currentCourse = UserPreferences.getData('course') ?? 'MH-Core';
  }

}
