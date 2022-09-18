import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_plus/data.dart';

class TaskTile extends StatefulWidget {
  final bool? checked;
  final String taskName;
  final int index;

  TaskTile({
    required this.taskName,
    required this.checked,
    required this.index,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool showDelete = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
      // decoration: BoxDecoration(
      //   color: Colors.lime[600],
      //   borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.05)),
      // ),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(screenHeight * 0.02),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: () {},
        child: ListTile(
          title: Text(
            widget.taskName,
            style: TextStyle(
              color: Colors.yellow[100],
              fontWeight: FontWeight.w300,
              decoration:
                  (widget.checked == true) ? TextDecoration.lineThrough : null,
            ),
          ),
          horizontalTitleGap: screenHeight * 0,
          contentPadding: EdgeInsets.only(
              left: screenHeight * 0.01, right: screenHeight * 0.03),
          minLeadingWidth: screenHeight * 0.01,
          minVerticalPadding: screenHeight * 0.052,
          leading: Checkbox(
            side: BorderSide(color: Colors.yellow.shade100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenHeight * 0.01),
            ),
            value: widget.checked,
            fillColor: MaterialStateProperty.all(Colors.yellow[100]),
            checkColor: Colors.pink[800],
            onChanged: (value) {
              Provider.of<Data>(context, listen: false)
                  .toggleChecked(value, widget.index);
            },
          ),
          trailing: (showDelete == false)
              ? null
              : IconButton(
                  icon: Icon(Icons.delete_rounded, color: Colors.deepOrange),
                  onPressed: () {
                    Provider.of<Data>(context, listen: false)
                        .deleteTask(widget.index);
                    showDelete = false;
                  },
                ),
          onTap: () {
            setState(() {
              showDelete = false;
            });
          },
          onLongPress: () {
            setState(() {
              showDelete = true;
            });
          },
        ),
      ),
    );
  }
}
