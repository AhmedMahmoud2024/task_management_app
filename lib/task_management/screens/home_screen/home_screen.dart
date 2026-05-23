import 'package:flutter/material.dart';
import 'package:task_management_app/core/services/storage_service.dart';
import 'package:task_management_app/task_management/data/models/task_model.dart';
import 'package:task_management_app/task_management/screens/home_screen/widgets/task_item.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: _isLoading ? const Center(
        child: Center(child: CircularProgressIndicator(),),
      ):_tasks.isEmpty ? const Center(
        child: Text('No tasks available.'),
      )
      :ListView.builder(
        itemCount: _tasks.length,
        itemBuilder:(context,index){
       return TaskItem(
       key: ValueKey(_tasks[index].id),
        task: _tasks[index],
        );         
        } 
        ),
        bottomNavigationBar:Padding(padding: 
         EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom+16,
         left: 16,
         right: 16,
                ),
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      controller: _inputController,
                      decoration: const InputDecoration(
                        hintText: 'Add Your tasks',
                        border: OutlineInputBorder()
                      ),
                    )
                    ),
                    const SizedBox(width: 12,),
                 ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16)
                  ),
                  onPressed: ()=>_addTasks(_inputController.text),
                  child: Icon(Icons.add)
                  )
                  ],
                ),
        ) ,
    );
  }
}