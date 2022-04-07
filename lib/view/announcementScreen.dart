import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school360/functions/randomColor.dart';

import '../constants/colors.dart';
import '../constants/textStyle.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Announcements",
          style:
              headerTS.copyWith(fontSize: 16, color: scaffoldBackgroundColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: GridPaper(
                  color: secondaryColor.withOpacity(0.08),
                  divisions: 4,
                  interval: 800,
                  subdivisions: 8,
                ),
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 5, left: 15, right: 15, top: 5),
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.7),
                              border: Border.all(
                                color: secondaryColor.withOpacity(.2),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 84,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: getRandomColor(),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color:
                                                secondaryColor.withOpacity(.2),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          (index + 1).toString(),
                                          style: headerTS.copyWith(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 90,
                                        width: .2,
                                        color: secondaryColor.withOpacity(.5),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text(
                                            'Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.',
                                            style: defaultTS.copyWith(
                                              color: secondaryColor
                                                  .withOpacity(.8),
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          FontAwesomeIcons.cloudArrowDown,
                                          size: 16,
                                          color: getRandomColor(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
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
