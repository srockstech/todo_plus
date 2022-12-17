import 'dart:collection';

import 'package:flutter/material.dart';

import 'models/task.dart';

class Data extends ChangeNotifier {
  List<Task> _tasksList = [];

  Data(this._tasksList);

  //constructor that converts json to object instance
  Data.fromJSON(Map<String, dynamic> json) : _tasksList = json['tasks'];

  //method that converts object to json string
  Map<String, dynamic> toJson() => {'tasksList': _tasksList};

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
