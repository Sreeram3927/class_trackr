import 'package:flutter/material.dart';
import 'package:infinity_project/data/timetable_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    CourseSelectionPage(),
                    const Center(
                      child: Text('Page 2'),
                    ),
                    const Center(
                      child: Text('Page 3'),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        _currentPage - 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('Previous'),
                  ),
                  TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        _currentPage + 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}


class CourseSelectionPage extends StatefulWidget {
  const CourseSelectionPage({super.key});

  @override
  State<CourseSelectionPage> createState() => _CourseSelectionPageState();
}

class _CourseSelectionPageState extends State<CourseSelectionPage> {
  String? _selectedCourse;

  List courses = TimeTableData.courses;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            value: _selectedCourse,
            onChanged: (newValue) {
              setState(() {
                _selectedCourse = newValue;
              });
            },
            items: courses.map((course) {
              return DropdownMenuItem<String>(
                value: course,
                child: Text(course),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Select Course',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              // Handle the course selection and navigate to the next screen
              if (_selectedCourse != null) {
                // Do something with the selected course
                print('Selected course: $_selectedCourse');
                // Navigate to the next screen or perform any other action
                // Example:
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => NextScreen()),
                // );
              } else {
                // Show a message to ask the user to select a course
                print('Please select a course before proceeding.');
              }
            },
            child: const Text('Next'),
          ),
        ],
      )
    );
  }
}