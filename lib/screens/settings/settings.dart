import 'package:flutter/material.dart';
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

    final List<Widget> settings = [
      settingsTile('Change Course/Batch', TimeTableData.currentCourse, setData),
      //changeData(context, 'Change Foreign Language', TimeTableData.curLang),
      // feedbackForm(),
      // darkTheme(context),
      // sourceCode(),
      // aboutApp(context, 'App Name', 'IP_SD', 'IP_SD'),
      // aboutApp(context, 'App Version', '0.3.1', 'For updates check Discord')
    ];

    return ListView.builder(
      itemCount: settings.length,
      itemBuilder: (context, index) => settings[index],
    );

  }

  Widget settingsTile(String title, String subtitle, void Function() refresh) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w400
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => selectCourse(title, refresh)
        );
      }
    );
  }
}
