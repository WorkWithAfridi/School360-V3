import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/widgets/announcement.dart';
import 'package:school360/widgets/classPerformance.dart';
import 'package:school360/widgets/pastpayment.dart';

import '../../constants/colors.dart';
import '../../constants/dimentions.dart';
import '../../constants/textStyle.dart';
import '../../functions/randomColor.dart';
import '../../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = "All Topic";

  Container getAppBar() {
    return Container(
      height: 50,
      padding: getGlobalPadding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SCHOOL",
                style: headerTS,
              ),
              Text(
                "360",
                style: parmanentMarker.copyWith(
                    fontSize: 23, color: secondaryColor.withOpacity(.7)),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.getAnnouncementScreenRoute);
                },
                child: Icon(
                  FontAwesomeIcons.solidBell,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.getProfileScreenRoute);
                },
                child: Icon(
                  FontAwesomeIcons.userAstronaut,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container getFilter() {
    return Container(
      height: 60,
      width: Get.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedFilter = "All Topic";
                });
              },
              child: selectedFilter == "All Topic"
                  ? Container(
                      height: 35,
                      padding: getGlobalPadding(),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: getBorderRadius(),
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(.7),
                            primaryColor.withOpacity(.8),
                            primaryColor.withOpacity(.9),
                            primaryColor
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(.7),
                            blurRadius: 10,
                            offset: Offset(
                              0.0,
                              4,
                            ),
                          )
                        ],
                      ),
                      child: Text(
                        'All Topic',
                        style: defaultTS.copyWith(color: Colors.white),
                      ),
                    )
                  : Text(
                      "All Topic",
                      style: defaultTS.copyWith(
                        color: secondaryColor.withOpacity(.2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedFilter = "Announcements";
                });
              },
              child: selectedFilter == "Announcements"
                  ? Container(
                      height: 35,
                      padding: getGlobalPadding(),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: getBorderRadius(),
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(.7),
                            primaryColor.withOpacity(.8),
                            primaryColor.withOpacity(.9),
                            primaryColor
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(.7),
                            blurRadius: 10,
                            offset: Offset(
                              0.0,
                              4,
                            ),
                          )
                        ],
                      ),
                      child: Text(
                        'Announcements',
                        style: defaultTS.copyWith(color: Colors.white),
                      ),
                    )
                  : Text(
                      "Announcements",
                      style: defaultTS.copyWith(
                        color: secondaryColor.withOpacity(.2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedFilter = "Attendance";
                });
              },
              child: selectedFilter == "Attendance"
                  ? Container(
                      height: 35,
                      padding: getGlobalPadding(),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: getBorderRadius(),
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(.7),
                            primaryColor.withOpacity(.8),
                            primaryColor.withOpacity(.9),
                            primaryColor
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(.7),
                            blurRadius: 10,
                            offset: Offset(
                              0.0,
                              4,
                            ),
                          )
                        ],
                      ),
                      child: Text(
                        'Attendance',
                        style: defaultTS.copyWith(color: Colors.white),
                      ),
                    )
                  : Text(
                      "Attendance",
                      style: defaultTS.copyWith(
                        color: secondaryColor.withOpacity(.2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedFilter = "Bills";
                });
              },
              child: selectedFilter == "Bills"
                  ? Container(
                      height: 35,
                      padding: getGlobalPadding(),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: getBorderRadius(),
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(.7),
                            primaryColor.withOpacity(.8),
                            primaryColor.withOpacity(.9),
                            primaryColor
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(.7),
                            blurRadius: 10,
                            offset: Offset(
                              0.0,
                              4,
                            ),
                          )
                        ],
                      ),
                      child: Text(
                        'Bills',
                        style: defaultTS.copyWith(color: Colors.white),
                      ),
                    )
                  : Text(
                      "Bills",
                      style: defaultTS.copyWith(
                        color: secondaryColor.withOpacity(.2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              "Temp",
              style: defaultTS.copyWith(
                color: secondaryColor.withOpacity(.2),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }

  Column getAnnouncementTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: getGlobalPadding(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Announcements",
                style: headerTS.copyWith(fontSize: 16),
              ),
              // Text(
              //   "Show all",
              //   style: defaultTS.copyWith(
              //     fontSize: 13,
              //     color: secondaryColor.withOpacity(.5),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 220,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GetAnnouncement(index: index);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.arrowRight,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "See more",
                      style: defaultTS.copyWith(
                          fontSize: 10, color: secondaryColor.withOpacity(.5)),
                    )
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column getPastPaymentTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: getGlobalPadding(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Past Payments",
                style: headerTS.copyWith(fontSize: 16),
              ),
              // Text(
              //   "Show all",
              //   style: defaultTS.copyWith(
              //     fontSize: 13,
              //     color: secondaryColor.withOpacity(.5),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 80,
          width: Get.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GetPastPayment(index: index);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.arrowRight,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "See more",
                      style: defaultTS.copyWith(
                        fontSize: 10,
                        color: secondaryColor.withOpacity(.5),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column getCopyrightTag() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Copyright 2022 - Khondakar Afridi",
              style: defaultTS.copyWith(
                fontSize: 10,
                color: secondaryColor.withOpacity(.5),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget getClassPerformanceTab() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: getGlobalPadding(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Class Performance",
                style: headerTS.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GetClassPerformance(index: index);
                  },
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ],
    );
    // return Column(
    //   children: [
    //     SizedBox(
    //       height: 15,
    //     ),
    //     Padding(
    //       padding: getGlobalPadding(),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Text(
    //             "Class Performance",
    //             style: headerTS.copyWith(fontSize: 16),
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(
    //       height: 10,
    //     ),
    //     Container(
    //       height: 300,
    //       width: Get.width,
    //       child: ListView(
    //         shrinkWrap: true,
    //         scrollDirection: Axis.horizontal,
    //         physics: BouncingScrollPhysics(),
    //         children: [
    //           Container(
    //             height: 250,
    //             width: 200,
    //             margin: EdgeInsets.only(left: 20),
    //             decoration: BoxDecoration(
    //               color: Color(0xff9AA0FC),
    //               borderRadius: BorderRadius.circular(15),
    //               border: Border.all(
    //                 color: secondaryColor.withOpacity(.2),
    //                 width: 1,
    //               ),
    //             ),
    //             child: Column(
    //               children: [
    //                 Flexible(
    //                   flex: 3,
    //                   child: Container(
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     margin: getGlobalPadding(),
    //                     child: Lottie.asset(
    //                       'assets/lottie/classPerformance1.json',
    //                     ),
    //                   ),
    //                 ),
    //                 Flexible(
    //                   flex: 1,
    //                   child: Container(
    //                     margin: getGlobalPadding(),
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           'Total Classes',
    //                           style: defaultTS.copyWith(color: Colors.white),
    //                         ),
    //                         Text(
    //                           '10',
    //                           style: headerTS.copyWith(
    //                               color: Colors.white, fontSize: 30),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           Container(
    //             height: 250,
    //             width: 200,
    //             margin: EdgeInsets.only(left: 20),
    //             decoration: BoxDecoration(
    //               color: Color(0xffF8EFE4),
    //               borderRadius: BorderRadius.circular(15),
    //               border: Border.all(
    //                 color: secondaryColor.withOpacity(.2),
    //                 width: 1,
    //               ),
    //             ),
    //             child: Column(
    //               children: [
    //                 Flexible(
    //                   flex: 3,
    //                   child: Container(
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     margin: getGlobalPadding(),
    //                     child: Lottie.asset(
    //                       'assets/lottie/classPerformance2.json',
    //                     ),
    //                   ),
    //                 ),
    //                 Flexible(
    //                   flex: 1,
    //                   child: Container(
    //                     margin: getGlobalPadding(),
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           'Total Presents',
    //                           style: defaultTS.copyWith(color: secondaryColor),
    //                         ),
    //                         Text(
    //                           '8',
    //                           style: headerTS.copyWith(
    //                               color: secondaryColor, fontSize: 30),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           Container(
    //             height: 250,
    //             width: 200,
    //             margin: EdgeInsets.only(left: 20),
    //             decoration: BoxDecoration(
    //               color: Color(0xffACEEF3),
    //               borderRadius: BorderRadius.circular(15),
    //               border: Border.all(
    //                 color: secondaryColor.withOpacity(.2),
    //                 width: 1,
    //               ),
    //             ),
    //             child: Column(
    //               children: [
    //                 Flexible(
    //                   flex: 3,
    //                   child: Container(
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     margin: getGlobalPadding(),
    //                     child: Lottie.asset(
    //                       'assets/lottie/classPerformance3.json',
    //                     ),
    //                   ),
    //                 ),
    //                 Flexible(
    //                   flex: 1,
    //                   child: Container(
    //                     margin: getGlobalPadding(),
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           'Total Absents',
    //                           style: defaultTS.copyWith(
    //                             color: secondaryColor,
    //                           ),
    //                         ),
    //                         Text(
    //                           '1',
    //                           style: headerTS.copyWith(
    //                               color: secondaryColor, fontSize: 30),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           Container(
    //             height: 250,
    //             width: 200,
    //             margin: EdgeInsets.only(left: 20),
    //             decoration: BoxDecoration(
    //               color: Color(0xffFDB750),
    //               borderRadius: BorderRadius.circular(15),
    //               border: Border.all(
    //                 color: secondaryColor.withOpacity(.2),
    //                 width: 1,
    //               ),
    //             ),
    //             child: Column(
    //               children: [
    //                 Flexible(
    //                   flex: 3,
    //                   child: Container(
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     margin: getGlobalPadding(),
    //                     child: Lottie.asset(
    //                       'assets/lottie/classPerformance4.json',
    //                     ),
    //                   ),
    //                 ),
    //                 Flexible(
    //                   flex: 1,
    //                   child: Container(
    //                     margin: getGlobalPadding(),
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           'Holidays',
    //                           style: defaultTS.copyWith(color: Colors.white),
    //                         ),
    //                         Text(
    //                           '1',
    //                           style: headerTS.copyWith(
    //                               color: Colors.white, fontSize: 30),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           Container(
    //             height: 250,
    //             width: 200,
    //             margin: EdgeInsets.only(left: 20),
    //             decoration: BoxDecoration(
    //               color: Color(0xffA06AB4),
    //               borderRadius: BorderRadius.circular(15),
    //               border: Border.all(
    //                 color: secondaryColor.withOpacity(.2),
    //                 width: 1,
    //               ),
    //             ),
    //             child: Column(
    //               children: [
    //                 Flexible(
    //                   flex: 3,
    //                   child: Container(
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     margin: getGlobalPadding(),
    //                     child: Lottie.asset(
    //                       'assets/lottie/classPerformance5.json',
    //                     ),
    //                   ),
    //                 ),
    //                 Flexible(
    //                   flex: 1,
    //                   child: Container(
    //                     margin: getGlobalPadding(),
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           'On Leave',
    //                           style: defaultTS.copyWith(color: secondaryColor),
    //                         ),
    //                         Text(
    //                           '4',
    //                           style: headerTS.copyWith(
    //                               color: secondaryColor, fontSize: 30),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             width: 20,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBar(),
            getFilter(),
            getAnnouncementTab(),
            getPastPaymentTab(),
            getClassPerformanceTab(),
            getCopyrightTag()
          ],
        ),
      ),
    );
  }
}
