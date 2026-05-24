import 'package:flutter/material.dart';
import 'package:task_management_app/task_management/data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  const TaskItem({super.key,
   required this.task
  ,required this.onToggle
  ,required this.onDelete});

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
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}