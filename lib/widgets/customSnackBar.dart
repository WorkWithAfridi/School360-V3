import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school360/constants/dimentions.dart';

import '../constants/colors.dart';
import '../constants/textStyle.dart';

showSnackbar({required String title, required String message}) {
  Get.snackbar(
    "temp",
    "temp",
    titleText: Text(
      title,
      style: headerTS.copyWith(fontSize: 15),
    ),
    messageText: Text(
      message,
      style: defaultTS,
    ),
    snackPosition: SnackPosition.TOP,
    borderWidth: .5,
    borderColor: secondaryColor,
    margin: EdgeInsets.all(15),
    duration: Duration(seconds: 3),
    borderRadius: 5
  );
}
