import 'dart:convert';

import 'package:get/get.dart';
import 'package:school360/controller/userController.dart';
import 'package:http/http.dart' as http;
import '../model/dropdown_list/data_model_for_course_dropdown_list.dart';
import '../model/dropdown_list/data_model_for_year_dropdown_list.dart';

class AttendanceController extends GetxController {
  int ConvertMonthStringToMonthInt(String _selectedMonth) {
    int month = 1;
    if (_selectedMonth == "January") {
      month = 1;
    }
    if (_selectedMonth == "February") {
      month = 2;
    }
    if (_selectedMonth == "March") {
      month = 3;
    }
    if (_selectedMonth == "April") {
      month = 4;
    }
    if (_selectedMonth == "May") {
      month = 5;
    }
    if (_selectedMonth == "June") {
      month = 6;
    }
    if (_selectedMonth == "July") {
      month = 6;
    }
    if (_selectedMonth == "August") {
      month = 8;
    }
    if (_selectedMonth == "September") {
      month = 9;
    }
    if (_selectedMonth == "October") {
      month = 10;
    }
    if (_selectedMonth == "November") {
      month = 11;
    }
    if (_selectedMonth == "December") {
      month = 12;
    }
    return month;
  }

  DataModelForYearDropDown yearDropdownList = DataModelForYearDropDown();
  UserController userController = Get.find();

  var years = <String>[
    'Select year',
  ];

  var selectedYear = 'Select year'.obs;
  var selectedMonth = 'Select month'.obs;

  final months = [
    'Select month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  ExtractYearFromYearDropDownApi() {
    years = [
      selectedYear.value,
    ];
    int len = yearDropdownList.yearData!.length;
    for (int i = 0; i < len; i++) {
      years.add(yearDropdownList.yearData![i].value.toString());
    }
  }

  Future<bool> callApiForYearDropdownList() async {
    String url =
        'https://school360.app/${userController.user.value.schoolId}/service_bridge/yearListData';

    http.Response response = await http.post(Uri.parse(url), body: {
      "security_pin": '311556',
    });
    String data = response.body;
    print(data);
    if (data.isEmpty) {
      return false;
    } else {
      var decodedData = jsonDecode(data);
      yearDropdownList = DataModelForYearDropDown.fromJson(decodedData);
      if (yearDropdownList.status == 'success') {
        ExtractYearFromYearDropDownApi();
        return true;
      } else {
        return false;
      }
    }
  }

  var selectedCourse = 'Select course'.obs;

  var courses = <String>[
    'Select course',
  ];

  void ExtractCourseFromCourseDropDownApi() {
    courses = <String>[
      'Select course',
    ];
    int len = courseDropdownAPI.periodData!.length.toInt();
    for (int i = 0; i < len; i++) {
      courses.add(courseDropdownAPI.periodData![i].name.toString());
    }
  }

  DataModelForCourseDropDown courseDropdownAPI = DataModelForCourseDropDown();

  Future<bool> callApiForCourseDropdownList() async {
    String url =
        'https://school360.app/${userController.user.value.schoolId}/service_bridge/classPeriodListData';

    http.Response response = await http.post(Uri.parse(url), body: {
      "security_pin": '311556',
    });
    String data = response.body;
    if (data.isEmpty) {
      return false;
    } else {
      var decodedData = jsonDecode(data);
      courseDropdownAPI = DataModelForCourseDropDown.fromJson(decodedData);
      if (courseDropdownAPI.status == 'success') {
        ExtractCourseFromCourseDropDownApi();
        return true;
      } else {
        return false;
      }
    }
  }
}
