import 'package:flutter/material.dart';

import 'models/task.dart';

class Data extends ChangeNotifier {
  List<Task> tasks = [
    Task(taskName: 'Buy Milk'),
    Task(taskName: 'Buy Eggs'),
    Task(taskName: 'Buy Bread'),
  ];

  void addTask(newTaskName) {
    tasks.add(Task(taskName: newTaskName));
    notifyListeners();
  }

  int get taskCount {
    return tasks.length;
  }

  void toggleChecked(value, index) {
    tasks[index].isDone = value;
    notifyListeners();
  }
}
