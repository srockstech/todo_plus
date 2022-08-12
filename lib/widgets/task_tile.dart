import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? checked = false;
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
          'This is a task. This is a task. This is a task. This is a task.',
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
        leading: TaskCheckbox(
          checked: checked,
          onChanged: (newValue) {
            setState(() {
              checked = newValue;
            });
          },
        ),
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  TaskCheckbox({this.checked, required this.onChanged});

  final bool? checked;
  final Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked,
      fillColor: MaterialStateProperty.all(Colors.white),
      checkColor: Colors.lime[600],
      onChanged: onChanged,
    );
  }
}
