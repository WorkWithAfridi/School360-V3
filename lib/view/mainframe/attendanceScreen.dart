import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school360/widgets/classworkRevision.dart';
import 'package:school360/widgets/loadingAnimation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constants/colors.dart';
import '../../constants/dimentions.dart';
import '../../constants/textStyle.dart';
import '../../functions/randomColor.dart';
import '../../routes/routes.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
                      selectedDate = x.value.toString().substring(0, 10);
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
              height: 15,
            ),
            Padding(
              padding: getGlobalPadding(),
              child: Text(
                "Pick a Class",
                style: headerTS.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              margin: getGlobalPadding(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: secondaryColor.withOpacity(.2),
                  width: 1,
                ),
              ),
              // color: Colors.red,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    dropdownColor: Colors.white,
                    style: defaultTS,
                    isExpanded: false,
                    elevation: 4,
                    value: "January",
                    items: [
                      "January",
                      "February",
                      "March",
                    ].map(buildMonthMenuItem).toList(),
                    onChanged: (value) {}),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(Duration(seconds: 2));
                setState(() {
                  isLoading = false;
                  showContent = true;
                });
              },
              child: Container(
                height: 45,
                width: Get.width,
                margin: getGlobalPadding(),
                decoration: BoxDecoration(
                  color: Color(0xffEF7C8E),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: secondaryColor.withOpacity(.2),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Load',
                    style: headerTS.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: scaffoldBackgroundColor,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                              "Report",
                              style: headerTS,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(right: 20, top: 10, bottom: 15),
                        margin: getGlobalPadding(),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: secondaryColor.withOpacity(.2),
                            width: 1,
                          ),
                        ),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                // color: Colors.red,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        alignment: Alignment.bottomCenter,
                                        child: RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: (index + 1).toString(),
                                                style: headerTS.copyWith(
                                                  color: getRandomColor(),
                                                ),
                                              ),
                                              TextSpan(
                                                  text: 'th ',
                                                  style: defaultTS),
                                            ],
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: double.infinity,
                                        // color: Colors.purple,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Present",
                                              style: defaultTS.copyWith(
                                                  fontSize: 20),
                                            ),
                                            // const SizedBox(
                                            //   height: 5,
                                            // ),
                                            Container(
                                              width: double.infinity,
                                              height: 1,
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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

  DropdownMenuItem<String> buildMonthMenuItem(String month) => DropdownMenuItem(
        value: month,
        child: Text(month),
      );



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
            "Pick a Date",
            style: headerTS,
          ),
          // InkWell(
          //   onTap: () {
          //     Get.toNamed(Routes.getAnnouncementScreenRoute);
          //   },
          //   child: Icon(
          //     FontAwesomeIcons.book,
          //   ),
          // ),
        ],
      ),
    );
  }
}
