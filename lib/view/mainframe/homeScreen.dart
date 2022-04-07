import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants/colors.dart';
import '../../constants/dimentions.dart';
import '../../constants/textStyle.dart';
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
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 200,
                        width: Get.width * .6,
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
                              flex: 2,
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                  top: 8,
                                  left: 8,
                                  right: 8,
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1512314889357-e157c22f938d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Temp - some important announcement",
                                        style: defaultTS.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Icon(
                                        FontAwesomeIcons.cloudArrowDown,
                                        color: primaryColor,
                                        size: 15,
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
                  },
                  itemCount: 3,
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
          height: 100,
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
                  itemBuilder: (context, index) {
                    return Container(
                      height: 90,
                      width: 220,
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: secondaryColor.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.all(3),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.pink,
                              ),
                              width: 70,
                              margin: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  index.toString(),
                                  style: headerTS.copyWith(fontSize: 30),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 5, bottom: 5, right: 5, left: 3),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ID:',
                                          style: defaultTS.copyWith(
                                            color:
                                                secondaryColor.withOpacity(.6),
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          'Some title - abc xyz 123',
                                          style: defaultTS.copyWith(
                                            color:
                                                secondaryColor.withOpacity(.9),
                                            fontSize: 14,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Paid on:',
                                          style: defaultTS.copyWith(
                                            color:
                                                secondaryColor.withOpacity(.6),
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          '12/12/12',
                                          style: defaultTS.copyWith(
                                            color:
                                                secondaryColor.withOpacity(.9),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
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

  Column getClassPerformanceTab() {
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
        Container(
          height: 300,
          width: Get.width,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                height: 250,
                width: 200,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xff9AA0FC),
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
                        child: Lottie.asset(
                          'assets/lottie/boy-studying-globe.json',
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
                              'Total Classes',
                              style: defaultTS.copyWith(color: Colors.white),
                            ),
                            Text(
                              '10',
                              style: headerTS.copyWith(
                                  color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                width: 200,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xffF8EFE4),
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
                        child: Lottie.asset(
                          'assets/lottie/classroom.json',
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
                              'Total Presents',
                              style: defaultTS.copyWith(color: secondaryColor),
                            ),
                            Text(
                              '8',
                              style: headerTS.copyWith(
                                  color: secondaryColor, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                width: 200,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xffACEEF3),
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
                        child: Lottie.asset(
                          'assets/lottie/online-classes.json',
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
                              'Total Absents',
                              style: defaultTS.copyWith(
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              '1',
                              style: headerTS.copyWith(
                                  color: secondaryColor, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                width: 200,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xffFDB750),
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
                        child: Lottie.asset(
                          'assets/lottie/holiday.json',
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
                              'Holidays',
                              style: defaultTS.copyWith(color: Colors.white),
                            ),
                            Text(
                              '1',
                              style: headerTS.copyWith(
                                  color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                width: 200,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xffA06AB4),
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
                        child: Lottie.asset(
                          'assets/lottie/busy.json',
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
                              'On Leave',
                              style: defaultTS.copyWith(color: secondaryColor),
                            ),
                            Text(
                              '4',
                              style: headerTS.copyWith(
                                  color: secondaryColor, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
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
