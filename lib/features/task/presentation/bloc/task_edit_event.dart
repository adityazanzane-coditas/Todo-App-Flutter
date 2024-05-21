import 'package:equatable/equatable.dart';
import 'package:todo_app/features/task/presentation/entity/task_entity.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask(this.task);

  @override
  List<Object> get props => [task];
}