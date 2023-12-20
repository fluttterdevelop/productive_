import 'dart:math';
import 'dart:ui';



import 'package:productive/mock_data.dart';
import 'package:productive/models/task.dart';

import '../models/priority.dart';

class TaskRepository {
  Future<List<TaskModel>> getTasks() async {
    await Future.delayed(const Duration(seconds: 2));

    return (data['tasks'] as List)
        .map(
          (task) => TaskModel(
            id: task['id'],
            icon: task['icon'],
            title: task['title'],
            priority: task['priority'],
            note: task['note'],
            startDate: task['start_date'],
            dueDate: task['due_date'],
            isChecked: task['is_checked'],
            iconColor: task['icon_color'],
          ),
        )
        .toList();
  }

  Future<TaskModel> createTask({
    required String icon,
    required String title,
    required DateTime startDate,
    required DateTime dueDate,
    required String? note,
    required Priority priority,
  }) async {
    final random = Random();

    Future.delayed(const Duration(seconds: 3));

    if (title.isEmpty || title.length < 3) {
      throw Exception('Title is invalid');
    }

    final newTask = TaskModel(
      id: (data['tasks'] as List).lastOrNull['id'] + 1 ?? 0,
      icon: icon,
      title: title,
      priority: priority,
      note: note,
      startDate: startDate,
      dueDate: dueDate,
      isChecked: false,
      iconColor: Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      ),
    );

    data['tasks'].add(
      {
        "id": newTask.id,
        "title": newTask.title,
        "icon": newTask.icon,
        "priority": newTask.priority,
        "note": newTask.note,
        "start_date": newTask.startDate,
        "due_date": newTask.dueDate,
        "is_checked": newTask.isChecked,
        "icon_color": newTask.iconColor
      },
    );
    return newTask;
  }
}