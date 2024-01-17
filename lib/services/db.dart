import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinity_project/data/day_order.dart';

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
  
}