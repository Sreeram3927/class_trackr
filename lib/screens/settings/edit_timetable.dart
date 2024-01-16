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
  late int? _selectedBatch;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _timetableData = widget.timetable;
    _timetableName = widget.timetable.name;
    _selectedBatch = widget.timetable.batch;
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
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
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              _timetableNameEditor(),
              _batchEditor(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timetableNameEditor() {
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

  Widget _batchEditor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        const Text(
          'Select Batch:',
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Radio<int>(
              value: 1,
              groupValue: _selectedBatch,
              onChanged: (int? value) {
                setState(() {
                  _selectedBatch = value;
                });
              },
            ),
            const Text('Batch 1'),
            const SizedBox(width: 20.0),
            Radio<int>(
              value: 2,
              groupValue: _selectedBatch,
              onChanged: (int? value) {
                setState(() {
                  _selectedBatch = value;
                });
              },
            ),
            const Text('Batch 2'),
          ],
        ),
      ],
    );
  }
}