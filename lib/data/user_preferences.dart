import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/data/timetable_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future<void> setData(String key, String data) async => await _preferences.setString(key, data);

  static getData(String key) => _preferences.getString(key);

  static void refreshData() {
    TimeTableData.currentCourse = UserPreferences.getData('course') ?? 'MH-Core';
    Subject.currentBatch = UserPreferences.getData('batch') ?? 'Batch 1';
  }

  // static bool showHome = _preferences.getBool('showHome') ?? false;
  static bool showHome = false;
  static void setShowHome(bool value) {
    showHome = value;
    _preferences.setBool('showHome', value);
  }

}
