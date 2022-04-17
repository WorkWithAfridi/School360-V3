import 'package:get/get.dart';
import 'package:school360/controller/locationController.dart';
import 'package:school360/controller/noticeController.dart';

class MainframBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => NoticeController());
  }
}
