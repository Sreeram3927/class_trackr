import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_project/data/subjects.dart';
import 'package:infinity_project/data/timetable_data.dart';
import 'package:infinity_project/data/user_preferences.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  children: [
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
  final void Function() nextScreen;

  const DataSelectionPage({
    super.key,
    required this.dataList,
    required this.dataKey,
    required this.nextScreen,
  });

  @override
  State<DataSelectionPage> createState() => _DataSelectionPageState();
}

class _DataSelectionPageState extends State<DataSelectionPage> {
  String? _selectedData;

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
    
            const SizedBox(height: 35),
    
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
                labelText: widget.dataKey[0].toUpperCase() + widget.dataKey.substring(1),
                border: const OutlineInputBorder(),
                labelStyle: const TextStyle(color: Color(0xFF38302E), fontSize: 20.0),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF38302E))
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF38302E))
                )
              ),
            ),
    
            const SizedBox(height: 75),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF38302E)),
                    fixedSize: MaterialStateProperty.all<Size>(const Size(125, 50)),
                  ),
                  onPressed: () {
                    if (_selectedData != null) {
                      Fluttertoast.showToast(
                        msg: 'Selected ${widget.dataKey}: $_selectedData',
                        fontSize: 20
                      );
                      UserPreferences.setData(widget.dataKey, _selectedData!);
                      widget.nextScreen();
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please select a ${widget.dataKey}',
                        fontSize: 20
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
      ),
    );
  }
}