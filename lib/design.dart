import 'package:flutter/material.dart';

class Design {
  InputDecoration textInputDecoration(double screenHeight) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.05, vertical: screenHeight * 0.045),
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
        borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.05)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFC0CA33),
          width: screenHeight * 0.006,
        ),
        borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.05)),
      ),
    );
  }
}
