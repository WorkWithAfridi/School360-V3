import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/constants/dimentions.dart';
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
        body: Container(
          height: Get.height,
          width: Get.width,
          margin: getGlobalPadding(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        "SCHOOL360",
                        style: headerTS.copyWith(fontSize: 35),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Lottie.asset(
                            'assets/lottie/tiger.json',
                            fit: BoxFit.cover,
                            repeat: false,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FlickerAnimatedText(
                                'Empowering',
                                textStyle: headerTS.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              FlickerAnimatedText(
                                'Education',
                                textStyle: headerTS.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              FlickerAnimatedText(
                                "Everyday.",
                                textStyle: headerTS.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Sign Up.",
                  style: headerTS,
                ),
                SizedBox(
                  height: 20,
                ),
                getCustomTextFieldWithIcon(
                  textEditingController: schoolIdTextEditingController,
                  labelText: "Enter School ID",
                  icon: FontAwesomeIcons.school,
                ),
                SizedBox(
                  height: 10,
                ),
                getCustomTextFieldWithIcon(
                  textEditingController: userIdTextEditingController,
                  labelText: "Enter User ID",
                  icon: FontAwesomeIcons.school,
                ),
                SizedBox(
                  height: 10,
                ),
                getCustomTextFieldWithIcon(
                  textEditingController: passwordIdTextEditingController,
                  labelText: "Enter Password",
                  icon: FontAwesomeIcons.school,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "Login",
                      style: defaultTS,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
