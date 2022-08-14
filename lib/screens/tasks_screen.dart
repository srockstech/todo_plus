import 'package:flutter/material.dart';
import 'package:todo_plus/components/add_task_bottom_sheet.dart';
import 'package:todo_plus/models/task.dart';
import 'package:todo_plus/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(taskName: 'Buy Milk'),
    Task(taskName: 'Buy Eggs'),
    Task(taskName: 'Buy Bread'),
  ];
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskBottomSheet((newTaskName) {
              setState(() {
                tasks.add(Task(taskName: newTaskName));
              });
            }),
            backgroundColor: Color(0xFF757575),
          );
        },
        backgroundColor: Colors.lime[600],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.lime[600],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenHeight * 0.08,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        color: Colors.lime[600],
                        size: screenHeight * 0.08,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      'Todo+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${tasks.length} Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenHeight * 0.05),
                    topRight: Radius.circular(screenHeight * 0.05),
                  ),
                ),
                child: TasksList(screenHeight: screenHeight, tasks: tasks),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
