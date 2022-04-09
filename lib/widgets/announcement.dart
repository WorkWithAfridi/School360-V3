import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';
import '../constants/textStyle.dart';
import '../functions/randomColor.dart';

class GetAnnouncement extends StatelessWidget {
  final int index;
  GetAnnouncement({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 200,
        width: Get.width * .6,
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
              flex: 4,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/announcement_images/announcement${index+1}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
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
                              color: secondaryColor
                                  .withOpacity(.9),
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
                                color: secondaryColor
                                    .withOpacity(.6),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '12/12/12',
                                style: defaultTS.copyWith(
                                  color: secondaryColor
                                      .withOpacity(.6),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Icon(
                        FontAwesomeIcons.cloudArrowDown,
                        color: getRandomColor(),
                        size: 16,
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
