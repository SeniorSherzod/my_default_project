import 'package:my_default_project/models/task_model/task_model_constant.dart';
import 'package:my_default_project/models/task_model/task_status.dart';
import 'package:my_default_project/models/category_model/category_model.dart'; // Import CategoryModel
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:flutter/material.dart';

import '../../screens/task_details/dialog/models_category/category_list.dart'; // Import Material for Color

class TaskModel {
  final int? id;
  final String title;
  final String description;
  final CategoryModel category; // Change type to CategoryModel
  final DateTime deadline;
  final int priority;
  final TaskStatus status;

  TaskModel({
    this.id,
    required this.description,
    required this.title,
    required this.status,
    required this.category,
    required this.deadline,
    required this.priority,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    CategoryModel? category, // Change type to CategoryModel
    DateTime? deadline,
    int? priority,
    TaskStatus? status,
  }) {
    return TaskModel(
      description: description ?? this.description,
      title: title ?? this.title,
      status: status ?? this.status,
      category: category ?? this.category,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      description: json[TaskModelConstants.description] as String? ?? "",
      title: json[TaskModelConstants.title] as String? ?? "",
      status: getStatus(json[TaskModelConstants.status] as String? ?? ""),
      category: getCategory(json[TaskModelConstants.category] as String? ?? ""), // Change to getCategory method
      deadline: DateTime.parse(json[TaskModelConstants.deadline] as String? ?? ""),
      priority: json[TaskModelConstants.priority] as int? ?? 1,
      id: json[TaskModelConstants.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TaskModelConstants.description: description,
      TaskModelConstants.title: title,
      TaskModelConstants.status: status.name,
      TaskModelConstants.category: category.name, // Change to category.name
      TaskModelConstants.deadline: deadline.toString(),
      TaskModelConstants.priority: priority,
    };
  }

  bool canAddTaskToDatabase() {
    if (title.isEmpty) return false;
    if (description.isEmpty) return false;
    if (category.name.isEmpty) return false; // Access name property of category
    if (priority == 0) return false;
    return true;
  }

  static TaskModel initialValue = TaskModel(
    description: "",
    title: "",
    status: TaskStatus.processing,
    category: categoryModels[0], // Initialize with a default category
    deadline: DateTime.now(),
    priority: 1,
  );
}

CategoryModel getCategory(String categoryName) {
  return categoryModels.firstWhere((category) => category.name == categoryName);
}

TaskStatus getStatus(String statusText) {
  switch (statusText) {
    case "processing":
      {
        return TaskStatus.processing;
      }
    case "done":
      {
        return TaskStatus.done;
      }
    case "canceled":
      {
        return TaskStatus.cancelled;
      }
    default:
      {
        return TaskStatus.missed;
      }
  }
}