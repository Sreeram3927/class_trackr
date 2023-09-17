import 'package:infinity_project/data/user_preferences.dart';
import 'package:infinity_project/firebase/firebase_data.dart';

class TimeTableData {

  static List courses = [
    'MH-Core',
    'MH-Robo',
  ];

  static String currentCourse = UserPreferences.getData('course') ?? 'MH-Core';

  static updateCurrentCourse(String course) async {
    UserPreferences.setData('course', course);
    UserPreferences.refreshData();
    await FirebaseData.analytics.setUserProperty(
      name: 'selected_course',
      value: course,
    );
  }

  static Map<int, String> hour = {
    1 : '8:00 am - 8:50 am',
    2 : '8:50 am - 9:40 am',
    3 : '9:45 am - 10:35 am',
    4 : '10:40 am - 11:30 am',
    5 : '11:35 am - 12:25 pm',
    6 : '12:30 pm - 1:20 pm',
    7 : '1:25 pm - 2:15 pm',
    8 : '2:20 pm - 3:10 pm',
    9 : '3:15 pm - 4:05 pm',
    10 : '4:05 pm - 4:55 pm',
  };

  static  Map timetable = {

    'MH-Core' : {
      1: [
        [1, 'A'],
        [2, 'A'],
        [3, 'F'],
        [4, 'F'],
        [5, 'G'],
        [6, 'P6'],
        [7, 'P7'],
        [8, 'P8'],
        [9, 'P9'],
        [10, 'P10'],
      ],

      2: [
        [1, 'P11'],
        [2, 'P12'],
        [3, 'P13'],
        [4, 'P14'],
        [5, 'P15'],
        [6, 'B'],
        [7, 'B'],
        [8, 'G'],
        [9, 'G'],
        [10, 'A'],
      ],

      3: [
        [1, 'C'],
        [2, 'C'],
        [3, 'A'],
        [4, 'D'],
        [5, 'B'],
        [6, 'P26'],
        [7, 'P27'],
        [8, 'P28'],
        [9, 'P29'],
        [10, 'P30'],
      ],

      4: [
        [1, 'P31'],
        [2, 'P32'],
        [3, 'P33'],
        [4, 'P34'],
        [5, 'P35'],
        [6, 'D'],
        [7, 'D'],
        [8, 'B'],
        [9, 'E'],
        [10, 'C'],
      ],

      5: [
        [1, 'E'],
        [2, 'E'],
        [3, 'C'],
        [4, 'F'],
        [5, 'D'],
        [6, 'P46'],
        [7, 'P47'],
        [8, 'P48'],
        [9, 'P49'],
        [10, 'P50'],
      ],
    },

    'MH-Robo' : {
      1 : [
        [1, 'P1'],
        [2, 'P2'],
        [3, 'P3'],
        [4, 'P4'],
        [5, 'P5'],
        [6, 'A'],
        [7, 'A'],
        [8, 'F'],
        [9, 'F'],
        [10, 'G'],
      ],

      2 : [
        [1, 'B'],
        [2, 'B'],
        [3, 'G'],
        [4, 'G'],
        [5, 'A'],
        [6, 'P16'],
        [7, 'P17'],
        [8, 'P18'],
        [9, 'P19'],
        [10, 'P20'],
      ],

      3 : [
        [1, 'P21'],
        [2, 'P22'],
        [3, 'P23'],
        [4, 'P24'],
        [5, 'P25'],
        [6, 'C'],
        [7, 'C'],
        [8, 'A'],
        [9, 'D'],
        [10,'B'],        
      ],

      4 : [
        [1, 'D'],
        [2, 'D'],
        [3, 'B'],
        [4, 'E'],
        [5, 'C'],
        [6, 'P36'],
        [7, 'P37'],
        [8, 'P38'],
        [9, 'P39'],
        [10, 'P40'],
      ],

      5 : [
        [1, 'P41'],
        [2, 'P42'],
        [3, 'P43'],
        [4, 'P44'],
        [5, 'P45'],
        [6, 'E'],
        [7, 'E'],
        [8, 'C'],
        [9, 'F'],
        [10, 'D'],
      ],
    },

  };
}