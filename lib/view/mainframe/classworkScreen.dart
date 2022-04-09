import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/functions/randomColor.dart';
import 'package:school360/functions/randomLottieBookAnimation.dart';
import 'package:school360/widgets/classPerformance.dart';
import 'package:school360/widgets/classworkRevision.dart';
import 'package:school360/widgets/loadingAnimation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constants/colors.dart';
import '../../constants/dimentions.dart';
import '../../constants/textStyle.dart';
import '../../routes/routes.dart';

class ClassworkScreen extends StatefulWidget {
  ClassworkScreen({Key? key}) : super(key: key);

  @override
  State<ClassworkScreen> createState() => _ClassworkScreenState();
}

class _ClassworkScreenState extends State<ClassworkScreen> {
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
                color: Colors.white,
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
                      ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 300,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.7),
                        ),
                      ),
                      Container(
                        height: 100,
                        child: GetLoadingAnimation(),
                      ),
                    ],
                  )
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            !showContent? Row(
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
            ) : Container(),
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
                          return GetClassRevision(index: index);
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
      padding: EdgeInsets.only(top: 15),
      margin: getGlobalPadding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
