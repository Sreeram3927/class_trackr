import 'package:flutter/material.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/data/timetable_data.dart';
import 'package:infinity_project/screens/settings/settings_functions.dart';
import 'package:infinity_project/data/user_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    void setData() {
      Navigator.pop(context);
      setState(() => UserPreferences.refreshData());
    }

    // final List<Widget> settings = [
    //   settingsTile('Change Course/Batch', TimeTableData.currentCourse, setData),
    //   //changeData(context, 'Change Foreign Language', TimeTableData.curLang),
    //   // feedbackForm(),
    //   // darkTheme(context),
    //   // sourceCode(),
    //   // aboutApp(context, 'App Name', 'IP_SD', 'IP_SD'),
    //   // aboutApp(context, 'App Version', '0.3.1', 'For updates check Discord')
    // ];

    return Scaffold(

      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),

      body: ListView(
        // itemCount: settings.length,
        // itemBuilder: (context, index) => settings[index],
        children: [
    
          changeSettingsTile(
            name: 'Change Course',
            valueKey: 'course',
            data: TimeTableData.courses,
            currentValue: TimeTableData.currentCourse,
            refresh: setData
          ),
    
          changeSettingsTile(
            name: 'Change Lab Batch',
            valueKey: 'batch',
            data: Subject.batches,
            currentValue: Subject.currentBatch,
            refresh: setData
          )
    
        ],
      ),
    );

  }

  Widget changeSettingsTile({
    required String name,
    required String valueKey,
    required List data,
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
          fontWeight: FontWeight.w400
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => selectCourse(
            name: name,
            valueKey: valueKey,
            data: data, 
            currentValue: data.indexOf(currentValue),
            refresh: refresh
          )
        );
      }
    );
  }
}
