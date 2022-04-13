import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school360/constants/colors.dart';
import 'package:school360/constants/dimentions.dart';
import 'package:school360/controller/authenticationController.dart';
import 'package:school360/functions/randomColor.dart';
import 'package:school360/routes/routes.dart';
import 'package:school360/widgets/buttonLoadingAnimation.dart';
import 'package:school360/widgets/customSnackBar.dart';
import 'package:school360/widgets/customTextField.dart';

import '../constants/textStyle.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userIdTextEditingController = TextEditingController();

  TextEditingController schoolIdTextEditingController = TextEditingController();

  TextEditingController passwordIdTextEditingController =
      TextEditingController();


  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticationController = Get.find();
  }

  late AuthenticationController authenticationController;

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
                // height: 400,
                height: Get.height - Get.height * .45,
                width: double.infinity,
                child: Image.asset(
                  'assets/backdrop_images/backdropOne.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .25,
                  ),
                  Container(
                    height: 480,
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
                                  fontSize: 23,
                                  color: secondaryColor.withOpacity(.7)),
                            ),
                          ],
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
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 20,
                                child: Checkbox(
                                    value: authenticationController.keepUserLoggedIn,
                                    activeColor: primaryColor,
                                    onChanged: (value) {
                                      setState(() {
                                        authenticationController.keepUserLoggedIn = value!;
                                      });
                                    }),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    authenticationController.keepUserLoggedIn = !authenticationController.keepUserLoggedIn;
                                  });
                                },
                                child: Text(
                                  "Keep me logged in",
                                  style: defaultTS,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: InkWell(
                            onTap: () async {
                              String userId = userIdTextEditingController.text;
                              String password =
                                  passwordIdTextEditingController.text;
                              String schoolId =
                                  schoolIdTextEditingController.text;
                              if (userId.isNotEmpty &&
                                  password.isNotEmpty &&
                                  schoolId.isNotEmpty) {
                                setState(() {
                                  isLoading = true;
                                });
                                await Future.delayed(Duration(seconds: 2));
                                await authenticationController.loginUser(
                                  userId,
                                  password,
                                  schoolId,
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                showSnackbar(
                                    title: "Authentication Error",
                                    message:
                                        "Credentials cannot be kept empty!");
                              }
                            },
                            child: Container(
                              height: 45,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: secondaryColor.withOpacity(.5),
                                    width: 1,
                                  ),
                                  borderRadius: getBorderRadius(),
                                  color: primaryColor),
                              child: Center(
                                child: isLoading
                                    ? const ButtonLoadingAnimation(loadingColor: Color(0xffB6E2D3))
                                    : Text(
                                        'Login',
                                        style: headerTS.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: scaffoldBackgroundColor,
                                            letterSpacing: 1),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
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
                                  color: secondaryColor.withOpacity(.5),
                                  width: 1,
                                ),
                                borderRadius: getBorderRadius(),
                                color: Color(0xffB6E2D3),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign in with ID',
                                    style: headerTS.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.idCard,
                                    size: 18,
                                    color: secondaryColor,
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
