import 'package:flutter/material.dart';
import 'package:task_management_app/task_management/data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
      ),
    );
  }
}