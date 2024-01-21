import 'package:flutter/material.dart';
import 'package:infinity_project/models/course.dart';

class EditInfo extends StatefulWidget {
  final String slot;
  final Course course;
  const EditInfo({
    super.key,
    required this.slot,
    required this.course
  });

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    String? courseName = widget.course.name;
    String? courseCode = widget.course.code;

    void save() {
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        Navigator.pop(context, Course(name: courseName!, code: courseCode!));
        // print(courseName);
        // print(courseCode);
      }
    }

    return AlertDialog.adaptive(
      title: Text(
        'Slot: ${widget.slot.toUpperCase()}',
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: courseName,
              decoration: const InputDecoration(
                labelText: 'Course Name',
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a course name';
                } else if (value.length > 75) {
                  return 'Course name is too long (Max 75 characters)';
                }
                return null;
              },
              onSaved: (newValue) => courseName = newValue,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              initialValue: courseCode,
              decoration: const InputDecoration(
                labelText: 'Course Code',
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a course code';
                } else if (value.length > 10) {
                  return 'Course code is too long (Max 10 characters)';
                }
                return null;
              },
              onSaved: (newValue) => courseCode = newValue,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            save();
            // Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}