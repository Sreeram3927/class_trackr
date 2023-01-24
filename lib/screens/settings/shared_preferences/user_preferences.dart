import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future<void> setData(String key, String data) async => await _preferences.setString(key, data);

  static getData(String key) => _preferences.getString(key);

}
