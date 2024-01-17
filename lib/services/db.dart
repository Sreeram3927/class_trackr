import 'package:cloud_firestore/cloud_firestore.dart';

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
  
}