import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Informations',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 55.0,
        elevation: 5.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Icon(
            Icons.new_releases,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            "What's New",
            style: TextStyle( fontSize: 24),
          ),
          const SizedBox(height: 10),
          myText('Added dynamic day order changes.'),
          const SizedBox(height: 10),
          myText('Updated day order data.'),
          // const SizedBox(height: 10),
          // myText('Added WebApp support (only Mobile friendly view).'),
          const SizedBox(height: 10),
          myText('Imporved Widget themes.'),
          const SizedBox(height: 20),

          const Divider(thickness: 1.0,),

          const SizedBox(height: 20),
          const Icon(
            Icons.info_outline,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
              "Other Informations",
              style: TextStyle( fontSize: 24),
            ),
          const SizedBox(height: 16),
          kIsWeb 
            ? myText('Refresh to Update the Web App.')
            : myText('Use the latest version to get the latest informations.')
          ,
          const SizedBox(height: 10),
          myText('Timetable Data (Hard-coded) - Subject to Change!'),
          const SizedBox(height: 10),
          myText('Contact developer for adding more courses.'),
          
        ],
      )
    );
  }

  Widget myText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }

}
