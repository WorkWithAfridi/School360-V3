import 'package:flutter/material.dart';
import 'package:school360/view/mainframe/classworkScreen.dart';
import 'package:school360/view/mainframe/homeScreen.dart';

List<Widget> mainframePages = [
  HomeScreen(),
  classworkScreen(),
  Container(
    child: Center(
      child: Text("Result"),
    ),
  ),
  Container(
    child: Center(
      child: Text("Attendance"),
    ),
  ),
  Container(
    child: Center(
      child: Text("Payment"),
    ),
  ),
];
