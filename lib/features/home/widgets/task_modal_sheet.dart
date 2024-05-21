import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/database/sql_helper.dart';
import 'package:todo_app/core/navigations/routes/app_router.gr.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';
import 'package:todo_app/features/category/presentation/widgets/choose_category.dart';
import 'package:todo_app/features/home/presentation/bloc/task_bloc.dart';
import 'package:todo_app/features/home/presentation/bloc/task_event.dart';
import 'package:todo_app/features/home/presentation/bloc/task_state.dart';
import 'package:todo_app/features/home/widgets/calendar_widget.dart';
import 'package:todo_app/features/home/widgets/task_priority_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskModalSheet extends StatefulWidget {
  final Function refreshTasks;

  const TaskModalSheet({super.key, required this.refreshTasks});

  @override
  State<TaskModalSheet> createState() => _TaskModalSheetState();
}

class _TaskModalSheetState extends State<TaskModalSheet> {
  final _taskController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dialogsBloc = DialogsBloc();

  @override
  void dispose() {
    _dialogsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DialogsBloc>(
      create: (_) => _dialogsBloc,
      child: BlocListener<DialogsBloc, DialogsState>(
        listener: (context, state) {
          if (state is ShowDailyCalendarDialogState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const DailyCalendar();
              },
            );
          } else if (state is ShowCategoryDialogState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ChooseCategoryDialog();
              },
            );
          } else if (state is ShowTaskPriorityDialogState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const TaskPriorityDialog();
              },
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff363636),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 25, child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 26.0),
                child: Text('Add Task',
                    style: getLato(FontWeight.w700, 20, whiteTextColour)),
              ),
              const Expanded(flex: 14, child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
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
              ),
              const Expanded(flex: 2, child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
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
              ),
              const Expanded(flex: 4, child: SizedBox()),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _dialogsBloc.add(ShowDailyCalendarDialogEvent());
                      },
                      child: SvgPicture.asset('assets/icons/timertimer.svg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        _dialogsBloc.add(ShowCategoryDialogEvent());
                      },
                      child:
                          SvgPicture.asset('assets/icons/tagcategoryTag.svg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        _dialogsBloc.add(ShowTaskPriorityDialogEvent());
                      },
                      child: SvgPicture.asset('assets/icons/flagflag.svg'),
                    ),
                    const SizedBox(width: 122),
                    GestureDetector(
                      onTap: () async {
                        await SQLHelper.createItem(
                          _taskController.text,
                          _descriptionController.text,
                        );
                        widget.refreshTasks();
                        AutoRouter.of(context).push(const HomeRoute());
                      },
                      child: SvgPicture.asset('assets/icons/sendsend.svg'),
                    ),
                  ],
                ),
              ),
              const Expanded(flex: 207, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
