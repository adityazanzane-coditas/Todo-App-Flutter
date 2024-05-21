import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/presentation/bloc/task_event.dart';
import 'package:todo_app/features/home/presentation/bloc/task_state.dart';

class DialogsBloc extends Bloc<DialogsEvent, DialogsState> {
  DialogsBloc() : super(DialogsInitial()) {
    on<ShowTaskModalDialogEvent>((event, emit) {
      emit(ShowTaskModalDialogState());
    });
    on<ShowDailyCalendarDialogEvent>((event, emit) {
      emit(ShowDailyCalendarDialogState());
    });
    on<ShowCategoryDialogEvent>((event, emit) {
      emit(ShowCategoryDialogState());
    });
    on<ShowTaskPriorityDialogEvent>((event, emit) {
      emit(ShowTaskPriorityDialogState());
    });
    on<CancelDialogEvent>((event, emit) {
      emit(DialogsCancelledState());
    });
  }
}

class TaskDetailsBloc extends Bloc<TaskDetailsEvent, TaskDetailsState> {
  TaskDetailsBloc(TaskDetailsState initialState) : super(initialState) {
    on<TitleChanged>(_onTitleChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
  }

  void _onTitleChanged(TitleChanged event, Emitter<TaskDetailsState> emit) {
    emit(TaskDetailsState(title: event.title, description: state.description));
  }

  void _onDescriptionChanged(
      DescriptionChanged event, Emitter<TaskDetailsState> emit) {
    emit(TaskDetailsState(title: state.title, description: event.description));
  }
}