import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
   const TaskItem({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}