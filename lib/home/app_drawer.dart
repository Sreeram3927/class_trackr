import 'package:flutter/material.dart';

Widget drawerHeader() {
  return Container(
    color: Colors.green[700],
    width: double.infinity,
    height: 200,
    padding: const EdgeInsets.only(top: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/images/flutter_logo.png')),
          ),
        ),

        const Text(
          "Project Infinity",
          style: TextStyle(color: Colors.white ,fontSize: 20.0),
        )

      ],
    )
  );
}