import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_plus/data.dart';
import 'package:todo_plus/screens/tasks_screen.dart';

import 'models/task.dart';
import 'user_preferences.dart';

Future main() async {
  //This line is required for calling init function of UserPreferences
  WidgetsFlutterBinding.ensureInitialized();

  //initializing SharedPreferences instance
  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Task> tasksList = [];

  Data? data;

  @override
  void initState() {
    super.initState();
  }

  void storeData() {
    data = Data(tasksList);
    String userData = jsonEncode(data);
    print(userData);
    UserPreferences.setData(userData);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => data,
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Colors.white,
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        ),
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
