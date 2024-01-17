import 'package:flutter/material.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/screens/home/home.dart';
import 'package:infinity_project/screens/home/onboarding_screens/onboarding_pages.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final UserData _userData = UserData();

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
    _userData.setShowHome(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            changeTimetable(),

            // DataSelectionPage(
            //   dataList: TimeTableData.courses,
            //   dataKey: 'course',
            //   title: 'Course',
            //   buttonText: 'Next',
            //   nextScreen: nextScreen,
            // ),

            // DataSelectionPage(
            //   dataList: Subject.batches,
            //   dataKey: 'batch',
            //   title: 'Lab Batch',
            //   buttonText: 'Get Started',
            //   nextScreen: startApp,
            // ),

          ],
        ),
      )
    );
  }
  Widget changeTimetable() {

    final data = _userData.timetables;
    final currentValue = _userData.getCurTimetable;
    
    void setValue(int value) {
      setState(() {
        _userData.setCurTimetable = value;
      });
    }

    final List<Widget> children = List.generate(data.length, (index) {

      final TimetableData curData = data[index];
      final bool hasData = curData.name.isNotEmpty;

      return Row(
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
                color: hasData ? Colors.black : Colors.grey,
              ),
            ),
            onTap: () {
              if (hasData) {
                setValue(index);
              }
            },
          ),
        ],
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          const Text(
            'Change Timetable',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20.0,),
      
          ...children,

          const SizedBox(height: 20.0,),

          ElevatedButton(
            onPressed: startApp,
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(200.0, 50.0)),
            ),
            child: const Text('Done'),
          ),
      
        ]
      ),
    );
  }
}