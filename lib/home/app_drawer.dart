import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_project/home/onboarding_screens/onboarding_pages.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:infinity_project/screens/timetable/timetable.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color(0xFFCCDAD1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          drawerHeader(),
          const SizedBox(height: 15.0,),
          screenList(),
          const Divider(thickness: 2.0),
          linkList(),
          const Divider(thickness: 2.0),
        ],
      ),
    );
  }

  Widget drawerHeader() {
    return Container(
      // color: const Color(0xFF38302E),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          SizedBox(
            height: 75,
            width: 75,
            child: ClipOval(
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Image.asset(
                    'assets/images/class_trackr_logo.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),

          const Text(
            "Class Trackr",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              letterSpacing: 2.0,
              fontSize: 20.0
            ),
          ),

          const Text(
            "Version 0.8.20",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              letterSpacing: 1.5,
              fontSize: 15.0
            ),
          )

        ],
      )
    );
  }

  Widget screenList() {
    List screens = [
    ['TimeTable', const TimeTable(), Icons.calendar_today_rounded],
    ['Settings', const Settings(), Icons.settings_rounded],
    ];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: screens.length,
      itemBuilder: (BuildContext context, int index) {
        final String screenName = screens[index][0];
        final IconData icon = screens[index][2];
        return Material(
          color: index == 0 ? const Color(0xFF788585).withOpacity(0.35) : Colors.transparent,
          child: InkWell(
            onTap: () {
              if (index > 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => screens[index][1]
                  )
                );
              } else {
                Navigator.pop(context);
              }
            },
            child: drawerListTile(icon, screenName),
            ),
        );
      }
    );
  }

  Widget linkList() {
    List data = [
      ['FeedBack Hub', Icons.feedback_rounded, 'https://forms.gle/WkEmjMAHRHdEtose8'],
      ['Terms of Service', Icons.privacy_tip_outlined, const TermsOfServicePage()],
      ['Contact Developer', Icons.headset_mic_rounded, contactDeveloper()],
      if (kIsWeb) ['Download as a Web App', Icons.download_rounded, showWebAppDownload()],
    ];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              if (index == 0) {
                Uri url = Uri.parse(data[index][2]);
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception('Could not launch $url');
                }

              } else if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => data[index][2]
                  )
                );
              } else {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => data[index][2]
                );
              }
            },
            child: drawerListTile(data[index][1], data[index][0]),
            ),
        );
      }
    );
  }

  Widget drawerListTile(IconData icon, String screenName) {
    return Padding(
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
              screenName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
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
              Icon(contactOptions[index][0], size: 25.0,),
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

  Widget showWebAppDownload() {
    return const AlertDialog(
      backgroundColor:Color(0xFFCCDAD1),
      title: Text(
        'Download as a Web App',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'For Desktop: Click on the "Install Class Trackr" button in the address bar.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
            'For Mobile: Click on the 3 dots and select Install App.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

}