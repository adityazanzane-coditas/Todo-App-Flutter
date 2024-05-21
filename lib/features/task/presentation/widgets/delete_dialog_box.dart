import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';

class DeleteTaskDialog extends StatelessWidget {
  final String taskTitle;
  final VoidCallback onDeleteTask;

  const DeleteTaskDialog({
    super.key,
    required this.taskTitle,
    required this.onDeleteTask,
  });

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
              child: Text('Edit Task title',
                  style: getLato(FontWeight.w500, 15, whiteTextColour)),
            ),
            const Divider(
              color: Color(0xff979797),
              height: 12,
            ),
            const SizedBox(height: 14),
            Text(
              'Are You sure you want to delete this task?\n Task title : $taskTitle',
              style: getLato(FontWeight.w500, 18, whiteTextColour),
            ),
            const SizedBox(height: 14),
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
                    onPressed: onDeleteTask,
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
                        'Delete',
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
