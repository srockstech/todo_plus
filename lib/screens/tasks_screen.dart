import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: screenHeight * 0.08,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        color: Colors.lightBlue,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
