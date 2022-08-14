import 'package:flutter/material.dart';
import 'package:todo_plus/models/task.dart';
import 'package:todo_plus/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final double screenHeight;
  final List<Task> tasks;
  TasksList({
    required this.screenHeight,
    required this.tasks,
  });
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          vertical: widget.screenHeight * 0.08,
          horizontal: widget.screenHeight * 0.07),
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskName: widget.tasks[index].taskName,
          checked: widget.tasks[index].isDone,
          toggleChecked: (value) {
            setState(() {
              widget.tasks[index].isDone = value;
            });
          },
        );
      },
    );
  }
}
