import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/database/sql_helper.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';
import 'package:todo_app/features/task/presentation/widgets/delete_dialog_box.dart';
import 'package:todo_app/features/task/presentation/widgets/edit_calendar_box.dart';
import 'package:todo_app/features/task/presentation/widgets/edit_category.dart';
import 'package:todo_app/features/task/presentation/widgets/edit_task_details.dart';
import 'package:todo_app/features/task/presentation/widgets/edit_task_priority.dart';

class TaskDetailsPage extends StatefulWidget {
  final Map<String, dynamic> task;
  final void Function(Map<String, dynamic> updatedTask) updateTask;
  final void Function(int id) deleteTask;

  const TaskDetailsPage({
    super.key,
    required this.task,
    required this.updateTask,
    required this.deleteTask,
  });

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  late String _title;
  late String _description;

  @override
  void initState() {
    super.initState();
    _title = widget.task['title'];
    _description = widget.task['description'] ?? '';
  }

  Map<String, dynamic> _updateTask(Map<String, dynamic> updatedTask) {
    setState(() {
      _title = updatedTask['title'];
      _description = updatedTask['description'] ?? '';
    });
    SQLHelper.updateItem(
        updatedTask['id'], updatedTask['title'], updatedTask['description']);
    return updatedTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24.0, right: 24, top: 11, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset('assets/icons/cross.svg')),
                  SvgPicture.asset('assets/icons/repeatrepeat.svg'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final updatedTask =
                          await showDialog<Map<String, dynamic>>(
                        context: context,
                        builder: (context) => EditTaskDialog(
                          task: {
                            'title': _title,
                            'description': _description,
                            'id': widget.task['id'],
                          },
                        ),
                      );

                      if (updatedTask != null) {
                        _updateTask(updatedTask);
                      }
                    },
                    child: SvgPicture.asset('assets/icons/edit-2edit.svg'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _description,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/timertimer.svg'),
                      const SizedBox(width: 8),
                      Text(
                        'Task Time :',
                        style: getLato(FontWeight.w400, 16, whiteTextColour),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const EditDailyCalendar();
                          });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff444444)),
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
                    child: Text(
                      'Today At 16.45',
                      style: getLato(FontWeight.w400, 12, whiteTextColour),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 12, child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/tagcategoryTag.svg'),
                      const SizedBox(width: 8),
                      Text(
                        'Task Category :',
                        style: getLato(FontWeight.w400, 16, whiteTextColour),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const EditCategoryDialog();
                          });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff444444)),
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
                    child: Text(
                      'University',
                      style: getLato(FontWeight.w400, 12, whiteTextColour),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 12, child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/flagflag.svg'),
                      const SizedBox(width: 8),
                      Text(
                        'Task Priority :',
                        style: getLato(FontWeight.w400, 16, whiteTextColour),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const EditTaskPriorityDialog();
                          });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff444444)),
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
                    child: Text(
                      'Default',
                      style: getLato(FontWeight.w400, 12, whiteTextColour),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 12, child: SizedBox()),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DeleteTaskDialog(
                        taskTitle: _title,
                        onDeleteTask: () {
                          widget.deleteTask(widget.task['id']);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/trashdelete.svg',
                      color: const Color(0xffFF4949),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Delete Task',
                      style:
                          getLato(FontWeight.w400, 16, const Color(0xffFF4949)),
                    ),
                  ],
                ),
              ),
              const Expanded(flex: 222, child: SizedBox()),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    final updatedTask = _updateTask({
                      'title': _title,
                      'description': _description,
                      'id': widget.task['id'],
                    });
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
                  child: Text('Edit Task',
                      style: getLato(FontWeight.w400, 16, whiteTextColour)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
