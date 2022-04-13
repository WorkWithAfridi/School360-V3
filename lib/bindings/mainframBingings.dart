import 'package:get/get.dart';
import 'package:school360/controller/locationController.dart';

class MainframBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
  }
}
