import 'package:infinity_project/models/course.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/models/timetable_preset.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {

  static late SharedPreferences _preferences;

  Future<void> get init async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setData(String key, String data) async => await _preferences.setString(key, data);
  getData(String key) => _preferences.getString(key);

  void setList(String key, List<String> data) => _preferences.setStringList(key, data);
  getList(String key) => _preferences.getStringList(key);

  void setVersion(int value) => _preferences.setInt('version', value);
  
  int getDataVersion() => _preferences.getInt('data_version') ?? 0;

  void refreshData() {
    
  }

  bool get showHome => _preferences.getBool('showHome') ?? false;
  // bool showHome = false;
  void setShowHome(bool value) => _preferences.setBool('showHome', value);


  TimetablePreset getTimetable() {
    return timetables[getCurTimetable]!;
  }

  // int getCurTimetable = _preferences.getInt('curtimetable') ?? 0;
  int get getCurTimetable => _preferences.getInt('curTimetable') ?? 0;
  set setCurTimetable(int value) {
    _preferences.setInt('curTimetable', value);
  }

  Map<int, TimetablePreset> get timetables => {
    0: timetable1,
    1: timetable2,
    2: timetable3,
    3: timetable4,
    4: timetable5,
  };

  TimetablePreset timetable1 = TimetablePreset(
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

  TimetablePreset timetable2 = TimetablePreset(
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

  TimetablePreset timetable3 = TimetablePreset(
    name: null,
    data: null,
  );
  TimetablePreset timetable4 = TimetablePreset(
    name: null,
    data: null,
  );
  TimetablePreset timetable5 = TimetablePreset(
    name: null,
    data: null,
  );

}
