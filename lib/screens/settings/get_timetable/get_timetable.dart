import 'package:flutter/material.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/services/db.dart';

class GetTimetable extends StatefulWidget {
  const GetTimetable({super.key});

  @override
  State<GetTimetable> createState() => _GetTimetableState();
}

class _GetTimetableState extends State<GetTimetable> {

  final DatabaseService _db = DatabaseService();
  final UserData _userData = UserData();

  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  TimetableData? _newTimetableData;

  String? _code;
  bool _isLoading = false;

  Future<void> _searchTimetable(String? code) async {
    _codeFocus.unfocus();
    if (code == null || code.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid code'),
        ),
      );
      return;
    }
    setState(() {_isLoading = true;});
    try {
      _newTimetableData = await _db.getTimetableData(code);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Check your code or try again later.'),
          ),
        );
      }
    }
    _showTimetableStorage();
    setState(() {_isLoading = false;});
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

            ElevatedButton(
              // onPressed: () => _searchTimetable(_code),
              onPressed: () {
                showDialog(context: context, builder: (_) => _showTimetableStorage());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 10.0),
                child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10.0),
                      Text('Search'),
                    ],
                  )
                ,
              ),
            ),

            const SizedBox(height: 10.0),

          ],
        ),
      ),
    );
  }

  Widget _showTimetableStorage() {

    final data = _userData.timetables;

    return AlertDialog(
      title: const Text(
        'Store Timetable',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(data.length, (index) {

          final TimetableData curData = data[index];
          final bool hasData = curData.name.isNotEmpty;

          return TextButton(
            child: Text(
              "${index + 1}.  ${hasData ? curData.name : 'Available'}",
              style: TextStyle(
                color: hasData ? null : Colors.grey,
              ),
            ),
            onPressed: () {
              if (hasData) {
                // setValue(index);
              }
            },
          );
        }),
      ),
    );
  }

}