import 'package:flutter/material.dart';
import 'package:todo_plus/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.lime[600],
      ),
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
    );
  }
}
