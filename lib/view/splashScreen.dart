import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/constants/textStyle.dart';
import 'package:school360/routes/routes.dart';

import '../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    triggerSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: GridPaper(
                color: secondaryColor.withOpacity(0.08),
                divisions: 4,
                interval: 800,
                subdivisions: 8,
              ),
            ),
          ),
          Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 150,
                  child: Lottie.asset('assets/lottie/paper-plant-loading.json',
                      fit: BoxFit.fitWidth),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SCHOOL",
                      style: headerTS.copyWith(fontSize: 18),
                    ),
                    Text(
                      "360",
                      style: parmanentMarker.copyWith(
                          fontSize: 18,
                          color: secondaryColor.withOpacity(.7)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void triggerSplashScreen() async {
  await Future.delayed(Duration(seconds: 3));
  Get.toNamed(Routes.getLoginScreenRoute);
}
