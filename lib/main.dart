import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:infinity_project/services/analytics.dart';
import 'package:infinity_project/screens/home/home.dart';
import 'package:infinity_project/screens/home/onboarding_screens/onboarding_screen.dart';
import 'package:infinity_project/screens/settings/get_timetable/get_timetable.dart';
import 'firebase_options.dart';
import 'package:infinity_project/data/user_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Analytics().init;
  await UserData().init;
  runApp(const InfinityProject());
}

class InfinityProject extends StatelessWidget {
  const InfinityProject({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Trackr',
      // home: UserData().showHome ? const Home() : const OnboardingPage(),
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
      home: const GetTimetable(),
    );
  }
}
