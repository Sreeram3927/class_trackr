import 'package:flutter/material.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/data/timetable_data.dart';
import 'package:infinity_project/data/user_preferences.dart';
import 'package:infinity_project/home/home.dart';
import 'package:infinity_project/home/onboarding_screens/onboarding_pages.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  void nextScreen() {
    pageController.animateToPage(
      currentPage + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void startApp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
    UserPreferences.setShowHome(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCDAD1),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          },
          children: [

            WelcomePage(
              nextScreen: nextScreen,
            ),

            DataSelectionPage(
              dataList: TimeTableData.courses,
              dataKey: 'course',
              title: 'Select your course',
              buttonText: 'Next',
              nextScreen: nextScreen,
            ),

            DataSelectionPage(
              dataList: Subject.batches,
              dataKey: 'batch',
              title: 'Select your lab batch',
              buttonText: 'Get Started',
              nextScreen: startApp,
            ),

          ],
        ),
      )
    );
  }
}
