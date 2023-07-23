import 'package:flutter/material.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/data/timetable_data.dart';
import 'package:infinity_project/home/onboarding_pages.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCDAD1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: [

              WelcomeScreen(
                nextScreen: nextScreen,
              ),

              DataSelectionPage(
                dataList: TimeTableData.courses,
                dataKey: 'course',
                nextScreen: nextScreen,
              ),

              DataSelectionPage(
                dataList: Subject.batches,
                dataKey: 'batch',
                nextScreen: nextScreen,
              ),

              const Center(
                child: Text('Page 3'),
              ),

            ],
          ),
        ),
      )
    );
  }
}
