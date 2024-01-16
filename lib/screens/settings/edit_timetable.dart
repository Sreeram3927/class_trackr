import 'package:flutter/material.dart';
import 'package:infinity_project/models/timetable_data.dart';

class EditTimetablePage extends StatefulWidget {
  final TimetableData timetable;
  const EditTimetablePage({
    super.key,
    required this.timetable
  });

  @override
  State<EditTimetablePage> createState() => _EditTimetablePageState();
}

class _EditTimetablePageState extends State<EditTimetablePage> {

  late TimetableData? _timetableData;
  late String? _timetableName;

  @override
  void initState() {
    super.initState();
    _timetableData = widget.timetable;
    _timetableName = widget.timetable.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Timetable'),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              _buildTimetableName(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimetableName() {
    return TextFormField(
      initialValue: _timetableName,
      decoration: const InputDecoration(
        labelText: 'Timetable Name',
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Timetable Name is required';
        }
        return null;
      },
      onSaved: (String? value) {
        _timetableName = value;
      },
    );
  }
}