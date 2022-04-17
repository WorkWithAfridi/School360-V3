import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:school360/constants/API.dart';
import 'package:school360/controller/userController.dart';
import 'package:school360/model/UserFromQrApiResponse.dart';
import 'package:school360/model/User.dart';
import 'package:school360/model/UserFromLoginApiResponse.dart';

import '../routes/routes.dart';
import '../widgets/customSnackBar.dart';

class AuthenticationController extends GetxController {
  late UserFromLoginApiResponse user;
  bool keepUserLoggedIn = false;
  final box = GetStorage();
  UserController userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    checkIfUserIsLoggedIn();
  }

  Future<void> checkIfUserIsLoggedIn() async {
    var status = box.read("keepUserLoggedIn");
    if (status == null) {
      keepUserLoggedIn = false;
      return;
    } else if (status) {
      keepUserLoggedIn = status;
      String studentId = box.read("StudentId");
      String name = box.read("StudentName");
      String schoolId = box.read("SchoolId");
      userController.user.value =
          User.name(name: name, schoolId: schoolId, studentId: studentId);
      return;
    }
    return;
  }

  Future<void> logoutUser() async {
    box.write("StudentId", "StudentId");
    box.write("SchoolId", "SchoolId");
    box.write("StudentName", "StudentName");
    box.write("keepUserLoggedIn", false);
    keepUserLoggedIn = false;
    Get.offAllNamed(Routes.getLoginScreenRoute);
    return;
  }

  Future<void> loginUser(
      String StudentId, String Password, String SchoolId) async {
    try {
      String url = '${baseUrl}${SchoolId}/service_bridge/studentLogin';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": security_pin,
        'password': Password,
        'user_name': StudentId,
      });
      String data = response.body;
      if (data.contains("<!DOCTYPE html>")) {
        showSnackbar(
            title: "Error", message: "An error occurred, please try again!");
      }
      var decodedJson = jsonDecode(data);
      user = UserFromLoginApiResponse.fromJson(decodedJson);
      if (user.isSuccess == true) {
        if (keepUserLoggedIn) {
          box.write("StudentId", StudentId);
          box.write("SchoolId", SchoolId);
          box.write("StudentName", user.studentInfo!.name.toString());
          box.write("keepUserLoggedIn", keepUserLoggedIn);
        }
        userController.user.value = User.name(
            name: user.studentInfo!.name.toString(),
            schoolId: SchoolId,
            studentId: user.studentInfo!.id.toString());
        Get.offAllNamed(Routes.getMainframeScreenRoute);
        return;
      } else {
        showSnackbar(title: "Incorrect data", message: "User not found.");
        return;
      }
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  Future<bool> decryptUserCredentials(String data) async {
    int len = data.length;
    String schoolId = data.substring(len - 6, len);
    String encryptedData = data.substring(0, len - 6);
    String url = '${baseUrl}$schoolId/service_bridge/verifyQrCode';

    http.Response response = await http.post(Uri.parse(url), body: {
      "security_pin": security_pin,
      "student_code": encryptedData,
    });
    String responseData = response.body;
    if (responseData.isEmail) return false;
    print(responseData);
    if (responseData.contains("<!DOCTYPE html>")) return false;
    var decodedJson = jsonDecode(responseData);
    if (decodedJson["status"] != "error") {
      UserFromQrApiResponse decodedUserFromQrApiResponse =
          UserFromQrApiResponse.fromJson(decodedJson);
      userController.user.value = User.name(
        name: decodedUserFromQrApiResponse.studentInfo!.name.toString(),
        schoolId: schoolId,
        studentId: decodedUserFromQrApiResponse.studentInfo!.id.toString(),
      );
      if (keepUserLoggedIn) {
        box.write("StudentId",
            decodedUserFromQrApiResponse.studentInfo!.id.toString());
        box.write("SchoolId", schoolId);
        box.write("StudentName",
            decodedUserFromQrApiResponse.studentInfo!.name.toString());
        box.write("keepUserLoggedIn", keepUserLoggedIn);
      }
      Get.offAllNamed(Routes.getMainframeScreenRoute);
      return true;
    }
    return false;
  }
}
