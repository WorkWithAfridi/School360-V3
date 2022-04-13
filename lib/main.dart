import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school360/constants/colors.dart';
import 'package:school360/routes/routes.dart';

main() async{
  await GetStorage.init();
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
      smartManagement: SmartManagement.onlyBuilder,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          color: primaryColor,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.pink),
      ),
    );
  }
}
