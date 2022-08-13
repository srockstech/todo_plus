import 'package:flutter/material.dart';
import 'package:todo_plus/models/task.dart';
import 'package:todo_plus/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  TasksList({
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(taskName: 'Buy Milk'),
    Task(taskName: 'Buy Eggs'),
    Task(taskName: 'Buy Bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          vertical: widget.screenHeight * 0.08,
          horizontal: widget.screenHeight * 0.07),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
            taskName: tasks[index].taskName, checked: tasks[index].isDone);
      },
    );
  }
}
