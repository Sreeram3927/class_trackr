import 'dart:convert';
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
    getTimetableDatas();
  }

  Future<void> setData(String key, String data) async => await _preferences.setString(key, data);
  String? getData(String key) => _preferences.getString(key);

  void setList(String key, List<String> data) => _preferences.setStringList(key, data);
  getList(String key) => _preferences.getStringList(key);

  bool get showHome => _preferences.getBool('showHome') ?? false;
  void setShowHome(bool value) => _preferences.setBool('showHome', value);


  TimetableData getTimetable() {
    return timetables[getCurTimetable];
  }

  static late int _curTimetable;

  int get getCurTimetable => _curTimetable;
  set setCurTimetable(int value) {
    _curTimetable = value;
    _preferences.setInt('curTimetable', value);
  }

  List<TimetableData> get timetables => [
    timetable0,
    timetable1,
    timetable2,
    timetable3,
    timetable4,
  ];

  static late TimetableData timetable0;
  static late TimetableData timetable1; 
  static late TimetableData timetable2; 
  static late TimetableData timetable3; 
  static late TimetableData timetable4;

  void getTimetableDatas() {
    timetable0 = _preferences.containsKey('timetable0') ? TimetableData.fromJson(jsonDecode(getData('timetable0')!)) : _mhCore;
    timetable1 = _preferences.containsKey('timetable1') ? TimetableData.fromJson(jsonDecode(getData('timetable1')!)) : _mhRobo;
    timetable2 = _preferences.containsKey('timetable2') ? TimetableData.fromJson(jsonDecode(getData('timetable2')!)) : _emptyTimetable;
    timetable3 = _preferences.containsKey('timetable3') ? TimetableData.fromJson(jsonDecode(getData('timetable3')!)) : _emptyTimetable;
    timetable4 = _preferences.containsKey('timetable4') ? TimetableData.fromJson(jsonDecode(getData('timetable4')!)) : _emptyTimetable;
    _curTimetable = _preferences.getInt('curTimetable') ?? 0;
  }

  void setTimetable(int id, TimetableData data) {
    switch (id) {
      case 0:
        timetable0 = data;
        setData('timetable0', jsonEncode(data));
        break;
      case 1:
        timetable1 = data;
        setData('timetable1', jsonEncode(data));
        break;
      case 2:
        timetable2 = data;
        setData('timetable2', jsonEncode(data));
        break;
      case 3:
        timetable3 = data;
        setData('timetable3', jsonEncode(data));
        break;
      case 4:
        timetable4 = data;
        setData('timetable4', jsonEncode(data));
        break;
    }
  }

  static final TimetableData _mhCore = TimetableData(
    name: 'MH - Core',
    batch: 1,
    data: {
      'a': Course(name: 'Mechanics of Solids and Fluids'),
      'b': Course(name: 'Microcontroller and Embedded Systems'),
      'c': Course(name: 'Numerical Methods'),
      'd': Course(name: 'Professional Elective'),
      'e': Course(name: 'Project Management and Industrial Practices'),
      'f': Course(name: 'Artificial Interligence'),
      'g': Course(name: 'Design Thinking and Methodology'),
    },
  );

  static final TimetableData _mhRobo = TimetableData(
    name: 'MH - Robo',
    batch: 2,
    data: {
      'a': Course(name: 'Mechanics of Solids and Fluids'),
      'b': Course(name: 'Microcontroller and Embedded Systems'),
      'c': Course(name: 'Numerical Methods'),
      'd': Course(name: 'Professional Elective'),
      'e': Course(name: 'Project Management and Industrial Practices'),
      'f': Course(name: 'Artificial Interligence'),
      'g': Course(name: 'Design Thinking and Methodology'),
    },
  );

  static final TimetableData _emptyTimetable = TimetableData(
    name: '',
    batch: 1,
    data: {},
  );

}
