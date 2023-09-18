import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_project/data/meta_data.dart';
import 'package:infinity_project/home/onboarding_screens/onboarding_pages.dart';
import 'package:infinity_project/screens/settings/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int drawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(

      onDestinationSelected: (selectedIndex) {
        setState(() {
          Navigator.pop(context);
          drawerIndex = selectedIndex;
          if (selectedIndex > 0 && selectedIndex < destinations.length) {
          destinations[selectedIndex].navigate(context);
          } else if (selectedIndex >= destinations.length) {
            links[selectedIndex - destinations.length].navigate(context);
          }
        });
      },

      selectedIndex: drawerIndex,

      children: <Widget>[

        drawerHeader(),

        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Screens',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...destinations.map((destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),

        const Divider(indent: 28, endIndent: 28),

        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Other',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...links.map((destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),

      ],
    );
  }

  Widget drawerHeader() {
    Color color = Theme.of(context).colorScheme.primary;
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(90),
        border: Border.all( 
          color: Theme.of(context).colorScheme.primary,
          width: 2.5
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20.0))
      ),

      width: double.infinity,
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

          Text(
            AppMetaData.name,
            style: const TextStyle(
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.w600
            ),
          ),

          Text(
            'Version ${AppMetaData.version} (dV ${AppMetaData.dataVersionFront})',
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
}

class NavDrawerDestination {

  String label;
  Widget? screen;
  Widget? dialog;
  String? url;
  late Widget icon;
  late Widget selectedIcon;

  NavDrawerDestination(
    this.label,
    IconData icon,
    {this.screen, this.dialog, IconData? selectedIcon, this.url}
  ) {
    this.icon = Icon(icon);
    this.selectedIcon = Icon(selectedIcon);
  }

  void navigate(BuildContext context) async {
    if (screen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen!),
      );
    } else if (dialog != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) => dialog!,
      );
    } else if (url != null) {
      Uri link = Uri.parse(url!);
        if (!await launchUrl(
          link,
          mode: LaunchMode.externalApplication,
        )) {
          throw Exception('Could not launch $url');
        }
    }
  }

}

List<NavDrawerDestination> destinations = [
  NavDrawerDestination(
    'TimeTable', Icons.calendar_today_outlined,
    selectedIcon: Icons.calendar_today_rounded,
  ),
  NavDrawerDestination(
    'Settings', Icons.settings_outlined,
    selectedIcon: Icons.settings_rounded,
    screen: const Settings(),
  ),
  NavDrawerDestination(
    'Terms of Service', Icons.privacy_tip_outlined,
    selectedIcon: Icons.privacy_tip_rounded,
    screen: const TermsOfServicePage(),
  ),
];

List<NavDrawerDestination> links = [
  NavDrawerDestination(
    'FeedBack Hub', Icons.feedback_outlined,
    selectedIcon: Icons.feedback_rounded,
    url: 'https://forms.gle/WkEmjMAHRHdEtose8',
  ),
  NavDrawerDestination(
    'Contact Developer', Icons.headset_mic_outlined,
    selectedIcon: Icons.headset_mic_rounded,
    dialog: contactDeveloper(),
  ),
  if (kIsWeb) NavDrawerDestination(
    'Download as a Web App', Icons.download_outlined,
    selectedIcon: Icons.download_rounded,
    dialog: showWebAppDownload(),
  ),
];

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

Widget showWebAppDownload() {
  return const AlertDialog(
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