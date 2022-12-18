import 'dart:collection';

import 'package:flutter/material.dart';

import 'models/task.dart';

class Data extends ChangeNotifier {
  List<Task> _tasksList = [
    Task(taskName: 'Go to bed', isDone: true),
  ];

  Data(this._tasksList);

  //constructor that converts json to object instance
  Data.fromMap(Map<String, dynamic> map) {
    _tasksList = map['tasksList'];
  }

  //method that converts object to json string
  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> tasksList =
        _tasksList.map((e) => e.toMap()).toList();
    return {'tasksList': tasksList};
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasksList);
  }

  int get taskCount {
    return _tasksList.length;
  }

  void addTask(newTaskName) async {
    _tasksList.add(Task(taskName: newTaskName));
    notifyListeners();
  }

  void toggleChecked(value, index) {
    _tasksList[index].isDone = value;
    notifyListeners();
  }

  void deleteTask(index) {
    _tasksList.removeAt(index);
    notifyListeners();
  }
}
