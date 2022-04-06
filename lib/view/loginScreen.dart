import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/constants/colors.dart';
import 'package:school360/constants/dimentions.dart';

import '../constants/textStyle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              child:
                  Lottie.asset('assets/lottie/tiger.json', fit: BoxFit.cover),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              color: secondaryColor.withOpacity(.2),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SCHOOL360",
                    style: headerTS.copyWith(color: Colors.white, fontSize: 35),
                  ),
                  SizedBox(
                    height: 30,
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FlickerAnimatedText(
                          'Empowering',
                          textStyle: headerTS.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        FlickerAnimatedText(
                          'Education',
                          textStyle: headerTS.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        FlickerAnimatedText(
                          "Everyday.",
                          textStyle: headerTS.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 300,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: defaultTS.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Divider(
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Or",
                        style: defaultTS.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(.5)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 50,
                        child: Divider(
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 45,
                    width: 300,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: getBorderRadius(),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(.5),
                          Colors.white.withOpacity(.6),
                          Colors.white.withOpacity(.7),
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(.5),
                          blurRadius: 10,
                          offset: Offset(
                            0.0,
                            4,
                          ),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Signin using ID",
                          style: defaultTS.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.idCard,
                          size: 20,
                        )
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
