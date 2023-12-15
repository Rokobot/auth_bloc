import 'package:flutter/material.dart';

TextFieldBorder({required String hintText}) {
  return InputDecoration(
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue)));
}
