import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFCCDAD1),

      appBar: AppBar(
        title: const Text(
          'Informations',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF38302E),
        foregroundColor: const Color(0xFFCCDAD1),
        toolbarHeight: 55.0,
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
          myText('Added lab batches.'),
          const SizedBox(height: 10),
          myText('Added date picker.'),
          const SizedBox(height: 10),
          myText('Added WebApp support (only Mobile friendly view).'),
          const SizedBox(height: 10),
          myText('Imporved Widget perfomances.'),

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
            ? myText('Refresh to Update the WebApp.')
            : myText('App updates are provided by through Discord server.'),

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
