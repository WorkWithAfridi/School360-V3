import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school360/routes/routes.dart';

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
      body: Center(
        child: Text('SplashScreen'),
      ),
    );
  }
}

void triggerSplashScreen() async {
  await Future.delayed(Duration(seconds: 3));
  Get.toNamed(Routes.getLoginScreenRoute);
}
