import 'package:flutter/material.dart';
import 'package:infinity_project/theme_data/theme_data.dart';
import 'home/home.dart';

void main() {
  runApp(const InfinityProject());
}

class InfinityProject extends StatelessWidget {
  const InfinityProject({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IP - SD',
      home: const Home(),

      debugShowCheckedModeBanner: true,

      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      
      
    );
  }
}

