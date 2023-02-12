import 'package:infinity_project/data/day_order_not_f.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future<void> setData(String key, String data) async => await _preferences.setString(key, data);

  static getData(String key) => _preferences.getString(key);

  static void refreshData() {
    DayOrder.curCourse = UserPreferences.getData('course') ?? 'MH-Core';
    //DayOrder.isCore = DayOrder.curCourse == 'MH-core';

    DayOrder.curLang = UserPreferences.getData('lang') ?? 'German';
    DayOrder.langCode = UserPreferences.getData('langCode') ?? 'GEM';
  }

}
