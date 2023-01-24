import 'package:infinity_project/screens/settings/shared_preferences/user_preferences.dart';

class DayOrder {

  static List course = [
    'MH-Core',
    'MH-Robo',
  ];

  static List lang = [
    'German', 
    'French', 
    'Spanish', 
    'Chinese',
    'Korean',
    'Japanese',
  ];
  static List code = [
    'GEM', 
    'FNH', 
    'SPH', 
    'CNE',
    'KRN',
    'JPN',
  ];

  static String curCourse = UserPreferences.getData('course') ?? 'MH-Core';
  static bool isCore = curCourse == 'MH-core';

  static String curLang = UserPreferences.getData('lang') ?? 'German';
  static String langCode = UserPreferences.getData('langCode') ?? 'GEM';

  static Map ttData = isCore? core : robo;

  static Map core = {
    'dO1': [
      ['Hour 1', '8:00 am', '8:50 am', 'EMS'],
      ['Hour 2', '8:50 am', '9:40 am', 'EMS'],
      ['Hour 3', '9:45 am', '10:35 am', 'PPS'],
      ['Hour 4', '10:40 am', '11:30 am', 'PPS'],
      ['Hour 7', '1:25 pm', '2:15 pm', 'GA'],
      ['Hour 8', '2:20 pm', '3:10 pm', 'GA'],
    ],

    'dO2': [
      ['Hour 3', '9:45 am', '10:35 am', 'POE'],
      ['Hour 4', '10:40 am', '11:30 am', 'POE'],
      ['Hour 6', '12:30 pm', '1:20 pm', 'ACCA'],
      ['Hour 7', '1:25 pm', '2:15 pm', 'ACCA'],
      ['Hour 10', '4:05 pm', '4:55 pm', 'EMS'],
    ],

    'dO3': [
      ['Hour 1', '8:00 am', '8:50 am', '420'],
      ['Hour 2', '8:50 am', '9:40 am', '420'],
      ['Hour 3', '9:45 am', '10:35 am', 'EMS'],
      ['Hour 4', '10:40 am', '11:30 am', 'Chem'],
      ['Hour 5', '11:35 am', '12:25 pm', 'ACCA'],
      ['Hour 7', '1:25 pm', '2:15 pm', 'Chem'],
      ['Hour 8', '2:20 pm', '3:10 pm', 'Chem'],
    ],

    'dO4': [
      ['Hour 3', '9:45 am', '10:35 am', 'PPS'],
      ['Hour 4', '10:40 am', '11:30 am', 'PPS'],
      ['Hour 6', '12:30 pm', '1:20 pm', 'Chem'],
      ['Hour 7', '1:25 pm', '2:15 pm', 'Chem'],
      ['Hour 8', '2:20 pm', '3:10 pm', 'ACCA'],
      ['Hour 9', '3:15 pm', '4:05 pm', langCode],
      ['Hour 10', '4:05 pm', '4:55 pm', '420'],
    ],

    'dO5': [
      ['Hour 1', '8:00 am', '8:50 am', langCode],
      ['Hour 2', '8:50 am', '9:40 am', langCode],
      ['Hour 3', '9:45 am', '10:35 am', '420'],
      ['Hour 4', '10:40 am', '11:30 am', 'PPS'],
      ['Hour 5', '11:35 am', '12:25 pm', 'Chem'],
      ['Hour 7', '1:25 pm', '2:15 pm', 'C&M'],
      ['Hour 8', '2:20 pm', '3:10 pm', 'C&M'],
      ['Hour 9', '3:15 pm', '4:05 pm', 'C&M'],
      ['Hour 10', '4:05 pm', '4:55 pm', 'C&M'],
    ],
  };

  static Map robo = {
    'dO1' : [
      ['Hour 1', '8:00 am', '8:50 am', 'C&M'],
      ['Hour 2', '8:50 am', '9:40 am', 'C&M'],
      ['Hour 3', '9:45 am', '10:35 am', 'C&M'],
      ['Hour 4', '10:40 am', '11:30 am', 'C&M'],
      ['Hour 6', '12:30 pm', '1:20 pm', 'EMS'],
      ['Hour 7', '1:25 pm', '2:15 pm', 'EMS'],
      ['Hour 8', '2:20 pm', '3:10 pm', 'PPS'],
      ['Hour 9', '3:15 pm', '4:05 pm', 'PPS'],
    ],

    'dO2' : [
      ['Hour 1', '8:00 am', '8:50 am', 'ACCA'],
      ['Hour 2', '8:50 am', '9:40 am', 'ACCA'],
      ['Hour 5', '11:35 am', '12:25 pm', 'EMS'],
      ['Hour 7', '1:25 pm', '2:15 pm', 'GA'],
      ['Hour 8', '2:20 pm', '3:10 pm', 'GA'],
    ],

    'dO3' : [
      ['Hour 3', '9:45 am', '10:35 am', 'POE'],
      ['Hour 4', '10:40 am', '11:30 am', 'POE'],
      ['Hour 6', '12:30 pm', '1:20 pm', '420'],
      ['Hour 7', '1:25 pm', '2:15 pm', '420'],
      ['Hour 8', '2:20 pm', '3:10 pm', 'EMS'],
      ['Hour 9', '3:15 pm', '4:05 pm', 'Chem'],
      ['Hour 10', '4:05 pm', '4:55 pm', 'ACCA'],
    ],

    'dO4' : [
      ['Hour 1', '8:00 am', '8:50 am', 'Chem'],
      ['Hour 2', '8:50 am', '9:40 am', 'Chem'],
      ['Hour 3', '9:45 am', '10:35 am', 'ACCA'],
      ['Hour 4', '10:40 am', '11:30 am', langCode],
      ['Hour 5', '11:35 am', '12:25 pm', '420'],
      ['Hour 9', '3:15 pm', '4:05 pm', 'Chem'],
      ['Hour 10', '4:05 pm', '4:55 pm', 'Chem'],
    ],

    'dO5' : [
      ['Hour 3', '9:45 am', '10:35 am', 'PPS'],
      ['Hour 4', '10:40 am', '11:30 am', 'PPS'],
      ['Hour 6', '12:30 pm', '1:20 pm', langCode],
      ['Hour 7', '1:25 pm', '2:15 pm', langCode],
      ['Hour 8', '2:20 pm', '3:10 pm', '420'],
      ['Hour 9', '3:15 pm', '4:05 pm', 'PPS'],
      ['Hour 10', '4:05 pm', '4:55 pm', 'Chem'],
    ],
  };
}
