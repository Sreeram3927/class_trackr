import 'package:flutter/material.dart';
import 'package:infinity_project/models/course.dart';
import 'package:infinity_project/models/timetable_data.dart';

class SetTimetable extends StatefulWidget {
  final TimetableData timetableData;
  const SetTimetable({
    super.key,
    required this.timetableData,
  });

  @override
  State<SetTimetable> createState() => _SetTimetableState();
}

class _SetTimetableState extends State<SetTimetable> {

  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  late final TimetableData _timetableData;

  @override
  void initState() {
    super.initState();
    _timetableData = widget.timetableData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Timetable'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              focusNode: _codeFocus,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Code',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // _searchTimetable(_codeController.text);
              },
              child: const Text('Upload'),
            ),
            const SizedBox(height: 20),
            // if (_isLoading) const CircularProgressIndicator(),
            const Text(
              'Timetable data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: _timetable(),
            )
          ],
        ),
      ),
    );
  }

  Widget _timetable() {
    final usdSlots = _timetableData.usedSlots;
    final data = _timetableData.data;
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
        itemCount: usdSlots.length,
        itemBuilder: (context, index) {
          final String slot = usdSlots[index];
          final Course course = data[slot] ?? Course(name: '', code: '');
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                slot.toUpperCase(),
              ),
            ),
            title: Text(
              course.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              course.code,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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