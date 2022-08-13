import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool checked;
  final String taskName;
  TaskTile({required this.taskName, required this.checked});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
      decoration: BoxDecoration(
        color: Colors.lime[600],
        borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.05)),
      ),
      child: ListTile(
        title: Text(
          taskName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            decoration: (checked == true) ? TextDecoration.lineThrough : null,
          ),
        ),
        horizontalTitleGap: screenHeight * 0,
        contentPadding: EdgeInsets.only(
            left: screenHeight * 0.01, right: screenHeight * 0.03),
        minLeadingWidth: screenHeight * 0.01,
        minVerticalPadding: screenHeight * 0.03,
        leading: Checkbox(
          value: checked,
          fillColor: MaterialStateProperty.all(Colors.white),
          checkColor: Colors.lime[600],
          onChanged: (value) {},
        ),
      ),
    );
  }
}

// onChanged: (newValue) {
// setState(() {
// checked = newValue;
// });
// },
