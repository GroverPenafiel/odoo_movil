import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(0),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.black87),
        labelStyle: TextStyle(color: Colors.black87),
        hintStyle: TextStyle(color: Colors.black87),
        filled: true,
        fillColor: Colors.grey[350],
        floatingLabelBehavior: FloatingLabelBehavior.never);
  }

  static InputDecoration searchInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }
}
