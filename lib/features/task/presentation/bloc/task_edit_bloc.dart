import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/task/presentation/bloc/task_edit_event.dart';
import 'package:todo_app/features/task/presentation/bloc/task_edit_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<UpdateTask>(_onUpdateTask);
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final updatedTasks = [...state.tasks];
    final index = updatedTasks.indexWhere((task) => task.id == event.task.id);

    if (index != -1) {
      updatedTasks[index] = event.task;
    } else {
      updatedTasks.add(event.task);
    }

    emit(TaskState(tasks: updatedTasks));
  }
}