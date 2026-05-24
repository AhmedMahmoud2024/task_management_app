import 'package:flutter/material.dart';
import 'package:task_management_app/task_management/data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onToggle;
  const TaskItem({super.key, required this.task,required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value:task.isCompleted,
          onChanged:(_)=>onToggle()
        ),
        title: Text(
           task.title,
         style:TextStyle(
          decoration: task.isCompleted?TextDecoration.lineThrough
          :null
         )
        ),
      ),
    );
  }
}