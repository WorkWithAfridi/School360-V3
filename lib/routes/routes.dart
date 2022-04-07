import 'package:get/get.dart';
import 'package:school360/view/announcementScreen.dart';
import 'package:school360/view/loginScreen.dart';
import 'package:school360/view/profileScreen.dart';
import 'package:school360/view/qrScannerScreen.dart';
import 'package:school360/view/splashScreen.dart';

import '../view/mainframe/mainframe.dart';

class Routes {
  static get getSplashScreenRoute => '/';
  static get getHomeScreenRoute => '/mainframe';
  static get getLoginScreenRoute => '/loginscreen';
  static get getQrScannercreenRoute => '/qrScannerScreen';
  static get getAnnouncementScreenRoute => '/announcementScreen';
  static get getProfileScreenRoute => '/profileScreen';
  static List<GetPage> routes = [
    GetPage(
      name: getSplashScreenRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: getHomeScreenRoute,
      transition: Transition.downToUp,
      page: () => Mainframe(),
    ),
    GetPage(
      name: getLoginScreenRoute,
      transition: Transition.downToUp,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: getQrScannercreenRoute,
      fullscreenDialog: true,
      transition: Transition.leftToRight,
      page: () => QrScannerScreen(),
    ),
    GetPage(
      name: getAnnouncementScreenRoute,
      fullscreenDialog: true,
      transition: Transition.rightToLeft,
      page: () => AnnouncementScreen(),
    ),
    GetPage(
      name: getProfileScreenRoute,
      fullscreenDialog: true,
      transition: Transition.rightToLeft,
      page: () => ProfileScreen(),
    ),
  ];
}
