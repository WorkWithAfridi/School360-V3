import 'dart:convert';

import 'package:get/get.dart';
import 'package:school360/constants/API.dart';
import 'package:school360/controller/userController.dart';

import '../model/ResultModelFromApiResponse.dart';
import '../model/dropdown_list/data_model_for_year_dropdown_list.dart';
import 'package:http/http.dart' as http;

class ResultController extends GetxController {
  String selectedYear = 'Select year';
  var years = <String>[
    'Select year',
  ];
  UserController userController = Get.find();

  late DataModelForYearDropDown? yearDropdownList;
  late DataModelForResult? dataModelForResult;

  void ExtractYearFromYearDropDownApi() {
    years = <String>[
      'Select year',
    ];
    int len = yearDropdownList!.yearData!.length;
    for (int i = 0; i < len; i++) {
      years.add(yearDropdownList!.yearData![i].value.toString());
    }
  }

  Future<bool> getYearDropDownList() async {
    String url =
        'https://school360.app/${userController.user.value.schoolId}/service_bridge/yearListData';

    http.Response response = await http.post(Uri.parse(url), body: {
      "security_pin": '311556',
    });
    String data = response.body;
    if (data.isEmpty) {
      return false;
    } else {
      var decodedData = jsonDecode(data);
      yearDropdownList = DataModelForYearDropDown.fromJson(decodedData);
      if (yearDropdownList!.status == 'success') {
        ExtractYearFromYearDropDownApi();
      } else {
        return false;
      }
    }
    return false;
  }

  Future<bool> getResult() async {
    String url =
        'https://school360.app/${userController.user.value.schoolId}/service_bridge/getResultListByStudentCode';
    http.Response response = await http.post(Uri.parse(url), body: {
      "security_pin": security_pin,
      "student_code": userController.user.value.studentId,
      "year": selectedYear
    });
    String dataFromResultResponse = response.body;
    print(dataFromResultResponse);
    if (dataFromResultResponse.isNotEmpty) {
      var jsonFormattedDataForResult = jsonDecode(dataFromResultResponse);
      dataModelForResult =
          DataModelForResult.fromJson(jsonFormattedDataForResult);
      if (dataModelForResult!.status == "success") {
        return true;
        //nav push to result
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
