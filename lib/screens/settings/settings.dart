import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/screens/home/onboarding_screens/onboarding_pages.dart';
import 'package:infinity_project/screens/settings/edit_timetable.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final UserData _userData = UserData();

  @override
  Widget build(BuildContext context) {
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

          drawerHeader(),

          _settingsTile(
            icon: Icons.edit_calendar_rounded,
            title: 'Change Timetable',
            subtitle: _userData.timetables[_userData.getCurTimetable].name,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => changeTimetable()
              );
            }
          ),

          _settingsTile(
            icon: Icons.privacy_tip_rounded,
            title: 'Terms of Service',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsOfServicePage()),
              );
            }
          ),

          _settingsTile(
            icon: Icons.feedback_rounded,
            title: 'Feedback Hub',
            onTap: () async {
              Uri link = Uri.parse('https://forms.gle/WkEmjMAHRHdEtose8');
              if (!await launchUrl(
                link,
                mode: LaunchMode.externalApplication,
              )) {
                throw Exception('Could not launch $link');
              }
            }
          ),

          _settingsTile(
            icon: Icons.headset_mic_rounded,
            title: 'Contact Developer',
            onTap: () {
              showDialog(
                context: context, 
                builder: (context) => contactDeveloper()
              );
            }
          ),

        ],
      ),
    );
  }

  Widget drawerHeader() {
    Color color = Theme.of(context).colorScheme.primary;
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          CircleAvatar(
            radius: 40.0,
            backgroundColor: color,
            child: Image.asset(
              'assets/images/class_trackr_logo.png',
            ),
          ),

          const Text(
            'Class Trackr',
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.w600
            ),
          ),

          Text(
            'Version ${_userData.version} (dV ${_userData.getDataVersion})',
            style: const TextStyle(
              letterSpacing: 1.5,
              fontSize: 15.0,
              fontWeight: FontWeight.w500
            ),
          )

        ],
      )
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required Function() onTap
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30.0,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: subtitle == null ? null : Text(
        subtitle,
        style: const TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w300
        ),
      ),
      onTap: onTap
    );
  }

  Widget changeTimetable() {

    final data = _userData.timetables;
    final currentValue = _userData.getCurTimetable;

    void setValue(int value) {
      setState(() {
        _userData.setCurTimetable = value;
      });
      Navigator.pop(context);
    }

    return AlertDialog(
      title: const Text(
        'Change Timetable',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(data.length, (index) {

          final TimetableData curData = data[index];
          final bool hasData = curData.name.isNotEmpty;

          return Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio(
                value: index,
                groupValue: currentValue,
                onChanged: (value) {
                  if (hasData) {
                    setValue(value!.toInt());
                  }
                },
              ),
              GestureDetector(
                child: Text(
                  hasData ? curData.name : 'Unavailable',
                  style: TextStyle(
                    color: hasData ? Colors.grey[200] : Colors.grey,
                  ),
                ),
                onTap: () {
                  if (hasData) {
                    setValue(index);
                  }
                },
              ),
              // IconButton.filledTonal(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => EditTimetablePage(
              //           timetable: data[index],
              //         )
              //       )
              //     );
              //   },
              //   icon: const Icon(Icons.edit, size: 17.0,),
              // )
            ],
          );
        }),
      ),
    );
  }

  Widget contactDeveloper() {

    List contactOptions = [
      [Icons.email, 'devxpert3927@gmail.com', 'mailto:devxpert3927@gmail.com'],
      [FontAwesomeIcons.squareXTwitter, 'X', 'https://www.twitter.com/sreeram3927/'],
      [FontAwesomeIcons.linkedin, 'LinkedIn', 'https://www.linkedin.com/in/sreeram3927/'],
      [FontAwesomeIcons.github, 'GitHub', 'https://github.com/sreeram3927']
    ];

    return AlertDialog(
      title: const Text(
        'Contact Developer',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Wrap(
        direction: Axis.vertical,
        children: List.generate(contactOptions.length, (index) {
          return Row(
            children: [
              Icon(contactOptions[index][0], size: 25.0,),
              const SizedBox(width: 10.0, height: 50.0,),
              GestureDetector(
                child: Text(
                  contactOptions[index][1],
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () async {
                  Uri url = Uri.parse(contactOptions[index][2]);
                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception('Could not launch $url');
                  }
                },
              )
            ]
          );
        }),
      ),
    );
  }
}
