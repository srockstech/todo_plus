import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_plus/data.dart';
import 'package:todo_plus/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final double screenHeight;
  TasksList({
    required this.screenHeight,
  });
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    Consumer consumer = Consumer<Data>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(
              vertical: widget.screenHeight * 0.08,
              horizontal: widget.screenHeight * 0.07),
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return TaskTile(
              taskName: taskData.tasks[index].taskName,
              checked: taskData.tasks[index].isDone,
              index: index,
            );
          },
        );
      },
    );
    return consumer;
  }
}
