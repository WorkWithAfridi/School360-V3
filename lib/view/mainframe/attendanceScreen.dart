import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school360/controller/appdataController.dart';
import 'package:school360/controller/attendanceController.dart';
import 'package:school360/widgets/classworkRevision.dart';
import 'package:school360/widgets/customSnackBar.dart';
import 'package:school360/widgets/loadingAnimation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constants/colors.dart';
import '../../constants/dimentions.dart';
import '../../constants/textStyle.dart';
import '../../functions/randomColor.dart';
import '../../routes/routes.dart';
import '../../widgets/buttonLoadingAnimation.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String selectedDate = '';
  bool isLoading = true;
  bool isButtonLoading = false;
  bool showContent = false;
  AttendanceController attendanceController = Get.find();
  AppdataController appdataController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    await attendanceController.callApiForYearDropdownList();
    await attendanceController.callApiForCourseDropdownList();
    appdataController.isAttendanceScreenLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: Get.height,
        width: Get.width,
        child: appdataController.isAttendanceScreenLoading.value
            ? Center(child: GetLoadingAnimation())
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getAppBar(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: getGlobalPadding(),
                      child: Text(
                        "Pick a Year",
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
                            value: attendanceController.selectedYear.value,
                            items: attendanceController.years
                                .map(buildMonthMenuItem)
                                .toList(),
                            onChanged: (value) {
                              attendanceController.selectedYear.value=value as String;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: getGlobalPadding(),
                      child: Text(
                        "Pick a Month",
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
                            value: attendanceController.selectedMonth.value,
                            items: attendanceController.months
                                .map(buildMonthMenuItem)
                                .toList(),
                            onChanged: (value) {
                              attendanceController.selectedMonth.value=value as String;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: getGlobalPadding(),
                      child: Text(
                        "Pick a Class/ mode",
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
                            value: attendanceController.selectedCourse.value,
                            items: attendanceController.courses
                                .map(buildMonthMenuItem)
                                .toList(),
                            onChanged: (value) {
                              attendanceController.selectedCourse.value =
                                  value as String;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        if (attendanceController.selectedCourse !=
                                "Select course" &&
                            attendanceController.selectedMonth !=
                                "Select year" &&
                            attendanceController.selectedMonth !=
                                "Select month") {
                          setState(() {
                            isButtonLoading = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          setState(() {
                            isButtonLoading = false;
                            showContent = true;
                          });
                        } else if (attendanceController.selectedYear ==
                            "Select year") {
                          showSnackbar(
                              title: "Error",
                              message: "Please select a valid year");
                        } else if (attendanceController.selectedMonth ==
                            "Select month") {
                          showSnackbar(
                              title: "Error",
                              message: "Please select a valid month");
                        } else if (attendanceController.selectedCourse ==
                            "Select course") {
                          showSnackbar(
                              title: "Error",
                              message: "Please select a valid course");
                        }
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
                        child: isButtonLoading
                            ? Center(
                                child: CustomLoadingAnimation(
                                  loadingColor: scaffoldBackgroundColor,
                                ),
                              )
                            : Center(
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
                                padding: EdgeInsets.only(
                                    right: 20, top: 10, bottom: 15),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        height: 35,
                                        // color: Colors.red,
                                        child: Row(
                                          children: [
                                            Container(
                                                width: 60,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: DefaultTextStyle.of(
                                                            context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: (index + 1)
                                                            .toString(),
                                                        style:
                                                            headerTS.copyWith(
                                                          color:
                                                              getRandomColor(),
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
                                                      color: Colors.black
                                                          .withOpacity(0.3),
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
    });
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
            "Attendance",
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
