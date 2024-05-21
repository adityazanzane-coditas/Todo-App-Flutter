import 'package:equatable/equatable.dart';

abstract class DialogsState {}

class DialogsInitial extends DialogsState {}
class ShowTaskModalDialogState extends DialogsState {}
class ShowDailyCalendarDialogState extends DialogsState {}
class ShowCategoryDialogState extends DialogsState {}
class ShowTaskPriorityDialogState extends DialogsState {}
class DialogsCancelledState extends DialogsState {}

class TaskDetailsState extends Equatable {
  final String title;
  final String description;

  const TaskDetailsState({required this.title, required this.description});

  @override
  List<Object> get props => [title, description];
}