import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinity_project/data/user_preferences.dart';

class Backend {
  
  static String baseURL = 'http://192.168.1.40:8080';

  static Future<int> getDayOrder(String date) async {
    var url = Uri.parse('$baseURL/day_order?date=$date');
    try {
    var response = await http.get(url).timeout(const Duration(seconds: 5));
    int dayOrder = jsonDecode(response.body)['day_order'];
    return dayOrder;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateDates() async {
    var url = Uri.parse('$baseURL/day_order_dates');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);
    data.forEach((key, value) {
      List<String> stringList = value.cast<String>().toList();
      UserPreferences.setList(key, stringList);
    });
  }

}