import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_plus/data.dart';
import 'package:todo_plus/design.dart';

class AddTaskBottomSheet extends StatelessWidget {
  AddTaskBottomSheet();

  @override
  Widget build(BuildContext context) {
    String newTaskName = '';
    final screenHeight = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: screenHeight * 0.55,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenHeight * 0.05),
              topRight: Radius.circular(screenHeight * 0.05),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.07),
            child: Column(
              children: [
                SizedBox(
                  width: screenHeight * 0.07,
                  height: screenHeight * 0.1,
                  child: Divider(
                    color: Colors.pink[800],
                    thickness: screenHeight * 0.008,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.yellow[100],
                  ),
                  cursorColor: Colors.pink[800],
                  decoration: Design().textInputDecoration(screenHeight),
                  onChanged: (value) {
                    newTaskName = value;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<Data>(context, listen: false)
                        .addTask(newTaskName);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * 5),
                        ),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pink[800]),
                    overlayColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.025),
                    child: Icon(
                      Icons.done,
                      size: screenHeight * 0.07,
                      color: Colors.yellow[100],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
