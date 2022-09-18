import 'package:flutter/material.dart';

class Design {
  InputDecoration textInputDecoration(double screenHeight) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.05, vertical: screenHeight * 0.045),
      labelText: 'Add a task',
      labelStyle: TextStyle(
        color: Colors.yellow[100],
        fontWeight: FontWeight.w300,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.yellow.shade100,
          width: screenHeight * 0.002,
        ),
        borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.02)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.yellow.shade100,
          width: screenHeight * 0.003,
        ),
        borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.02)),
      ),
    );
  }
}
