import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List _settings = [
    'App Theme', 
    'Source Code', 
    'App Name', 
    'App Version'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _settings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_settings[index]),
            subtitle: Text('testing - $index'),
            onTap: () {},
          );
        });
  }
}
