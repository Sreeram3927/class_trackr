import 'package:infinity_project/data/timetable_data.dart';
import 'package:infinity_project/data/user_preferences.dart';
import 'package:infinity_project/firebase/firebase_data.dart';

class Subject {

  static List<String> batches = ['Batch 1', 'Batch 2'];

  static String currentBatch =  UserPreferences.getData('batch') ?? 'Batch 1';

  static updateCurrentBatch(String batch) async {
    UserPreferences.setData('batch', batch);
    UserPreferences.refreshData();
    await FirebaseData.analytics.setUserProperty(
      name: 'selected_lab_batch',
      value: batch,
    );
  }

  static Map<String, Map<String, Map<String, dynamic>>> labBatchData = {
    'MH-Core' : {
      'Batch 1' : {
        '21MHC203J' : ['P13', 'P14'],
        '21MHC202J' : ['P9', 'P10'],
        '21MHC204L' : ['P33', 'P34'],
        '21LEM201T' : ['P28',],
        '21PDM201L' : ['P6', 'P7']
      }, 
      'Batch 2' : {
        '21MHC203J' : ['P29', 'P30'],
        '21MHC202J' : ['P11', 'P12'],
        '21MHC204L' : ['P47', 'P48'],
        '21LEM201T' : ['P28',],
        '21PDM201L' : ['P6', 'P7']
      },
    },
    'MH-Robo' : {
      'Batch 1' : {
        '21MHC203J' : ['P22', 'P23'],
        '21MHC202J' : ['P1', 'P2'],
        '21MHC204L' : ['P17', 'P18'],
        '21LEM201T' : ['P25',],
        '21PDM201L' : ['P3', 'P4']
      }, 
      'Batch 2' : {
        '21MHC203J' : ['P43', 'P44'],
        '21MHC202J' : ['P19', 'P20'],
        '21MHC204L' : ['P37', 'P38'],
        '21LEM201T' : ['P25',],
        '21PDM201L' : ['P3', 'P4']
      },
    },
  };

  static List getSlots(String courseCode) {

    List slots = subData[courseCode]['slots'];

    if (labBatchData[TimeTableData.currentCourse]![Subject.currentBatch]![courseCode] != null) {
      slots += (labBatchData[TimeTableData.currentCourse]![Subject.currentBatch]![courseCode]);
    }

    return slots;
  }

  static Map subData = {

    '21MAB201T' : {
      'name' : 'Transforms and Boundary Value Problems',
      'slots' : ['A',], 
    },

    '21MHC203J' : {
      'name' : 'Fluid power system and Automation',
      'slots' : ['B',], 
    },

    '21MHC202J' : {
      'name' : 'Analog and Digital Electronics',
      'slots' : ['C',],
    },

    '21MHS201T' : {
      'name' : 'Thermodynamics and Heat Transfer',
      'slots' : ['D',], 
    },

    '21PDH201T' : {
      'name' : 'Social Engineering',
      'slots' : ['E',], 
    },

    '21MHC201T' : {
      'name' : 'Electrical Actuators and Drives',
      'slots' : ['F',], 
    },

    '21MHC204L' : {
      'name' : 'Electrical Actuators and Drives',
      'slots' : ['dummy',],
    },

    '21LEM202T' : {
      'name' : 'UHV-II: Universal Human Values – Understanding Harmony and Ethical Human Conduct',
      'slots' : ['G',], 
    },

    '21LEM201T' : {
      'name' : 'Professional Ethics',
      'slots' : ['dummy',], 
    },

    '21PDM201L' : {
      'name' : 'Verbal Reasoning',
      'slots' : ['dummy',],
    },


    //First Year Courses

    // '21MHC101P' : ['Elements of Mechatronics Systems', ],

    // '21CSS101J' : ['Programming for Problem Solving', ],

    // '21GNH101J' : ['Philosophy of Engineering'],

    // '21MAB102T' : ['Advanced Calculus and Complex Analysis'],

    // '21BTB103T' : ['Biology'],

    // '21CYB101J' : ['Chemisty'],

    // '21MES102L' : ['Basic Civil and Mechanical Workshop'],

    // '21PDM102L' : ['General Aptitude'],

    // 'GEM' : ['German', '21xxx10xT',],

    // 'FNH' : ['French', '21xxx10xT',],

    // 'SPH' : ['Spanish', '21xxx10xT',],

    // 'CNE' : ['Chinese', '21xxx10xT',],

    // 'KRN' : ['Korean', '21xxx10xT',],

    // 'JPN' : ['Japanese', '21xxx10xT',],

    //'420' : ['Subject Not Found!!', 'Subject Code Not Found',]
  };

}