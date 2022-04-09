import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';
import '../constants/textStyle.dart';
import '../functions/randomColor.dart';
import '../functions/randomLottieBookAnimation.dart';

class GetClassRevision extends StatelessWidget {
  final int index;
  GetClassRevision({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 4,
      ),
      child: Container(
        height: 200,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: secondaryColor.withOpacity(.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    'assets/classworkRevision_images/classworkRevision (${Random().nextInt(7)+1}).png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Temp - some important announcement",
                            style: defaultTS.copyWith(
                              color: secondaryColor.withOpacity(.9),
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.clock,
                                size: 15,
                                color: secondaryColor.withOpacity(.6),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '12/12/12',
                                style: defaultTS.copyWith(
                                  color: secondaryColor.withOpacity(.6),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Icon(
                        FontAwesomeIcons.bookBookmark,
                        color: getRandomColor(),
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
