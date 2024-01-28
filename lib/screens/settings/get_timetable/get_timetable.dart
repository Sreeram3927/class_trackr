import 'package:flutter/material.dart';

class GetTimetable extends StatefulWidget {
  const GetTimetable({super.key});

  @override
  State<GetTimetable> createState() => _GetTimetableState();
}

class _GetTimetableState extends State<GetTimetable> {

  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  String? _code;

  void _searchTimetable(String? code) {
    _codeFocus.unfocus();
    print(code);
  }

  @override
  void dispose() {
    _codeController.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'Get Timetable',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25.0),
            
            TextField(
              focusNode: _codeFocus,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter timetable code',
              ),
              onChanged: (value) => _code = value,
              onSubmitted: (_) => _searchTimetable(_code),
            ),
            
            const SizedBox(height: 20.0),

            ElevatedButton.icon(
              onPressed: () => _searchTimetable(_code),
              icon: const Icon(Icons.search),
              label: const Text('Search'),
            ),

            const SizedBox(height: 10.0),

          ],
        ),
      ),
    );
  }
}