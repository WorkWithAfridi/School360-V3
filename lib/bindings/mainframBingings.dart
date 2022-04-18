import 'package:get/get.dart';
import 'package:school360/controller/attendanceController.dart';
import 'package:school360/controller/locationController.dart';
import 'package:school360/controller/noticeController.dart';
import 'package:school360/controller/resultController.dart';

class MainframBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => NoticeController());
    Get.lazyPut(() => ResultController());
    Get.lazyPut(() => AttendanceController());
  }
}
