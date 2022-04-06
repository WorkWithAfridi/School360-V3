import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school360/constants/colors.dart';
import 'package:school360/routes/routes.dart';

main() {
  runApp(const School360());
}

class School360 extends StatelessWidget {
  const School360({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.getSplashScreenRoute,
      getPages: Routes.routes,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
    );
  }
}
