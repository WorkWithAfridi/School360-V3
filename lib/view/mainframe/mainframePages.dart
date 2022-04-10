import 'package:flutter/material.dart';
import 'package:school360/view/mainframe/attendanceScreen.dart';
import 'package:school360/view/mainframe/classworkScreen.dart';
import 'package:school360/view/mainframe/homeScreen.dart';
import 'package:school360/view/mainframe/paymentScreen.dart';
import 'package:school360/view/mainframe/resultScreen.dart';

List<Widget> mainframePages = [
  HomeScreen(),
  ClassworkScreen(),
  ResultScreen(),
  AttendanceScreen(),
  PaymentScreen(),
];
