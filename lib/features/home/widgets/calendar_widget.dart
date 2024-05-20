import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';
import 'package:todo_app/features/home/widgets/choose_time_widget.dart';

class DailyCalendar extends StatelessWidget {
  const DailyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Dialog(
      backgroundColor: const Color(0xff363636),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        width: 400,
        height: 372,
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        decoration: BoxDecoration(
          color: const Color(0xff363636),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
              rowHeight: 38,
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  bool isWeekend = day.weekday == DateTime.saturday ||
                      day.weekday == DateTime.sunday;
                  Color textColor =
                      isWeekend ? const Color(0xffFF4949) : Colors.white;

                  return Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      DateFormat.E().format(day).toUpperCase(),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  );
                },
                headerTitleBuilder: (context, day) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(DateFormat.MMMM().format(day).toUpperCase(),
                          style: getLato(FontWeight.w400, 14, whiteTextColour)),
                      const SizedBox(height: 4),
                      Text(DateFormat.y().format(day),
                          style: getLato(FontWeight.w400, 10, whiteTextColour)),
                    ],
                  );
                },
              ),
              headerVisible: true,
              calendarStyle: CalendarStyle(
                tablePadding: const EdgeInsets.only(top: 6),
                outsideDaysVisible: true,
                cellAlignment: Alignment.center,
                defaultDecoration: BoxDecoration(
                  color: const Color(0xff272727),
                  borderRadius: BorderRadius.circular(8),
                ),
                weekendDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff272727),
                ),
                defaultTextStyle: getLato(FontWeight.w700, 12, whiteTextColour),
                todayTextStyle: getLato(FontWeight.w700, 12, whiteTextColour),
                todayDecoration: BoxDecoration(
                  color: const Color(0xff8687E7),
                  borderRadius: BorderRadius.circular(8),
                ),
                cellMargin: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                weekendTextStyle: getLato(FontWeight.w700, 12, whiteTextColour),
                weekNumberTextStyle: const TextStyle(color: Colors.white),
                rowDecoration: const BoxDecoration(color: Color(0xff363636)),
              ),
              headerStyle: HeaderStyle(
                decoration: const BoxDecoration(
                  color: Color(0xff363636),
                  border: Border(
                    bottom: BorderSide(color: Color(0xff979797), width: 1),
                  ),
                ),
                leftChevronIcon:
                    const Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon:
                    const Icon(Icons.chevron_right, color: Colors.white),
                titleTextStyle: getLato(FontWeight.w400, 14, whiteTextColour),
                formatButtonVisible: false,
                titleCentered: true,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: getLato(FontWeight.w700, 12, whiteTextColour),
                weekendStyle:
                    getLato(FontWeight.w700, 12, const Color(0xffFF4949)),
                decoration: const BoxDecoration(color: Color(0xff363636)),
              ),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 5),
              lastDay: DateTime.utc(2030, 10, 5),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
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
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const ChooseTimeDialog();
                            });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff8687E7)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Choose Time',
                          style: getLato(FontWeight.w400, 16, whiteTextColour),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
