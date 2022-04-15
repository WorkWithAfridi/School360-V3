import 'package:get/get.dart';
import 'package:school360/controller/authenticationController.dart';

class AuthenticationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
  }
}
