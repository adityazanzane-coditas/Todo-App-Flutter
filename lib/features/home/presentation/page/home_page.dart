import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/theme/colors.dart';
import 'package:todo_app/core/theme/fonts.dart';
import 'package:todo_app/features/home/presentation/bloc/task_bloc.dart';
import 'package:todo_app/features/home/presentation/bloc/task_event.dart';
import 'package:todo_app/features/home/presentation/bloc/task_state.dart';
import 'package:todo_app/features/home/widgets/bottom_nav_bar.dart';
import 'package:todo_app/features/home/widgets/task_modal_sheet.dart';
import 'package:todo_app/core/database/sql_helper.dart';
import 'package:todo_app/features/task/presentation/pages/task_details_page.dart';
import 'package:todo_app/features/task/presentation/widgets/edit_task_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _tasks = [];
  bool _isLoading = false;
  final _dialogsBloc = DialogsBloc();

  void _refreshTasks() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _tasks = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshTasks();
  }

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
          if (state is ShowTaskModalDialogState) {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return TaskModalSheet(refreshTasks: _refreshTasks);
              },
            );
          }
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: backgroundColor,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icons/sorthomeIcon.svg'),
                      Text(
                        'Index',
                        style: getLato(FontWeight.w400, 20, whiteTextColour),
                      ),
                      Image.asset('assets/images/profileIcon.png'),
                    ],
                  ),
                ),
              ),
              body: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _tasks.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/Checklist-rafiki 1emptyPage.svg',
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 53.0, right: 52),
                                child: Text(
                                  'What do you want to do today?',
                                  style: getLato(
                                      FontWeight.w400, 20, whiteTextColour),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 108.0, right: 108),
                                child: Text(
                                  'Tap + to add your tasks',
                                  style: getLato(
                                      FontWeight.w400, 16, whiteTextColour),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _tasks.length,
                          itemBuilder: (context, index) => Dismissible(
                            key: Key(_tasks[index]['id'].toString()),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Icon(Icons.delete, color: Colors.white),
                                ),
                              ),
                            ),
                            onDismissed: (direction) async {
                              await SQLHelper.deleteItem(_tasks[index]['id']);
                              setState(() {
                                _tasks.removeAt(index);
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TaskDetailsPage(task: _tasks[index]),
                                  ),
                                ).then((value) async {
                                  final updatedTask =
                                      await showDialog<Map<String, dynamic>>(
                                    context: context,
                                    builder: (context) =>
                                        EditTaskDialog(task: _tasks[index]),
                                  );

                                  if (updatedTask != null) {
                                    setState(() {
                                      _tasks[index] = updatedTask;
                                    });
                                  }
                                });
                              },
                              child: Card(
                                color: const Color(0xff363636),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: ListTile(
                                  title: Text(
                                    _tasks[index]['title'],
                                    style: getLato(
                                        FontWeight.w700, 18, whiteTextColour),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _tasks[index]['description'] ?? '',
                                        style: getLato(FontWeight.w400, 16,
                                            const Color(0xffAFAFAF)),
                                      ),
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 42),
                                ),
                              ),
                            ),
                          ),
                        ),
              bottomNavigationBar: CustomNavigationBar(),
            ),
            Positioned(
              bottom: 51,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  _dialogsBloc.add(ShowTaskModalDialogEvent());
                },
                child: Container(
                  width: 66.0,
                  height: 66.0,
                  decoration: const BoxDecoration(
                    color: Color(0xff8687E7),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/addhpAdd.svg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}