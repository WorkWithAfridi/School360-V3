import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/functions/randomColor.dart';

import '../constants/colors.dart';
import '../constants/dimentions.dart';
import '../constants/textStyle.dart';

class GetClassPerformance extends StatelessWidget {
  final int index;
  GetClassPerformance({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.7),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: secondaryColor.withOpacity(.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: getGlobalPadding(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/classPerformance_images/classPerformance (${index + 1}).png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: getGlobalPadding(),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      index == 0
                          ? 'Total Classes'
                          : index == 1
                              ? "Total Presents"
                              : index == 2
                                  ? "Total Absents"
                                  : index == 3
                                      ? "On Leave"
                                      : index == 4
                                          ? "Holidays"
                                          : "Loading",
                      style: defaultTS),
                  Text(
                    Random().nextInt(30).toString(),
                    style: headerTS.copyWith(
                        fontSize: 30, color: getRandomColor()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
