import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  //final int idx = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$index'),
            subtitle: Text('testing - $index'),
           onTap: () {},
          );
        });
  }
}
