import 'dart:ui';

import 'priority.dart';

class TaskModel {
  final int id;
  final String icon;
  final String title;
  final Priority priority;
  final String? note;
  final DateTime startDate;
  final DateTime dueDate;
  final bool isChecked;
  final Color iconColor;
  const TaskModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.priority,
    required this.note,
    required this.startDate,
    required this.dueDate,
    required this.isChecked,
    required this.iconColor,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.id == id &&
        other.icon == icon &&
        other.title == title &&
        other.priority == priority &&
        other.note == note &&
        other.startDate == startDate &&
        other.dueDate == dueDate &&
        other.isChecked == isChecked &&
        other.iconColor == iconColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        icon.hashCode ^
        title.hashCode ^
        priority.hashCode ^
        note.hashCode ^
        startDate.hashCode ^
        dueDate.hashCode ^
        isChecked.hashCode ^
        iconColor.hashCode;
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, icon: $icon, title: $title, priority: $priority, note: $note, startDate: $startDate, dueDate: $dueDate, isChecked: $isChecked, iconColor: $iconColor)';
  }

  TaskModel copyWith({
    int? id,
    String? icon,
    String? title,
    Priority? priority,
    String? note,
    DateTime? startDate,
    DateTime? dueDate,
    bool? isChecked,
    Color? iconColor,
  }) {
    return TaskModel(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      isChecked: isChecked ?? this.isChecked,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}