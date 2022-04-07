import 'package:flutter/material.dart';
import 'package:school360/view/mainframe/homeScreen.dart';

List<Widget> mainframePages = [
  HomeScreen(),
  Container(
    child: Center(
      child: Text("Assignment"),
    ),
  ),
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
