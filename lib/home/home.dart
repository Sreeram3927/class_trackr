import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_project/home/onboarding_pages.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';
import 'package:url_launcher/url_launcher.dart';


enum DrawerSections {
  timeTable,
  settings,
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _currentPage = DrawerSections.timeTable;

  Future<void> _discord() async {
    Uri discordUrl = Uri.parse("https://discord.gg/AK3sFcKVtf");
    if (!await launchUrl(
      discordUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $discordUrl');
    }
  
  }

  @override
  Widget build(BuildContext context) {

    Widget screen = const TimeTable();
    String title = "TimeTable";

    if (_currentPage == DrawerSections.timeTable) {
      screen = const TimeTable();
      title = "TimeTable";
    } else if (_currentPage == DrawerSections.settings) {
      screen = const Settings();
      title = "Settings";
    }

    return SafeArea(
      child: Scaffold(

        backgroundColor: const Color(0xFFCCDAD1),
    
        appBar: AppBar(
          elevation: 5.0,
          backgroundColor: const Color(0xFF38302E),
          foregroundColor: const Color(0xFFCCDAD1),
          toolbarHeight: 55.0,

          title: Text(
            title,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800
            )
          ),
          centerTitle: true,

          actions: [
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.help_rounded),
              tooltip: "Help",
            ),
          ],
        ),

        body: screen,

        drawer: Drawer(
          backgroundColor: const Color(0xFFCCDAD1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                drawerHeader(),
                drawerList(),
              ],
            ),
          ),
        )
      ),
    );
  }

  
  Widget drawerHeader() {
    return Container(
      color: const Color(0xFF38302E),
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

  Widget drawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "TimeTable", Icons.calendar_today_rounded, _currentPage == DrawerSections.timeTable ? true : false),
          
          menuItem(2, "Settings", Icons.settings_outlined, _currentPage == DrawerSections.settings ? true : false),
          
          const Divider(thickness: 1.0,),

          menuItem(3, "Discord", Icons.discord_rounded, false),

          menuItem(4, "Terms of service", Icons.privacy_tip_outlined, false),

          menuItem(5, "Contact Developer", Icons.headset_mic_rounded, false),
          
          const Divider(thickness: 2.0,),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? const Color(0xFF788585).withOpacity(0.35) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          if (id == 3) {
            _discord();
          } else if (id == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TermsAndConditionsPage(showCheckbox: false,))
            );
          } else if (id == 5) {
            showDialog(
              context: context,
              builder: (context) => contactDeveloper()
            );
          } else {
            setState(() {
              if (id == 1) {
                _currentPage = DrawerSections.timeTable;
              } else if (id == 2) {
                _currentPage = DrawerSections.settings;
              }
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );  
  }

  Widget contactDeveloper() {

    List contactOptions = [
      [Icons.email_rounded, 'devxpert3927@gmail.com', 'mailto:devxpert3927@gmail.com'],
      [FontAwesomeIcons.instagram, 'Instagram', 'https://www.instagram.com/sreeram3927/'],
      [FontAwesomeIcons.twitter, 'Twitter', 'https://www.twitter.com/sreeram3927/'],
      [FontAwesomeIcons.linkedin, 'LinkedIn', 'https://www.linkedin.com/in/sreeram3927/'],
      [FontAwesomeIcons.github, 'GitHub', 'https://github.com/sreeram3927']
    ];

    return AlertDialog(
      backgroundColor:  const Color(0xFFCCDAD1),
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
              Icon(contactOptions[index][0]),
              const SizedBox(width: 10.0, height: 50.0,),
              GestureDetector(
                child: Text(
                  contactOptions[index][1],
                  style: const TextStyle(
                    color: Color(0xFF38302E),
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