import 'package:get/get.dart';
import 'package:school360/controller/qrController.dart';
import 'package:school360/controller/locationController.dart';

class QrScannerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrController());
  }
}
