import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:school360/model/User.dart';

import '../routes/routes.dart';
import '../widgets/customSnackBar.dart';

class AuthenticationController extends GetxController {
  late User user;
  bool keepUserLoggedIn = false;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    checkIfUserIsLoggedIn();
  }

  Future<void> checkIfUserIsLoggedIn() async {
    var status = box.read("keepUserLoggedIn");
    if (status == null)
      return;
    else if (status) {
      keepUserLoggedIn = status;
      String studentId = box.read("StudentId");
      String password = box.read("Password");
      String schoolId = box.read("SchoolId");
      loginUser(studentId, password, schoolId);
      return;
    }
    return;
  }

  Future<void> logoutUser() async {
    box.write("StudentId", "StudentId");
    box.write("Password", "Password");
    box.write("SchoolId", "SchoolId");
    box.write("keepUserLoggedIn", false);
    keepUserLoggedIn = false;
    Get.offAllNamed(Routes.getLoginScreenRoute);
    return;
  }

  Future<void> loginUser(
      String StudentId, String Password, String SchoolId) async {
    try {
      String url =
          'https://school360.app/${SchoolId}/service_bridge/studentLogin';
      http.Response response = await http.post(Uri.parse(url), body: {
        "security_pin": '311556',
        'password': Password,
        'user_name': StudentId,
      });
      String data = response.body;
      var decodedJson = jsonDecode(data);
      user = User.fromJson(decodedJson);
      if (user.isSuccess == true) {
        if (keepUserLoggedIn) {
          box.write("StudentId", StudentId);
          box.write("Password", Password);
          box.write("SchoolId", SchoolId);
          box.write("keepUserLoggedIn", keepUserLoggedIn);
        }
        Get.offNamed(Routes.getMainframeScreenRoute);
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
}
