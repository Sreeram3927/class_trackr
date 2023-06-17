import 'package:infinity_project/screens/settings/shared_preferences/user_preferences.dart';

class TimeTableData {

  static List courses = [
    'MH-Core',
    'MH-Robo',
  ];

  static String currentCourse = UserPreferences.getData('course') ?? 'MH-Core';

  static Map hour = {
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
        [1, 'EMS'],
        [2, 'EMS'],
        [3, 'PPS'],
        [4, 'PPS'],
        [7, 'GA'],
        [8, 'GA'],
      ],

      2: [
        [3, 'POE'],
        [4, 'POE'],
        [6, 'ACCA'],
        [7, 'ACCA'],
        [10, 'EMS'],
      ],

      3: [
        [1, '420'],
        [2, '420'],
        [3, 'EMS'],
        [4, 'Chem'],
        [5, 'ACCA'],
        [7, 'Chem'],
        [8, 'Chem'],
      ],

      4: [
        [3, 'PPS'],
        [4, 'PPS'],
        [6, 'Chem'],
        [7, 'Chem'],
        [8, 'ACCA'],
        [9, '420'],
        [10, '420'],
      ],

      5: [
        [1, '420'],
        [2, '420'],
        [3, '420'],
        [4, 'PPS'],
        [5, 'Chem'],
        [7, 'C&M'],
        [8, 'C&M'],
        [9, 'C&M'],
        [10, 'C&M'],
      ],
    },

    'MH-Robo' : {
      1 : [
        [1, 'C&M'],
        [2, 'C&M'],
        [3, 'C&M'],
        [4, 'C&M'],
        [6, 'EMS'],
        [7, 'EMS'],
        [8, 'PPS'],
        [9, 'PPS'],
      ],

      2 : [
        [1, 'ACCA'],
        [2, 'ACCA'],
        [5, 'EMS'],
        [7, 'GA'],
        [8, 'GA'],
      ],

      3 : [
        [3, 'POE'],
        [4, 'POE'],
        [6, '420'],
        [7, '420'],
        [8, 'EMS'],
        [9, 'Chem'],
        [10, 'ACCA'],
      ],

      4 : [
        [1, 'Chem'],
        [2, 'Chem'],
        [3, 'ACCA'],
        [4, '420'],
        [5, '420'],
        [9, 'Chem'],
        [10, 'Chem'],
      ],

      5 : [
        [3, 'PPS'],
        [4, 'PPS'],
        [6, '420'],
        [7, '420'],
        [8, '420'],
        [9, 'PPS'],
        [10, 'Chem'],
      ],
    },

  };
}
