import 'package:flutter/material.dart';

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
                  'Updates and Changes: Our app and its features may be updated from time to time. By continuing to use the app after such updates, you accept any revised terms and conditions.\n\n'
                  'Contact and Support: If you encounter any issues or have questions about data collection or privacy, please reach out to our support team.\n\n'
                  'By continuing you accept these Terms of service and providing your consent for analytics collection, you acknowledge that you have read and understood our Terms of Service, which outlines in detail how we display information.\n\n'
                  // 'Thank you for choosing Class Trackr! We hope you enjoy the app and have a fantastic user experience.\n\n'
                  // 'Last updated: 23/07/2023\n\n'
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
              'Accuracy: This app may produce inaccurate results from time to time. While we strive to maintain accuracy, certain factors beyond our control may affect the outcomes. The app\'s functionality and results are provided on an \'as-is\' basis, without any warranties or guarantees of accuracy, completeness, or reliability. Users are encouraged to exercise their own judgment and discretion while interpreting and using the information provided by the app. We shall not be held liable for any consequences resulting from the use of the app or its inaccurate results.\n\n'
              'Updates and Changes: Our app and its features may be updated from time to time. By continuing to use the app after such updates, you accept any revised terms and conditions.\n\n'
              'Contact and Support: If you encounter any issues or have questions about data collection or privacy, please reach out to our support team.\n\n'
              'By continuing you accept these Terms of service and providing your consent for analytics collection, you acknowledge that you have read and understood our Terms of Service, which outlines in detail how we display information.\n\n'
              'Thank you for choosing Class Trackr! We hope you enjoy the app and have a fantastic user experience.\n\n'
              'Last updated: 21/01/2014\n\n'
              '[Your Company/Developer Name]',
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