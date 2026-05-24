import 'package:flutter/material.dart';
import 'package:task_management_app/core/services/storage_service.dart';
import 'package:task_management_app/task_management/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState
  ();
}

class _SplashScreenState extends State<SplashScreen> {
  

@override
 void initState(){
  super.initState();
  _loadDataAndNavigateHome();
 }
 Future<void>_loadDataAndNavigateHome()async{
  final loadedTasks = await StorageService().loadTasks();
     await Future.delayed(const Duration(milliseconds: 600));
    if(mounted){
     Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen(initialTasks:loadedTasks))
     );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Colors.indigo,
      body:Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Icon(
              Icons.check_circle_outline,
              size:100,
            color:Colors.white            
            ),
            SizedBox(height: 24,),
            Text(
              'Task Management Flow',
              style:TextStyle(
                fontSize:24,
                fontWeight:FontWeight.bold,
                color:Colors.white
              ),
            ),
            SizedBox(height: 24,),
            CircularProgressIndicator(
               color:Colors.white
                   )
          ]
        )
      )
    );
  }
}

