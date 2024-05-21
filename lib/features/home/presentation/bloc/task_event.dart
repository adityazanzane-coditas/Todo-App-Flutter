import 'package:equatable/equatable.dart';

abstract class DialogsEvent {}

class ShowTaskModalDialogEvent extends DialogsEvent {}

class ShowDailyCalendarDialogEvent extends DialogsEvent {}

class ShowCategoryDialogEvent extends DialogsEvent {}

class ShowTaskPriorityDialogEvent extends DialogsEvent {}

class CancelDialogEvent extends DialogsEvent {}


abstract class TaskDetailsEvent extends Equatable {
  const TaskDetailsEvent();
}

class TitleChanged extends TaskDetailsEvent {
  final String title;

  const TitleChanged(this.title);

  @override
  List<Object> get props => [title];
}
class DescriptionChanged extends TaskDetailsEvent {
  final String description;

  const DescriptionChanged(this.description);

  @override
  List<Object> get props => [description];
}
