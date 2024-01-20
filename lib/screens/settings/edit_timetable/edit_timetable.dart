import 'package:flutter/material.dart';
import 'package:infinity_project/models/course.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/screens/settings/edit_timetable/edit_info.dart';

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

  late TimetableData _timetableData;
  late String? _timetableName;
  late int? _selectedBatch;

  late List<String> _totSlots;
  late List<String> _avaSlots;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _timetableData = widget.timetable;
    _timetableName = _timetableData.name;
    _selectedBatch = _timetableData.batch;
    _totSlots = _timetableData.totalSlots;
    _avaSlots = _timetableData.availableSlots;
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
              Expanded(child: _slotsUsed()),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Save Changes'),
                style: ButtonStyle(
                  maximumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50.0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              )
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

  Widget _slotsUsed() {

    final List<String> usedSlots = _totSlots.where((slot) => !_avaSlots.contains(slot)).toList();
    // final List<String> _unusedSlots = _totSlots.where((slot) => _avaSlots.contains(slot)).toList();

    final Map<String, Course> data = _timetableData.data;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: usedSlots.length,
        itemBuilder: (context, index) {
          final String slot = usedSlots[index];
          final Course course = data[slot] ?? Course(name: '', code: '');
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                slot.toUpperCase(),
              ),
            ),
            title: Text(course.name),
            subtitle: Text(course.code),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final Course? result = await showDialog<Course?>(
                  context: context,
                  builder: (context) => EditInfo(
                    slot: slot,
                    course: course,
                  ),
                );
                // if (result != null) {
                //   setState(() {
                //     data[slot] = result;
                //   });
                // }
                print(result?.name);
                print(result?.code);
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      )
    );
  }
}