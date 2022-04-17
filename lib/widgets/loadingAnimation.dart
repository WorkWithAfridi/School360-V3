import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class GetLoadingAnimation extends StatelessWidget {
  const GetLoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width / 2,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/paper-plant-loading.json',
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }
}
