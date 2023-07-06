import 'package:flutter/material.dart';

InputDecoration myInputDecoretion(label){
  return InputDecoration(
    labelText: label,
    contentPadding: EdgeInsets.all(10),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pinkAccent, width: 1),
    )
  );
}