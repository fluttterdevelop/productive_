
part of 'tasks_bloc.dart';

sealed class TaskEvent {
  const TaskEvent();
}

class LoadTasks extends TaskEvent {}

class ToggleTaskCheckedValue extends TaskEvent {
  final int id;

  ToggleTaskCheckedValue({required this.id});
}

class CreateTaskButtonPressed extends TaskEvent {
  final String icon;
  final String title;
  final DateTime startDate;
  final DateTime dueDate;
  final String? note;
  final Priority priority;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  CreateTaskButtonPressed({
    required this.icon,
    required this.title,
    required this.startDate,
    required this.dueDate,
    required this.note,
    required this.priority,
    required this.onSuccess,
    required this.onFailure,
  });
}

class SearchTask extends TaskEvent {
  final String query;

  SearchTask({required this.query});
}