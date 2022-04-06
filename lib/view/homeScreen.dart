import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/constants/colors.dart';
import 'package:school360/constants/dimentions.dart';

import '../constants/textStyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
        ),
        bottomNavigationBar: getCustomBottomNavigationBar(),
      ),
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
                  borderRadius: getBorderRadius(),
                  color: Color(0xff9AA0FC),
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
                  borderRadius: getBorderRadius(),
                  color: Color(0xffF8EFE4),
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
                  borderRadius: getBorderRadius(),
                  color: Color(0xffACEEF3),
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
                  borderRadius: getBorderRadius(),
                  color: Color(0xffFDB750),
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
                  borderRadius: getBorderRadius(),
                  color: Color(0xffA06AB4),
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

  Container getCustomBottomNavigationBar() {
    return Container(
      height: 70,
      child: FlipBoxBarPlus(
        navBarHeight: 70,
        items: [
          FlipBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: 20,
                color: secondaryColor,
              ),
              text: Text(
                "Home",
                style: defaultTS.copyWith(fontSize: 10),
              ),
              frontColor: primaryColor,
              backColor: Color(0xffEF7C8E)),
          FlipBarItem(
              icon: Icon(
                FontAwesomeIcons.chalkboard,
                size: 20,
                color: secondaryColor,
              ),
              text: Text(
                "Classwork",
                style: defaultTS.copyWith(fontSize: 10),
              ),
              frontColor: Color(0xffB6E2D3),
              backColor: Color(0xffD8A7B1).withAlpha(6)),
          FlipBarItem(
            icon: Icon(
              FontAwesomeIcons.graduationCap,
              size: 20,
              color: secondaryColor,
            ),
            text: Text(
              "Result",
              style: defaultTS.copyWith(fontSize: 10),
            ),
            frontColor: Color(0xffE5DDC8),
            backColor: Color(0xffDB1F48),
          ),
          FlipBarItem(
              icon: Icon(
                FontAwesomeIcons.creditCard,
                size: 20,
                color: secondaryColor,
              ),
              text: Text(
                "Payment",
                style: defaultTS.copyWith(fontSize: 10),
              ),
              frontColor: Color(0xffF2C5E0),
              backColor: Color(0xffD43790)),
          FlipBarItem(
              icon: Icon(
                FontAwesomeIcons.userAstronaut,
                size: 20,
                color: secondaryColor,
              ),
              text: Text(
                "Profile",
                style: defaultTS.copyWith(fontSize: 10),
              ),
              frontColor: Colors.pink,
              backColor: Colors.amber),
        ],
        onIndexChanged: (pageIndex) {
          setState(() {
            selectedPageIndex = pageIndex;
          });
        },
        selectedIndex: selectedPageIndex,
      ),
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
                      margin: EdgeInsets.only(left: 10),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: getBorderRadius(),
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: getBorderRadius(),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID:',
                                        style: defaultTS.copyWith(
                                          color: secondaryColor.withOpacity(.6),
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        'Some title - abc xyz 123',
                                        style: defaultTS.copyWith(
                                          color: secondaryColor.withOpacity(.9),
                                          fontSize: 14,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Paid on:',
                                        style: defaultTS.copyWith(
                                          color: secondaryColor.withOpacity(.6),
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        '12/12/12',
                                        style: defaultTS.copyWith(
                                          color: secondaryColor.withOpacity(.5),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 200,
                        width: Get.width * .6,
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
            Container(
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
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              "Announcements",
              style: defaultTS.copyWith(
                color: secondaryColor.withOpacity(.2),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              "Attendance",
              style: defaultTS.copyWith(
                color: secondaryColor.withOpacity(.2),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              "Bills",
              style: defaultTS.copyWith(
                color: secondaryColor.withOpacity(.2),
                fontWeight: FontWeight.bold,
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
            children: [
              Text(
                "Explore",
                style: headerTS,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "School 360",
                style: defaultTS.copyWith(
                    fontSize: 23, color: secondaryColor.withOpacity(.7)),
              ),
            ],
          ),
          Icon(FontAwesomeIcons.solidBell),
        ],
      ),
    );
  }
}
