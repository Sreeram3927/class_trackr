import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  static final CollectionReference _startUpRef = FirebaseFirestore.instance.collection('startup');

  final DocumentReference _initData = _startUpRef.doc('initData');
  Stream<DocumentSnapshot> get initData {
    return _initData.snapshots();
  }
  
  
}