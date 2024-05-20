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