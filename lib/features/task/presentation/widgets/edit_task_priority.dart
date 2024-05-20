import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';

class EditTaskPriorityDialog extends StatefulWidget {
  const EditTaskPriorityDialog({super.key});

  @override
  _TaskPriorityDialogState createState() => _TaskPriorityDialogState();
}

class _TaskPriorityDialogState extends State<EditTaskPriorityDialog> {
  int _selectedPriority = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xff363636),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color(0xff363636),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Edit Task Priority',
                  style: getLato(FontWeight.w700, 16, whiteTextColour)),
            ),
            const Divider(color: Color(0xff979797), height: 10),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                int priority = index + 1;
                bool isSelected = _selectedPriority == priority;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPriority = priority;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xff8687E7)
                          : const Color(0xff272727),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/flagtpFlag.svg',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$priority',
                          style: getLato(FontWeight.w400, 16, whiteTextColour),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
                      Navigator.pop(context);
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
