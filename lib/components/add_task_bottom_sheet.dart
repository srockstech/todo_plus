import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final Function(String) addTaskCallback;
  AddTaskBottomSheet(this.addTaskCallback);

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
            color: Colors.white,
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
                    color: Colors.lime[600],
                    thickness: screenHeight * 0.008,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                TextField(
                  cursorColor: Colors.lime[600],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: screenHeight * 0.05,
                        vertical: screenHeight * 0.045),
                    labelText: 'Add a task',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: screenHeight * 0.004,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * 0.05)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFC0CA33),
                        width: screenHeight * 0.006,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * 0.05)),
                    ),
                  ),
                  onChanged: (value) {
                    newTaskName = value;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                TextButton(
                  onPressed: () {
                    addTaskCallback(newTaskName);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * 0.05),
                        ),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lime[600]),
                    overlayColor: MaterialStateProperty.all(Colors.lime),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenHeight * 0.05),
                    child: Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.04),
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
