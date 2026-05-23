import 'package:flutter/material.dart';
import 'package:task_management_app/core/services/storage_service.dart';
import 'package:task_management_app/task_management/data/models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel>_tasks=[];
 bool _isLoading=true;
 final TextEditingController _inputController=TextEditingController();
 @override
  void initState() {
    super.initState();
    _fetchTasks();
    _isLoading=false;
  }
 
Future<void> _fetchTasks()async{
 final savedTasks = await StorageService().loadTasks();
setState(() {
  _tasks=savedTasks;
  _isLoading=false;
});
}

Future<void> _addTasks(String title)async{
  final newTask = TaskModel(
    id:DateTime.now().toIso8601String(),
    title:title 
     );
     setState(() {
       _tasks.add(newTask);
       _inputController.clear();
     });
   await StorageService().saveTasks(_tasks);
}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}