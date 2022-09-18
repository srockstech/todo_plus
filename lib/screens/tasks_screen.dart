import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_plus/components/add_task_bottom_sheet.dart';
import 'package:todo_plus/data.dart';
import 'package:todo_plus/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskBottomSheet(),
            backgroundColor: Color(0xFF4E0928),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.yellow[200],
        ),
      ),
      backgroundColor: Colors.black,
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
                      backgroundColor: Colors.pink[800],
                      child: Icon(
                        Icons.list,
                        color: Colors.yellow[100],
                        size: screenHeight * 0.08,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      'Todo+',
                      style: TextStyle(
                        color: Colors.yellow[100],
                        fontSize: screenHeight * 0.11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${Provider.of<Data>(context).taskCount} Tasks',
                      style: TextStyle(
                        color: Colors.yellow[100],
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
                  color: Colors.pink[800],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenHeight * 0.05),
                    topRight: Radius.circular(screenHeight * 0.05),
                  ),
                ),
                child: (Provider.of<Data>(context).taskCount != 0)
                    ? TasksList(screenHeight: screenHeight)
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey,
                            height: screenHeight * 0.15,
                          );
                        },
                        itemCount: 9,
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.08,
                            horizontal: screenHeight * 0.07),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
