import 'package:flutter/material.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/data/timetable_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void nextScreen() {
    _pageController.animateToPage(
      _currentPage - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void previousScreen() {
    _pageController.animateToPage(
      _currentPage + 1,
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
                    DataSelectionPage(
                      dataList: TimeTableData.courses,
                      dataKey: 'course',
                      selectedData: TimeTableData.currentCourse,
                    ),
                    DataSelectionPage(
                      dataList: Subject.batches,
                      dataKey: 'batch',
                      selectedData: Subject.currentBatch,
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
                    onPressed: nextScreen,
                    child: const Text('Previous'),
                  ),
                  TextButton(
                    onPressed: previousScreen,
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


class DataSelectionPage extends StatefulWidget {
  final List dataList;
  final String dataKey;
  final String? selectedData;

  const DataSelectionPage({
    super.key,
    required this.dataList,
    required this.dataKey,
    required this.selectedData,
  });

  @override
  State<DataSelectionPage> createState() => _DataSelectionPageState();
}

class _DataSelectionPageState extends State<DataSelectionPage> {
  String? _newData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
    
            Text(
              'Select ${widget.dataKey}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:  Color(0xFF38302E)
              ),
              textAlign: TextAlign.center,
            ),
    
            const SizedBox(height: 16),
    
            DropdownButtonFormField<String>(
              value: _newData ?? widget.selectedData,
              onChanged: (newValue) {
                setState(() {
                  _newData = newValue;
                });
              },
              items: widget.dataList.map((course) {
                return DropdownMenuItem<String>(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select ${widget.dataKey}',
                border: const OutlineInputBorder(),
              ),
            ),
    
            const SizedBox(height: 16),
    
            ElevatedButton(
              onPressed: () {
                // Handle the course selection and navigate to the next screen
                if (_newData != null) {
                  // Do something with the selected course
                  print('Selected course: $_newData');
                  // Navigate to the next screen or perform any other action
                  // Example:
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NextScreen()),
                  // );
                } else {
                  // Show a message to ask the user to select a course
                  print('Please select a ${widget.dataKey} before proceeding.');
                }
              },
              child: const Text('Next'),
            ),
          ],
        )
      ),
    );
  }
}