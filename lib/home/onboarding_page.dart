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
                    DataSelectionPage(
                      dataList: TimeTableData.courses,
                      dataKey: 'course',
                    ),
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


class DataSelectionPage extends StatefulWidget {
  final List dataList;
  final String dataKey;
  const DataSelectionPage({
    super.key,
    required this.dataList,
    required this.dataKey,
  });

  @override
  State<DataSelectionPage> createState() => _DataSelectionPageState();
}

class _DataSelectionPageState extends State<DataSelectionPage> {
  String? _selectedData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text(
            'Select ${widget.dataKey}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            value: _selectedData,
            onChanged: (newValue) {
              setState(() {
                _selectedData = newValue;
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
              if (_selectedData != null) {
                // Do something with the selected course
                print('Selected course: $_selectedData');
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
    );
  }
}