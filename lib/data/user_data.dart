import 'package:infinity_project/models/course.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {

  static late SharedPreferences _preferences;

  static late int _dataVersion;
  int  get getDataVersion => _dataVersion;
  set setDataVersion(int value) {
    _dataVersion = value;
    _preferences.setInt('data_version', value);
  }

  String get version => '0.9.21';

  Future<void> get init async {
    _preferences = await SharedPreferences.getInstance();
    _dataVersion = _preferences.getInt('data_version') ?? 0;
    if (_preferences.containsKey('course')) {
      _preferences.setBool('showHome', false);
      _preferences.remove('course');
      _preferences.remove('batch');
    }
  print(_preferences.getKeys());
  }

  Future<void> setData(String key, String data) async => await _preferences.setString(key, data);
  getData(String key) => _preferences.getString(key);

  void setList(String key, List<String> data) => _preferences.setStringList(key, data);
  getList(String key) => _preferences.getStringList(key);

  bool get showHome => _preferences.getBool('showHome') ?? false;
  void setShowHome(bool value) => _preferences.setBool('showHome', value);


  TimetableData getTimetable() {
    return timetables[getCurTimetable];
  }

  // int getCurTimetable = _preferences.getInt('curtimetable') ?? 0;
  int get getCurTimetable => _preferences.getInt('curTimetable') ?? 0;
  set setCurTimetable(int value) {
    _preferences.setInt('curTimetable', value);
  }

  List<TimetableData> get timetables => [
    timetable1,
    timetable2,
    timetable3,
    timetable4,
    timetable5,
  ];

  TimetableData timetable1 = TimetableData(
    name: 'MH - Core',
    batch: 1,
    a: const Course(name: 'Mechanics of Solids and Fluids'),
    b: const Course(name: 'Microcontroller and Embedded Systems'),
    c: const Course(name: 'Numerical Methods'),
    d: const Course(name: 'Professional Elective'),
    e: const Course(name: 'Project Management and Industrial Practices'),
    f: const Course(name: 'Artificial Interligence'),
    g: const Course(name: 'Design Thinking and Methodology'),
  );

  TimetableData timetable2 = TimetableData(
    name: 'MH - Robo',
    batch: 2,
    a: const Course(name: 'Mechanics of Solids and Fluids'),
    b: const Course(name: 'Microcontroller and Embedded Systems'),
    c: const Course(name: 'Numerical Methods'),
    d: const Course(name: 'Professional Elective'),
    e: const Course(name: 'Project Management and Industrial Practices'),
    f: const Course(name: 'Artificial Interligence'),
    g: const Course(name: 'Design Thinking and Methodology'),
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
