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

  late String? _timetableName;
  late int? _selectedBatch;
  late Map<String, Course> _data;

  late List<String> _usdSlots;
  late List<String> _avaSlots;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _timetableName = widget.timetable.name;
    _selectedBatch = widget.timetable.batch;
    _data = widget.timetable.data;
    _usdSlots = widget.timetable.usedSlots;
    _avaSlots = widget.timetable.availableSlots;
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
              const Divider(),
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
      floatingActionButton: _addSlot(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          const Text(
            'Select Batch:',
            style: TextStyle(
              fontSize: 17.0,
            ),
          ),
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
    );
  }

  Widget _addSlot() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 30),
      child: FloatingActionButton(
        onPressed: () async {
      
          final String? selectedSlot = await showDialog(
            context: context,
            builder: (context) => _slotsPicker(_avaSlots),
          );
          if (selectedSlot == null) return;
      
          if (context.mounted) {
            final Course? result = await showDialog<Course?>(
              context: context,
              builder: (context) => EditInfo(
                slot: selectedSlot,
                course: Course(name: '', code: ''),
              ),
            );
            if (result == null) return;
            setState(() {
              _avaSlots.remove(selectedSlot);
              _usdSlots.add(selectedSlot);
              _data[selectedSlot] = result;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _slotsPicker(List<String> slots) {
    return AlertDialog(
      title: const Text('Add Slot'),
      content: Wrap(
        children: List.generate(slots.length, (index) {
          final String slot = slots[index];
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Chip(
                label: Text(slot.toUpperCase()),
              ),
            ),
            onTap: () {
              Navigator.pop(context, slot);
            },
          );
        }),
      ),
    );
  }

  Widget _slotsUsed() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: _usdSlots.length,
        itemBuilder: (context, index) {
          final String slot = _usdSlots[index];
          final Course course = _data[slot] ?? Course(name: '', code: '');
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
                if (result != null) {
                  setState(() {
                    _data[slot] = result;
                  });
                }
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