import 'package:infinity_project/models/course.dart';

class TimetableData {

  final String name;
  final int batch;
  
  Map<String, Course> data = {};

  final List<String> _slotsCommen = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
  final List<String> _slotsBatch1 = ['p6', 'p7', 'p8', 'p9', 'p10', 'p11', 'p12', 'p13', 'p14', 'p15', 'p26', 'p27', 'p28', 'p29', 'p30', 'p31', 'p32', 'p33', 'p34', 'p35', 'p46', 'p47', 'p48', 'p49', 'p50'];
  final List<String> _slotsBatch2 = ['p1', 'p2', 'p3', 'p4', 'p5', 'p16', 'p17', 'p18', 'p19', 'p20', 'p21', 'p22', 'p23', 'p24', 'p25', 'p36', 'p37', 'p38', 'p39', 'p40', 'p41', 'p42', 'p43', 'p44', 'p45'];
  late List<String> totalSlots;
  late List<String> availableSlots;

  TimetableData({
    required this.name,
    required this.batch,
    required this.data,
  }) {

    totalSlots = _slotsCommen + (batch == 1 ? _slotsBatch1 : _slotsBatch2);
    availableSlots = List.from(totalSlots);
    _checkData();
  }

  void _checkData() {
    data.forEach((key, value) {
      if (totalSlots.contains(key)) {
        availableSlots.remove(key);
      }
    });
  }

  List<Course> getTimetable(int dayOrder) {
    final timeTable = getInfo()[dayOrder]!.where((course) => course != null).toList();
    timeTable.asMap().forEach((index, course) {
      course!.timing = hours[index + 1]!;
    });
    return timeTable.cast<Course>();
  }



  Map<int, String> hours = {
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

  Map<int, List<Course?>> getInfo() {
   if (batch == 1) {
     return {
      1: [
        data['a'],
        data['a'],
        data['f'],
        data['f'],
        data['g'],
        data['p6'],
        data['p7'],
        data['p8'],
        data['p9'],
        data['p10'],
      ],

      2: [
        data['p11'],
        data['p12'],
        data['p13'],
        data['p14'],
        data['p15'],
        data['b'],
        data['b'],
        data['g'],
        data['g'],
        data['a'],
      ],

      3: [
        data['c'],
        data['c'],
        data['a'],
        data['d'],
        data['b'],
        data['p26'],
        data['p27'],
        data['p28'],
        data['p29'],
        data['p30'],  
      ],

      4: [
        data['p31'],
        data['p32'],
        data['p33'],
        data['p34'],
        data['p35'],
        data['d'],
        data['d'],
        data['b'],
        data['e'],
        data['c'],
      ],

      5: [
        data['e'],
        data['e'],
        data['c'],
        data['f'],
        data['d'],
        data['p46'],
        data['p47'],
        data['p48'],
        data['p49'],
        data['p50'],
      ],
    };
   } else {
     return {
      1 : [
        data['p1'],
        data['p2'],
        data['p3'],
        data['p4'],
        data['p5'],
        data['a'],
        data['a'],
        data['f'],
        data['f'],
        data['g'],
      ],

      2 : [
        data['b'],
        data['b'],
        data['g'],
        data['g'],
        data['a'],
        data['p16'],
        data['p17'],
        data['p18'],
        data['p19'],
        data['p20'],
      ],

      3 : [
        data['p21'],
        data['p22'],
        data['p23'],
        data['p24'],
        data['p25'],
        data['c'],
        data['c'],
        data['a'],
        data['d'],
        data['b'],
      ],

      4 : [
        data['d'],
        data['d'],
        data['b'],
        data['e'],
        data['c'],
        data['p36'],
        data['p37'],
        data['p38'],
        data['p39'],
        data['p40'],
      ],

      5 : [
        data['p41'],
        data['p42'],
        data['p43'],
        data['p44'],
        data['p45'],
        data['e'],
        data['e'],
        data['c'],
        data['f'],
        data['d'],
      ],
    };
   } 
  }
}