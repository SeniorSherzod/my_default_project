import 'package:my_default_project/models/task_model/task_status.dart';

class TaskModel {
  final int? id;
  final String title;
  final String description;
  final String category;
  final String deadline;
  final int priority;
  final TaskStatus status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.deadline,
    required this.priority,
    required this.status
  });

  TaskModel copyWith(  {
    int? id,
    String? title,
    String? description,
    String? category,
    String? deadline,
    int? priority,
    TaskStatus? status,
  }){return TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        deadline: deadline ?? this.deadline,
        priority: priority ?? this.priority,
        status: status ?? this.status);
  }

}