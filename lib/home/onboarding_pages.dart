import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_project/data/user_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  final void Function() nextScreen;
  const WelcomeScreen({
    super.key,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ListView(
          children: [
            const Text(
              'Welcome to Beta Timetable App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            myText(
              'Discover the power of efficient scheduling and time management with our cutting-edge Timetable App, currently in the beta stage. We\'re delighted to have you on board as a beta user, and your experience with our app means the world to us.'
            ),
            const SizedBox(height: 20),
            myText(
              'Please be aware that as a beta version, the app may still have some undiscovered quirks and bugs. But don\'t worry! Your feedback is instrumental in helping us identify and fix any issues, making the app even better before its official release.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Here\'s how you can help us improve:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            myText(
              '1. Report Bugs: If you come across any unexpected behavior or encounter bugs while using the app, please let us know immediately. Simply head to the Settings page and choose "Contact Developer" to send us your feedback.',              
            ),
            const SizedBox(height: 10),
            myText(
              '2. Share Your Suggestions: Have ideas for new features or improvements? We\'d love to hear them! Your valuable suggestions can shape the future of the app and make it more tailored to your needs.',              
            ),
            const SizedBox(height: 10),
            myText(
              '3. User Experience Matters: We care about your experience with the app. Let us know if you find any aspects confusing or challenging to navigate, so we can enhance the user interface for everyone.',              
            ),
            const SizedBox(height: 20),
            myText(
              'While our beta version may not have cloud sync functionality, rest assured that we\'re continuously working to bring you new and exciting updates in the future. Your patience and understanding are greatly appreciated during this phase.',              
            ),
            const SizedBox(height: 20),
            myText(
              'Data and Privacy: Protecting your data and privacy is our utmost priority. Be confident that your information remains secure within the app.',              
            ),
            const SizedBox(height: 20),
            myText(
              'Thank You for Joining Us: Thank you for being an essential part of our beta testing community. Together, we can create a Timetable App that revolutionizes the way you manage your daily schedules.',              
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF38302E)),
                fixedSize: MaterialStateProperty.all<Size>(const Size(125, 50)),
              ),
              onPressed: nextScreen,
              child: const Text('Next'),
            )
          ],
        ),
      ),
    );
  }
  Widget myText(String data) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 16,
      ),
      textAlign: TextAlign.justify,
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
              dropdownColor: const Color(0xFFCCDAD1),
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

            const SizedBox(height: 7),

            const Text(
              'You can change this later in settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:  Color(0xFF38302E),
              ),
            ),
    
            const SizedBox(height: 70),

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