import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';

class EditTaskDialog extends StatefulWidget {
  final Map<String, dynamic> task;

  const EditTaskDialog({Key? key, required this.task}) : super(key: key);

  @override
  _EditTaskDialogState createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController _taskController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.task['title']);
    _descriptionController =
        TextEditingController(text: widget.task['description']);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xff363636),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0xff363636),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Edit Task Title',
                  style: getLato(FontWeight.w500, 15, whiteTextColour)),
            ),
            const Divider(
              color: Color(0xff979797),
              height: 12,
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _taskController,
              style: getLato(FontWeight.w400, 18, whiteTextColour),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff363636),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff979797),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Task',
                hintStyle: const TextStyle(color: Color(0xffAFAFAF)),
              ),
            ),
            TextField(
              controller: _descriptionController,
              style: getLato(FontWeight.w400, 18, whiteTextColour),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff363636),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff979797),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Description',
                hintStyle: const TextStyle(color: Color(0xffAFAFAF)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff363636),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Cancel',
                        style: getLato(
                            FontWeight.w400, 16, const Color(0xff8687E7)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final updatedTask = {
                        'id': widget.task['id'],
                        'title': _taskController.text,
                        'description': _descriptionController.text,
                      };

                      Navigator.pop(context, updatedTask);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff8687E7)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Edit',
                        style: getLato(FontWeight.w400, 16, whiteTextColour),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
