import 'package:flutter/material.dart';
import 'package:todo_plus/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                padding: EdgeInsets.all(screenHeight * 0.1),
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
                      '12 Tasks',
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
                child: TasksList(screenHeight: screenHeight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
