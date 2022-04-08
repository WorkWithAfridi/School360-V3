import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/functions/randomColor.dart';
import 'package:school360/functions/randomLottieBookAnimation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constants/colors.dart';
import '../../constants/dimentions.dart';
import '../../constants/textStyle.dart';
import '../../routes/routes.dart';

class classworkScreen extends StatefulWidget {
  classworkScreen({Key? key}) : super(key: key);

  @override
  State<classworkScreen> createState() => _classworkScreenState();
}

class _classworkScreenState extends State<classworkScreen> {
  String selectedDate = '';
  bool isLoading = false;
  bool showContent = false;

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
            SizedBox(
              height: 15,
            ),
            Container(
              height: 300,
              margin: getGlobalPadding(),
              padding: EdgeInsets.only(
                top: 25,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.7),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: secondaryColor.withOpacity(.2),
                  width: 1,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SfDateRangePicker(
                    allowViewNavigation: true,
                    selectionMode: DateRangePickerSelectionMode.single,
                    selectionColor: primaryColor,
                    toggleDaySelection: false,
                    onSelectionChanged: (x) async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(Duration(seconds: 2));
                      setState(() {
                        selectedDate = x.value.toString().substring(0, 10);
                        print(selectedDate);
                      });
                      setState(() {
                        isLoading = false;
                        showContent = true;
                      });
                    },
                  ),
                  isLoading
                      ? Container(
                          height: 300,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.7),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getGlobalPadding(),
                  child: Text(
                    '*Please select a date to continue.',
                    style: defaultTS.copyWith(
                      color: secondaryColor.withOpacity(.6),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            showContent
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getGlobalPadding(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Revision",
                              style: headerTS,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 4,
                            ),
                            child: Container(
                              height: 200,
                              width: Get.width,
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
                                        child: Lottie.asset(
                                          getRandomBookAnimation(),
                                          fit: BoxFit.fitWidth,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                )
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
                        },
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )
                : Container(),
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
          Text(
            "Classwork",
            style: headerTS,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.getAnnouncementScreenRoute);
            },
            child: Icon(
              FontAwesomeIcons.book,
            ),
          ),
        ],
      ),
    );
  }
}
