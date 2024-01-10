import 'package:infinity_project/data/user_data.dart';

class AppMetaData {

  final UserData _userData = UserData();

  String name = 'Class Trackr';

  String version = '0.9.21';

  String storedVersion() => _userData.getData('version') ?? version;

  int dataVersionFront() => _userData.getDataVersion();

}