import 'package:infinity_project/models/course.dart';
import 'package:infinity_project/models/timetable_data.dart';
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


  TimetableData getTimetable() {
    return timetables[getCurTimetable]!;
  }

  // int getCurTimetable = _preferences.getInt('curtimetable') ?? 0;
  int get getCurTimetable => _preferences.getInt('curTimetable') ?? 0;
  set setCurTimetable(int value) {
    _preferences.setInt('curTimetable', value);
  }

  Map<int, TimetableData> get timetables => {
    0: timetable1,
    1: timetable2,
    2: timetable3,
    3: timetable4,
    4: timetable5,
  };

  TimetableData timetable1 = TimetableData(
    name: 'MH - Core',
    batch: 1,
    a: const Course(name: 'a'),
    b: const Course(name: 'b'),
    c: const Course(name: 'c'),
    d: const Course(name: 'd'),
    e: const Course(name: 'e'),
    f: const Course(name: 'f'),
    g: const Course(name: 'g'),
  );

  TimetableData timetable2 = TimetableData(
    name: 'MH - Robo',
    batch: 2,
    a: const Course(name: 'a'),
    b: const Course(name: 'b'),
    c: const Course(name: 'c'),
    d: const Course(name: 'd'),
    e: const Course(name: 'e'),
    f: const Course(name: 'f'),
    g: const Course(name: 'g'),
  );

  TimetableData timetable3 = TimetableData(
    name: '',
    batch: 1,
  );
  TimetableData timetable4 = TimetableData(
    name: '',
    batch: 1,
  );
  TimetableData timetable5 = TimetableData(
    name: '',
    batch: 1,
  );

}
