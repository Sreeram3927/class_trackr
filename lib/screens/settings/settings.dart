import 'package:flutter/material.dart';
import 'package:infinity_project/screens/settings/settings_functions.dart';
import 'package:infinity_project/data/user_data.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    final UserData _userData = UserData();

    void setData() {
      Navigator.pop(context);
      // setState(() => UserPreferences.refreshData());
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w800
          ),
        ),
        centerTitle: true,
        toolbarHeight: 55.0,
        elevation: 5.0,
      ),

      body: ListView(
        children: [
    
          ListTile(
            title: Text(
              'Change Timetable',
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              _userData.getTimetable().name!,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w300
              ),
            ),
            onTap: () {

            }
          ),
    
      //     changeSettingsTile(
      //       name: 'Change Lab Batch',
      //       valueKey: 'batch',
      //       data: Subject.batches,
      //       currentValue: Subject.currentBatch,
      //       refresh: setData
      //     )
    
        ],
      ),
    );

  }

  Widget changeSettingsTile({
    required String name,
    required String valueKey,
    required String currentValue,
    required VoidCallback refresh
  }) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        currentValue,
        style: const TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w300
        ),
      ),
      onTap: () {

      }
    );
  }
}
