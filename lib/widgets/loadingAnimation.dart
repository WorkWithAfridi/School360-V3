import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GetLoadingAnimation extends StatelessWidget {
  const GetLoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/paper-plant-loading.json',
      fit: BoxFit.fitHeight,
    );
  }
}
