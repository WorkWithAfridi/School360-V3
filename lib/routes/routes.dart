import 'package:get/get.dart';
import 'package:school360/view/homeScreen.dart';
import 'package:school360/view/loginScreen.dart';
import 'package:school360/view/splashScreen.dart';

class Routes {
  static get getSplashScreenRoute => '/';
  static get getHomeScreenRoute => '/homescreen';
  static get getLoginScreenRoute => '/loginscreen';
  static List<GetPage> routes = [
    GetPage(
      name: getSplashScreenRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: getHomeScreenRoute,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: getLoginScreenRoute,
      page: () => LoginScreen(),
    ),
  ];
}
