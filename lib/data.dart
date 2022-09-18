import 'dart:collection';

import 'package:flutter/material.dart';

import 'models/task.dart';

class Data extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskName: 'Buy Milk'),
    Task(taskName: 'Buy Eggs'),
    Task(taskName: 'Buy Bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(newTaskName) {
    _tasks.add(Task(taskName: newTaskName));
    notifyListeners();
  }

  void toggleChecked(value, index) {
    _tasks[index].isDone = value;
    notifyListeners();
  }

  void deleteTask(index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
