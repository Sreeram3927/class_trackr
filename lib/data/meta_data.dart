import 'package:infinity_project/data/user_preferences.dart';

class AppMetaData {

  static String name = 'Class Trackr';

  static String version = '0.9.21';

  static String storedVersion = UserPreferences.getData('version') ?? version;

  static int dataVersionFront = UserPreferences.getVersion('data_version') ?? 0;

}