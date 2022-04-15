import 'package:get/get.dart';
import 'package:school360/bindings/authenticationBindings.dart';
import 'package:school360/bindings/mainframBingings.dart';
import 'package:school360/bindings/userBindings.dart';
import 'package:school360/controller/userController.dart';
import 'package:school360/view/announcementScreen.dart';
import 'package:school360/view/loginScreen.dart';
import 'package:school360/view/profileScreen.dart';
import 'package:school360/view/qrScannerScreen.dart';
import 'package:school360/view/splashScreen.dart';

import '../bindings/qrScannerBindings.dart';
import '../view/mainframe/mainframe.dart';

class Routes {
  static get getSplashScreenRoute => '/';
  static get getMainframeScreenRoute => '/mainframe';
  static get getLoginScreenRoute => '/loginscreen';
  static get getQrScannercreenRoute => '/qrScannerScreen';
  static get getAnnouncementScreenRoute => '/announcementScreen';
  static get getProfileScreenRoute => '/profileScreen';
  static List<GetPage> routes = [
    GetPage(
      name: getSplashScreenRoute,
      bindings: [
        AuthenticationBindings(),
        UserBinding()
      ],
      page: () => SplashScreen(),
    ),
    GetPage(
      name: getMainframeScreenRoute,
      transition: Transition.downToUp,
      bindings: [
        MainframBindings(),
      ],
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
      bindings: [
        QrScannerBindings(),
      ],
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
