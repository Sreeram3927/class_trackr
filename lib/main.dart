import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:infinity_project/data/meta_data.dart';
import 'package:infinity_project/firebase/firebase_data.dart';
import 'package:infinity_project/home/onboarding_screens/onboarding_screen.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';
import 'firebase/firebase_options.dart';
import 'package:infinity_project/data/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseData.analyticsInit();
  await UserPreferences.init();
  runApp(const InfinityProject());
}

class InfinityProject extends StatelessWidget {
  const InfinityProject({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppMetaData.name,
      home: UserPreferences.showHome ? const TimeTable() : const OnboardingPage(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
      ),
    );
  }
}
