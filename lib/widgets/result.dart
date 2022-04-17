import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school360/controller/resultController.dart';

import '../constants/colors.dart';
import '../constants/dimentions.dart';
import '../constants/textStyle.dart';
import '../functions/randomColor.dart';

class GetResult extends StatelessWidget {
  int index;
  GetResult({Key? key, required this.index}) : super(key: key);

  ResultController resultController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        margin: getGlobalPadding(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            color: secondaryColor.withOpacity(.2),
            width: 1,
          ),
        ),
        child: Container(
          // height: 200,
          // color: Colors.yellow,
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // color: black,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultController
                          .dataModelForResult!.resultInfo![index].name
                          .toString(),
                      style: headerTS.copyWith(color: getRandomColor()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Grade: ',
                          style: defaultTS,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          resultController.dataModelForResult!
                              .resultInfo![index].cAlphaGpaWithOptional
                              .toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'GPA: ',
                          style: defaultTS,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          resultController.dataModelForResult!
                              .resultInfo![index].gpaWithOptional
                              .toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Mark Obtained: ',
                          style: defaultTS,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          resultController.dataModelForResult!
                              .resultInfo![index].totalObtainMark
                              .toString(),
                          style: defaultTS,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Class Position: ',
                          style: defaultTS,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          resultController.dataModelForResult!
                              .resultInfo![index].classPosition
                              .toString(),
                          style: defaultTS,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Credits Completed: ',
                          style: defaultTS,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          resultController.dataModelForResult!
                              .resultInfo![index].totalCredit
                              .toString(),
                          style: defaultTS,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  // setState(() {
                  //   isLoading = true;
                  // });
                  // await Future.delayed(Duration(seconds: 2));
                  // setState(() {
                  //   isLoading = false;
                  //   showContent = true;
                  // });
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
                      'View marksheet',
                      style: headerTS.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: scaffoldBackgroundColor,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
