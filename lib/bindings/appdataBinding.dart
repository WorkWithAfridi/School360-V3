import 'package:get/get.dart';
import 'package:school360/controller/appdataController.dart';

class AppdataBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppdataController());
  }
}
