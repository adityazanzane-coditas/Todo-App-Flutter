import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';

class ChooseTimeDialog extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;
  const ChooseTimeDialog({super.key, required this.onTimeSelected});

  @override
  _ChooseTimeDialogState createState() => _ChooseTimeDialogState();
}

class _ChooseTimeDialogState extends State<ChooseTimeDialog> {
  int _selectedHour = 8;
  int _selectedMinute = 20;
  String _selectedPeriod = 'AM';

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
              child: Text('Choose Time',
                  style: getLato(FontWeight.w500, 16, whiteTextColour)),
            ),
            const Divider(
              color: Color(0xff979797),
              height: 12,
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNumberPicker(
                  context,
                  1,
                  12,
                  _selectedHour,
                  (value) {
                    setState(() {
                      _selectedHour = value;
                    });
                  },
                ),
                const SizedBox(width: 12),
                const Text(
                  ':',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(width: 12),
                _buildNumberPicker(
                  context,
                  0,
                  59,
                  _selectedMinute,
                  (value) {
                    setState(() {
                      _selectedMinute = value;
                    });
                  },
                ),
                const SizedBox(width: 12),
                _buildPeriodPicker(
                  context,
                  _selectedPeriod,
                  (value) {
                    setState(() {
                      _selectedPeriod = value;
                    });
                  },
                ),
              ],
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
                      TimeOfDay selectedTime = TimeOfDay(
                        hour: _selectedHour % 12 == 0 ? 12 : _selectedHour % 12,
                        minute: _selectedMinute,
                      );
                      if (_selectedPeriod == 'PM') {
                        selectedTime = TimeOfDay(
                          hour: (_selectedHour % 12) + 12,
                          minute: _selectedMinute,
                        );
                      }
                      widget.onTimeSelected(selectedTime);
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
                        'Save',
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

  Widget _buildNumberPicker(BuildContext context, int minValue, int maxValue,
      int selectedValue, ValueChanged<int> onChanged) {
    return Stack(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: const Color(0xff272727),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListWheelScrollView.useDelegate(
            itemExtent: 30,
            useMagnifier: true,
            magnification: 1.5,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              onChanged(index + minValue);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                return Center(
                  child: Text(
                    (index + minValue).toString().padLeft(2, '0'),
                    style: getLato(FontWeight.w600, 24, whiteTextColour),
                  ),
                );
              },
              childCount: maxValue - minValue + 1,
            ),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Column(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff272727).withOpacity(0.9),
                        const Color(0xff272727),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff272727),
                        const Color(0xff272727).withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodPicker(BuildContext context, String selectedPeriod,
      ValueChanged<String> onChanged) {
    return Stack(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: const Color(0xff272727),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListWheelScrollView.useDelegate(
            itemExtent: 30,
            useMagnifier: true,
            magnification: 1.5,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              onChanged(index == 0 ? 'AM' : 'PM');
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                return Center(
                  child: Text(
                    index == 0 ? 'AM' : 'PM',
                    style: getLato(FontWeight.w600, 24, whiteTextColour),
                  ),
                );
              },
              childCount: 2,
            ),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Column(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff272727).withOpacity(0.9),
                        const Color(0xff272727),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff272727),
                        const Color(0xff272727).withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
