import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_project/home/onboarding_screens/onboarding_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  final Map screenNames;
  final String selectedScreen;
  const AppDrawer({
    super.key,
    required this.screenNames,
    required this.selectedScreen,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFCCDAD1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          drawerHeader(),
          const SizedBox(height: 15.0,),
          screenList(),
          const Divider(thickness: 2.0),
          linkList(),
          const Divider(thickness: 2.0),
          const SizedBox(height: 15.0,),
          if (kIsWeb) webUpdateInfo(),
        ],
      ),
    );
  }

  Widget webUpdateInfo() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Download as a Web App for easier access!",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: 16,
          )
        ),
        SizedBox(height: 10.0),
        Text(
          "Refresh to get latest updates",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: 16,
          )
        ),
      ],
    );
  }

  Widget drawerHeader() {
    return Container(
      color: const Color(0xFF38302E),
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
              child: Image.asset(
                'assets/images/Class Trackr (Logo).jpg',
                fit: BoxFit.cover,
              )
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
            "Version 0.8.15",
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
    Iterable keys = widget.screenNames.keys;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: keys.length,
      itemBuilder: (BuildContext context, int index) {
        final String screenName = keys.elementAt(index);
        final String currentScreen = widget.selectedScreen;
        final IconData icon = widget.screenNames[screenName][1];
        return Material(
          color: screenName == currentScreen ? const Color(0xFF788585).withOpacity(0.35) : Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context, screenName);
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
      ['Terms of Service', Icons.privacy_tip_outlined, const TermsAndConditionsPage(showCheckbox: false)],
      ['Contact Developer', Icons.headset_mic_rounded, contactDeveloper()],
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
      [Icons.email_rounded, 'devxpert3927@gmail.com', 'mailto:devxpert3927@gmail.com', 0.0],
      [const IconData(0x1D54F), 'X', 'https://www.twitter.com/sreeram3927/', 10.0],
      [FontAwesomeIcons.linkedin, 'LinkedIn', 'https://www.linkedin.com/in/sreeram3927/', 0.0],
      [FontAwesomeIcons.github, 'GitHub', 'https://github.com/sreeram3927', 0.0]
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
              Padding(
                padding: EdgeInsets.only(bottom: contactOptions[index][3]),
                child: Icon(contactOptions[index][0]),
              ),
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