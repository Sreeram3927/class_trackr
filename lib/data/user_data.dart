import 'package:infinity_project/models/course.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/models/timetable_preset.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {

  static late SharedPreferences _preferences;

  Future get init async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setData(String key, String data) async => await _preferences.setString(key, data);
  getData(String key) => _preferences.getString(key);

  void setList(String key, List<String> data) => _preferences.setStringList(key, data);
  getList(String key) => _preferences.getStringList(key);

  void setVersion(int value) => _preferences.setInt('version', value);
  
  int getDataVersion() => _preferences.getInt('data_version') ?? 0;

  void refreshData() {
    // TimeTableData().currentCourse = getData('course') ?? 'MH-Core';
    // Subject().currentBatch = getData('batch') ?? 'Batch 1';
  }
  // void refreshDayOrders() {
  //   _dayOrderDate.dayOrder_1 = getList('day_order_1') ?? _dayOrderDate.defaultDayOrder_1;
  //   _dayOrderDate.dayOrder_2 = getList('day_order_2') ?? _dayOrderDate.defaultDayOrder_2;
  //   _dayOrderDate.dayOrder_3 = getList('day_order_3') ?? _dayOrderDate.defaultDayOrder_3;
  //   _dayOrderDate.dayOrder_4 = getList('day_order_4') ?? _dayOrderDate.defaultDayOrder_4;
  //   _dayOrderDate.dayOrder_5 = getList('day_order_5') ?? _dayOrderDate.defaultDayOrder_5;
  // }

  bool get showHome => _preferences.getBool('showHome') ?? false;
  // bool showHome = false;
  void setShowHome(bool value) => _preferences.setBool('showHome', value);
  // void updateShowHome() => _preferences.getBool('showHome') ?? false;


  TimetablePreset getTimetable() {
    return timetables[curtimetable]!;
  }

  static int curtimetable = 0;

  static Map<int, TimetablePreset> timetables = {
    0: timetable1,
    1: timetable2,
    2: timetable3,
    3: timetable4,
    4: timetable5,
  };

  static TimetablePreset timetable1 = TimetablePreset(
    name: 'MH - Core',
    data: TimetableData(
      batch: 1,
      a: const Course(name: 'a'),
      b: const Course(name: 'b'),
      c: const Course(name: 'c'),
      d: const Course(name: 'd'),
      e: const Course(name: 'e'),
      f: const Course(name: 'f'),
      g: const Course(name: 'g'),
    ),
  );

  static TimetablePreset timetable2 = TimetablePreset(
    name: 'MH - Robo',
    data: TimetableData(
      batch: 2,
      a: const Course(name: 'a'),
      b: const Course(name: 'b'),
      c: const Course(name: 'c'),
      d: const Course(name: 'd'),
      e: const Course(name: 'e'),
      f: const Course(name: 'f'),
      g: const Course(name: 'g'),
    ),
  );

  static TimetablePreset timetable3 = TimetablePreset(
    name: null,
    data: null,
  );
  static TimetablePreset timetable4 = TimetablePreset(
    name: null,
    data: null,
  );
  static TimetablePreset timetable5 = TimetablePreset(
    name: null,
    data: null,
  );

}
