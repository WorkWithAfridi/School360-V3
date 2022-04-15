import 'package:get/get.dart';
import 'package:school360/controller/userController.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
