import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/models/loading.status.dart';
import 'package:productive/models/priority.dart';
import 'package:productive/models/task.dart';
import 'package:productive/repository/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _repository;
  TaskBloc({
    required TaskRepository repository,
  })  : _repository = repository,
        super(
          TaskState(
            status: LoadingStatus.pure,
            upcomingTasks: [],
            allTasks: [],
            taskCreationStatus: LoadingStatus.pure,
            isSearching: false,
            searchedTasks: [],
          ),
        ) {
    on<LoadTasks>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        final taskList = await _repository.getTasks();
        emit(
          state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            allTasks: taskList,
            upcomingTasks:
                taskList.where((element) => !element.isChecked).toList(),
          ),
        );
      } catch (e) {
        addError(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });

    on<ToggleTaskCheckedValue>((event, emit) {
      var newList = <TaskModel>[];

      for (var i = 0; i < state.allTasks.length; i++) {
        if (state.allTasks[i].id == event.id) {
          newList.add(state.allTasks[i]
              .copyWith(isChecked: !state.allTasks[i].isChecked));
        } else {
          newList.add(state.allTasks[i]);
        }
      }

      emit(state.copyWith(
        allTasks: newList,
        upcomingTasks: newList.where((element) => !element.isChecked).toList(),
      ));
    });

    on<CreateTaskButtonPressed>((event, emit) async {
      emit(state.copyWith(taskCreationStatus: LoadingStatus.loading));
      try {
        if (event.note == null || event.note!.isEmpty) {
          throw Exception("Fotima tufayli note required bo'lib qoldi");
        }
        final newTask = await _repository.createTask(
          title: event.title,
          icon: event.icon,
          dueDate: event.dueDate,
          note: event.note,
          priority: event.priority,
          startDate: event.startDate,
        );
        final updatedList = [...state.allTasks, newTask];
        emit(
          state.copyWith(
            taskCreationStatus: LoadingStatus.loadedWithSuccess,
            allTasks: updatedList,
            upcomingTasks: updatedList
                .where(
                  (element) => !element.isChecked,
                )
                .toList(),
          ),
        );

        event.onSuccess();
      } catch (error) {
        emit(state.copyWith(
          taskCreationStatus: LoadingStatus.loadedWithFailure,
        ));
        event.onFailure("$error");
      }
    });

    on<SearchTask>((event, emit) {
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false));
      } else {
        final newList = state.allTasks
            .where((element) => element.title.contains(event.query))
            .toList();

        emit(state.copyWith(
          isSearching: true,
          searchedTasks: newList,
        ));
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}
