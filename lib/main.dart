import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/shared_preferences/user_preferences.dart';
import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const InfinityProject());
}

class InfinityProject extends StatelessWidget {
  const InfinityProject({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'IP - SD',
      home: Home(),
      debugShowCheckedModeBanner: true,
      themeMode: ThemeMode.light,
    );
  }
}
