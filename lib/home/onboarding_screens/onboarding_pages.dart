import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_project/data/timetable/subjects.dart';
import 'package:infinity_project/data/timetable/timetable_data.dart';

class WelcomePage extends StatelessWidget {
  final void Function() nextScreen;
  const WelcomePage({
    super.key,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                Text(
                  'Welcome to Class Trackr!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 20),
                Text(
                  'Discover the power of efficient scheduling and time management with our cutting-edge Timetable App, currently in the beta stage. We\'re delighted to have you on board as a beta user, and your experience with our app means the world to us.\n\n'
                  'Please be aware that as a beta version, the app may still have some undiscovered quirks and bugs. But don\'t worry! Your feedback is instrumental in helping us identify and fix any issues, making the app even better before its official release.\n\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Here\'s how you can help us improve:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '1. Report Bugs: If you come across any unexpected behavior or encounter bugs while using the app, please let us know immediately. Simply head to the App Drawer and choose "Feedback Hub" or "Contact Developer" to send us your feedback.\n\n'
                  '2. Share Your Suggestions: Have ideas for new features or improvements? We\'d love to hear them! Your valuable suggestions can shape the future of the app and make it more tailored to your needs.\n\n'
                  '3. User Experience Matters: We care about your experience with the app. Let us know if you find any aspects confusing or challenging to navigate, so we can enhance the user interface for everyone.\n\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Terms of Service:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'Before you start using our app, we want to ensure that you are aware of the following Terms and Conditions. By using our app, you agree to the terms outlined below:\n\n'
                  'Accuracy: This app may produce inaccurate results from time to time. While we strive to maintain accuracy, certain factors beyond our control may affect the outcomes. The app\'s functionality and results are provided on an \'as-is\' basis, without any warranties or guarantees of accuracy, completeness, or reliability. Users are encouraged to exercise their own judgment and discretion while interpreting and using the information provided by the app. We shall not be held liable for any consequences resulting from the use of the app or its inaccurate results.\n\n'
                  'Firebase Analytics: We use Firebase Analytics to gain insights into user behavior and app usage. This helps us improve our app\'s performance and user experience. The data collected includes but is not limited to app screens visited, buttons clicked, and interactions within the app.\n\n'
                  'Event Logs: Our app logs various events to track app performance and to identify and troubleshoot issues. These logs may include technical data such as device information, app version, and error reports.\n\n'
                  'Third-Party Services: Our app may use third-party services or APIs to enhance its functionality. Your usage of these services may be subject to their own terms and privacy policies.\n\n'
                  'Push Notifications: With your consent, we may send you push notifications to keep you updated about important app-related information, events, or new features.\n\n'
                  'Usage Tracking and Cookies: We may use cookies or similar technologies to track your usage patterns within the app. This data helps us improve user experience and app functionality.\n\n'
                  'Updates and Changes: Our app and its features may be updated from time to time. By continuing to use the app after such updates, you accept any revised terms and conditions.\n\n'
                  'Contact and Support: If you encounter any issues or have questions about data collection or privacy, please reach out to our support team.\n\n'
                  'By continuing you accept these Terms of service and providing your consent for analytics collection, you acknowledge that you have read and understood our Terms of Service, which outlines in detail how we display information.\n\n'
                  // 'Thank you for choosing Class Trackr! We hope you enjoy the app and have a fantastic user experience.\n\n'
                  // 'Last updated: 23/07/2023\n\n',
                  'Thank You for Joining Us: Thank you for being an essential part of our beta testing community. Together, we can create a Class Trackr an App that revolutionizes the way you manage your daily schedules.\n\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
            ),
            onPressed: nextScreen,
            child: const Text('Continue'),
          )
        ],
      ),
    );
  }
}

class DataSelectionPage extends StatefulWidget {
  final List dataList;
  final String dataKey;
  final String title;
  final void Function() nextScreen;
  final String buttonText;

  const DataSelectionPage({
    super.key,
    required this.dataList,
    required this.dataKey,
    required this.title,
    required this.nextScreen,
    required this.buttonText,
  });

  @override
  State<DataSelectionPage> createState() => _DataSelectionPageState();
}

class _DataSelectionPageState extends State<DataSelectionPage> {
  String? _selectedData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
    
            Text(
              'Select ${widget.title}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
                labelText: 'Your ${widget.title}',
                border: const OutlineInputBorder(),
                labelStyle: const TextStyle(fontSize: 20.0),
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'You can change this later in settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
    
            const SizedBox(height: 70),

                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size(125, 50)),
                  ),
                  onPressed: () {
                    if (_selectedData != null) {
                      Fluttertoast.showToast(
                        msg: 'Selected ${widget.dataKey}: $_selectedData',
                        fontSize: 20
                      );
                      if (widget.dataKey == 'course') {
                        TimeTableData.updateCurrentCourse(_selectedData!);
                      } else if (widget.dataKey == 'batch') {
                        Subject.updateCurrentBatch(_selectedData!);
                      }
                      widget.nextScreen();
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please select a ${widget.dataKey}',
                        fontSize: 20
                      );
                    }
                  },
                  child: Text(widget.buttonText),
                ),
              ],
            ),
      ),
    );
  }
}

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Text(
              'Terms of service',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Before you start using our app, we want to ensure that you are aware of the following Terms and Conditions. By using our app, you agree to the terms outlined below:',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              //'User Profile Creation: To provide you with a personalized experience, we will collect certain information to create and manage your user profile. This may include your name, email address, and other optional details you choose to provide.\n\n'
              //'Data Security: Your data\'s security is of utmost importance to us. We will take all reasonable measures to safeguard your information and prevent unauthorized access, disclosure, or modification.\n\n'
              'Accuracy: This app may produce inaccurate results from time to time. While we strive to maintain accuracy, certain factors beyond our control may affect the outcomes. The app\'s functionality and results are provided on an \'as-is\' basis, without any warranties or guarantees of accuracy, completeness, or reliability. Users are encouraged to exercise their own judgment and discretion while interpreting and using the information provided by the app. We shall not be held liable for any consequences resulting from the use of the app or its inaccurate results.\n\n'
              'Firebase Analytics: We use Firebase Analytics to gain insights into user behavior and app usage. This helps us improve our app\'s performance and user experience. The data collected includes but is not limited to app screens visited, buttons clicked, and interactions within the app.\n\n'
              'Event Logs: Our app logs various events to track app performance and to identify and troubleshoot issues. These logs may include technical data such as device information, app version, and error reports.\n\n'
              //'Data Sharing: We may share anonymized and aggregated data with third-party partners for statistical analysis and research purposes. However, your personal information will never be shared without your explicit consent.\n\n'
              'Third-Party Services: Our app may use third-party services or APIs to enhance its functionality. Your usage of these services may be subject to their own terms and privacy policies.\n\n'
              'Push Notifications: With your consent, we may send you push notifications to keep you updated about important app-related information, events, or new features.\n\n'
              'Usage Tracking and Cookies: We may use cookies or similar technologies to track your usage patterns within the app. This data helps us improve user experience and app functionality.\n\n'
              'Updates and Changes: Our app and its features may be updated from time to time. By continuing to use the app after such updates, you accept any revised terms and conditions.\n\n'
              //'Age Restriction: Our app is intended for users of all ages. However, if you are under the age of 13, you must seek parental consent before using the app.\n\n'
              //'Data Deletion: If you wish to delete your user profile and associated data from our app, please contact our support team.\n\n'
              'Contact and Support: If you encounter any issues or have questions about data collection or privacy, please reach out to our support team.\n\n'
              'By continuing you accept these Terms of service and providing your consent for analytics collection, you acknowledge that you have read and understood our Terms of Service, which outlines in detail how we display information.\n\n'
              'Thank you for choosing Class Trackr! We hope you enjoy the app and have a fantastic user experience.\n\n'
              'Last updated: 20/08/2023\n\n',
              //'[Your Company/Developer Name]',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Terms of service and Privacy policy Accepted.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}