import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinity_project/data/day_order.dart';
import 'package:infinity_project/models/timetable_data.dart';

class DatabaseService {

  static final CollectionReference _startUpRef = FirebaseFirestore.instance.collection('start_up');

  final DocumentReference _initData = _startUpRef.doc('initData');
  Stream<DocumentSnapshot> get initData {
    return _initData.snapshots();
  }
  Future<Map<String, dynamic>> getInitData() async {
    try {
      DocumentSnapshot snapshot = await _initData.get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDayOrders() async {
    try {
      
      final DayOrder dO = DayOrder();
      final List<String> dayOrder_1 = dO.dayOrder_1();
      final List<String> dayOrder_2 = dO.dayOrder_2();
      final List<String> dayOrder_3 = dO.dayOrder_3();
      final List<String> dayOrder_4 = dO.dayOrder_4();
      final List<String> dayOrder_5 = dO.dayOrder_5();

      await _initData.update(
        {
          'day_orders': {
            'day_order_1': dayOrder_1,
            'day_order_2': dayOrder_2,
            'day_order_3': dayOrder_3,
            'day_order_4': dayOrder_4,
            'day_order_5': dayOrder_5,
          }
        }
      );
    } catch (e) {
      rethrow;
    }
  }

  static final CollectionReference _timetablesRef = FirebaseFirestore.instance.collection('timetables');

  Future<TimetableData> getTimetableData(String code) async {
    try {
      final DocumentSnapshot cloudData = await _timetablesRef.doc(code).get();
      final Map<String, dynamic> timetableData = cloudData.data() as Map<String, dynamic>;
      
      final TimetableData data = TimetableData.fromJson(timetableData);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setTimetableData(String code, TimetableData data) async {
    try {
      final DocumentSnapshot existingData = await _timetablesRef.doc(code).get();
      if (existingData.exists) {
        print('Timetable data with code $code already exists.');
      } else {
        await _timetablesRef.doc(code).set(data.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }
}