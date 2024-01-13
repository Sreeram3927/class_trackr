import 'package:infinity_project/data/user_data.dart';

class AppMetaData {

  final UserData _userData = UserData();

  String name = 'Class Trackr';

  String get version => '0.9.21';

  int dataVersionFront() => _userData.getDataVersion();

}