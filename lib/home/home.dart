import 'package:flutter/material.dart';
import 'package:infinity_project/home/title_bar/title_bar.dart';
import 'package:infinity_project/screens/main_screen.dart';
import 'bottom_navigation_bar/bt_nav_bar.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        children: [
          const TitleBar(),
          Expanded(child: MainScreen()),
        ],
      ),

      bottomNavigationBar: const BtNavBar(),

    );
  }
}