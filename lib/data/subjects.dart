import 'package:infinity_project/data/user_preferences.dart';

class Subject {

  static List<String> batches = ['Batch 1', 'Batch 2'];

  static String currentBatch =  UserPreferences.getData('batch') ?? 'Batch 1';

  Map<String, Map<String, Map<String, List>>> labBatchData = {
    'MH-Core' : {
      'Batch 1' : {
        '21MHC203J' : ['P13', 'P14'],
        '21MHC202J' : ['P9', 'P10'],
        '21MHC201T' : ['P43', 'P44'],
      }, 
      'Batch 2' : {
        '21MHC203J' : ['P39', 'P40'],
        '21MHC202J' : ['P11', 'P12'],
        '21MHC201T' : ['P52', 'P53'],
      },
    },
    'MH-Robo' : {
      'Batch 1' : {
        '21MHC203J' : ['P22', 'P23'],
        '21MHC202J' : ['P1', 'P2'],
        '21MHC201T' : ['P17', 'P18'],
      }, 
      'Batch 2' : {
        '21MHC203J' : ['P43', 'P44'],
        '21MHC202J' : ['P19', 'P20'],
        '21MHC201T' : ['P37', 'P38'],
      },
    },
  };

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

    '21LEM202T' : {
      'name' : 'UHV-II: Universal Human Values – Understanding Harmony and Ethical Human Conduct',
      'slots' : ['G',], 
    },

    '21LEM201T' : {
      'name' : 'Professional Ethics',
      'slots' : ['P38',], 
    },

    '21PDM201L' : {
      'name' : 'Verbal Reasoning',
      'slots' : ['P7', 'P8'], 
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