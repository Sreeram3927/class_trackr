import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:infinity_project/home/onboarding_page.dart';
import 'firebase/firebase_options.dart';
import 'package:infinity_project/data/user_preferences.dart';
import 'home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (Firebase.apps.isNotEmpty) {
    print('Firebase connected');
  } else {
    print('Firebase not connected');
  }
  await UserPreferences.init();
  runApp(const InfinityProject());
}

class InfinityProject extends StatelessWidget {
  const InfinityProject({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'IP - SD',
      home: OnboardingPage(),
      debugShowCheckedModeBanner: true,
      themeMode: ThemeMode.light,
    );
  }
}
