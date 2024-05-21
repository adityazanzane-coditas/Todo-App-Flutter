import 'package:equatable/equatable.dart';
import 'package:todo_app/features/task/presentation/entity/task_entity.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState({
    this.tasks = const <Task>[],
  });

  @override
  List<Object> get props => [tasks];
}