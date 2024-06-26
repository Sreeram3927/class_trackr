import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_project/data/user_data.dart';
import 'package:infinity_project/models/course.dart';
import 'package:infinity_project/models/timetable_data.dart';
import 'package:infinity_project/screens/settings/cloud_timetable/set_timtable.dart';
import 'package:infinity_project/screens/settings/edit_timetable/edit_info.dart';

class EditTimetablePage extends StatefulWidget {
  final int id;
  final TimetableData timetable;
  const EditTimetablePage({
    super.key,
    required this.id,
    required this.timetable
  });

  @override
  State<EditTimetablePage> createState() => _EditTimetablePageState();
}

class _EditTimetablePageState extends State<EditTimetablePage> {

  final UserData _userData = UserData();

  late String? _timetableName;
  late int? _selectedBatch;
  late Map<String, Course> _data;

  late List<String> _usdSlots;
  late List<String> _avaSlots;

  final _formKey = GlobalKey<FormState>();

  void uploadTimetable() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final bool? result = await Navigator.push<bool?>(
        context,
        MaterialPageRoute(
          builder: (context) => SetTimetable(
            timetableData: TimetableData(
              name: _timetableName!,
              batch: _selectedBatch!,
              data: _data,
            ),
          ),
        ),
      );
      if (result == true) {

      }
    }
  }

  void saveTimetable() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_usdSlots.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please add at least one slot'),
          ),
        );
      } else {
        final newTimetable = TimetableData(
          name: _timetableName!,
          batch: _selectedBatch!,
          data: _data,
        );
        _userData.setTimetable(widget.id, newTimetable);
        Navigator.pop(context, true);
        Fluttertoast.showToast(msg: "Timetable Updated",);
      }
    }
  }

  void _resetState() {
    _timetableName = widget.timetable.name;
    _selectedBatch = widget.timetable.batch;
    _data = Map.of(widget.timetable.data);
    _usdSlots = List.from(widget.timetable.usedSlots);
    _avaSlots = List.from(widget.timetable.availableSlots);
  }

  @override
  void initState() {
    super.initState();
    _resetState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          final bool? shdPop = await showDialog(context: context,
            builder: (context) => AlertDialog(
              title: const Text('Discard Changes?'),
              content: const Text('Are you sure you want to discard the changes?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Discard'),
                ),
              ],
            )
          );
          if (shdPop == true && context.mounted) {
            _resetState();
            Navigator.pop(context, false);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Timetable'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: uploadTimetable,
              tooltip: 'Upload Timetable',
              icon: const Icon(Icons.upload_rounded),
            ),
          ]
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
              ],
            ),
          ),
        ),
        floatingActionButton: _addSlot(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: saveTimetable,
            icon: const Icon(Icons.save),
            label: const Text('Save Changes'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
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
        border: OutlineInputBorder(),
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

    void updateBatch(int? value) async {
      final result = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Change Batch?'),
          content: const Text('Changing batch will remove all the existing timetable slot datas. Are you sure you want to change the batch?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Change'),
            ),
          ],
        )
      );
      if (result == true) {
        setState(() {
          _selectedBatch = value;
          _data.clear();
          _avaSlots.addAll(_usdSlots);
          _usdSlots.clear();
        });
      }
    }

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
            onChanged: updateBatch,
          ),
          const Text('Batch 1'),
          const SizedBox(width: 20.0),
          Radio<int>(
            value: 2,
            groupValue: _selectedBatch,
            onChanged: updateBatch,
          ),
          const Text('Batch 2'),
        ],
      ),
    );
  }

  Widget _addSlot() {
    return FloatingActionButton(
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_rounded),
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
                IconButton(
                  icon: const Icon(Icons.delete_forever_rounded, color: Colors.red,),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Delete Slot ${slot.toUpperCase()}'),
                        content: const Text('Are you sure you want to delete this slot?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _usdSlots.remove(slot);
                                _avaSlots.add(slot);
                                _data.remove(slot);
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('Delete', style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      )
                    );
                  },
                ),
              ],
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