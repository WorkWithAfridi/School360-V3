import 'package:get/get.dart';
import 'package:school360/model/User.dart';

class UserController extends GetxController{
  var user = User.name(name: "name", schoolId: "schoolId", studentId: "studentId").obs;
}