import 'package:flutter/material.dart';
import 'package:infinity_project/data/timetable_data.dart';
import 'package:infinity_project/screens/settings/settings_button/settings_button.dart';

class Settings extends StatelessWidget {
  static ValueNotifier course = ValueNotifier(DayOrder.curCourse);
  static ValueNotifier lang = ValueNotifier(DayOrder.curLang);
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> settings = [
      changeData(context, 'Change Course/Batch', DayOrder.curCourse, true),
      changeData(context, 'Change Foreign Language', DayOrder.curLang, false),
      feedbackForm(),
      darkTheme(context),
      sourceCode(),
      aboutApp(context, 'App Name', 'IP_SD', 'IP_SD'),
      aboutApp(context, 'App Version', '0.3.1', 'For updates check Discord')
    ];

    return ValueListenableBuilder(
      valueListenable: course,
      child: null,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: settings.length,
          itemBuilder: (context, index) => settings[index],
        );
      },
    );
  }
}
