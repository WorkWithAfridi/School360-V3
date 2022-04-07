import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/constants/colors.dart';
import 'package:school360/constants/dimentions.dart';
import 'package:school360/routes/routes.dart';
import 'package:school360/widgets/customTextField.dart';

import '../constants/textStyle.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController userIdTextEditingController = TextEditingController();
  TextEditingController schoolIdTextEditingController = TextEditingController();
  TextEditingController passwordIdTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 400,
                width: double.infinity,
                child: Image.asset(
                  'assets/backdrop_images/backdropOne.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .25,
                  ),
                  Container(
                    width: double.infinity,
                    color: scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: getBorderRadius()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "SCHOOL360",
                          style: headerTS.copyWith(fontSize: 35),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '• Empowering ',
                              style: defaultTS.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '• Education ',
                              style: defaultTS.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '• Everyday ',
                              style: defaultTS.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Sign in",
                          style: headerTS.copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: getCustomTextFieldWithIcon(
                            textEditingController:
                                schoolIdTextEditingController,
                            labelText: "Enter school id",
                            icon: FontAwesomeIcons.school,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: getCustomTextFieldWithIcon(
                            textEditingController: userIdTextEditingController,
                            labelText: "Enter student id",
                            icon: FontAwesomeIcons.userAstronaut,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: getCustomTextFieldWithIcon(
                            textEditingController:
                                passwordIdTextEditingController,
                            labelText: "Enter password",
                            icon: FontAwesomeIcons.lock,
                            isObscure: true,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.getHomeScreenRoute);
                            },
                            child: Container(
                              height: 45,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: getBorderRadius(),
                                  color: primaryColor),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: headerTS.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: scaffoldBackgroundColor,
                                      letterSpacing: 1
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       width: 40,
                        //       height: .5,
                        //       decoration: BoxDecoration(
                        //           color: secondaryColor,
                        //           borderRadius: getBorderRadius()),
                        //     ),
                        //     Text(
                        //       ' Or ',
                        //       style: defaultTS.copyWith(
                        //         color: secondaryColor.withOpacity(.5),
                        //       ),
                        //     ),
                        //     Container(
                        //       width: 40,
                        //       height: .5,
                        //       decoration: BoxDecoration(
                        //           color: secondaryColor,
                        //           borderRadius: getBorderRadius()),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(
                                Routes.getQrScannercreenRoute,
                              );
                            },
                            child: Container(
                              height: 45,
                              width: Get.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: secondaryColor,
                                  width: 1,
                                ),
                                borderRadius: getBorderRadius(),
                                color: primaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign in with ID',
                                    style: headerTS.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: scaffoldBackgroundColor,
                                      letterSpacing: 1
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.idCard,
                                    size: 18,
                                    color: scaffoldBackgroundColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Forgot your password? ",
                              style: defaultTS.copyWith(fontSize: 13),
                            ),
                            Text(
                              "Get help logging in.",
                              style: defaultTS.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
