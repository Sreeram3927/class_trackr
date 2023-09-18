import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinity_project/data/user_preferences.dart';

class Backend {
  
  static String baseURL = 'http://192.168.1.40:8080';

  static Future<int> checkDataVersion() async {
    var url = Uri.parse('$baseURL/check_version');
    try {
      var response = await http.get(url).timeout(const Duration(seconds: 5));
      Map data = jsonDecode(response.body);
      int value = data['dataVersion'];
      return value;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateDates() async {
    var url = Uri.parse('$baseURL/day_order_dates');
    try {
      var response = await http.get(url).timeout(const Duration(seconds: 5));
      Map data = jsonDecode(response.body);
      if (data['status'] != 'success') {
        throw data['msg'];
      }
      data.forEach((key, value) {
        if (key == 'status') {return;}
        List<String> stringList = value.cast<String>().toList();
        UserPreferences.setList(key, stringList);
      });
    } catch (e) {
      rethrow;
    }
  }

}