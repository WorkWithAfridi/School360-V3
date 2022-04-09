import 'package:flutter/material.dart';
import 'package:school360/view/mainframe/attendanceScreen.dart';
import 'package:school360/view/mainframe/classworkScreen.dart';
import 'package:school360/view/mainframe/homeScreen.dart';

List<Widget> mainframePages = [
  HomeScreen(),
  ClassworkScreen(),
  Container(
    child: Center(
      child: Text("Result"),
    ),
  ),
  AttendanceScreen(),
  Container(
    child: Center(
      child: Text("Payment"),
    ),
  ),
];
