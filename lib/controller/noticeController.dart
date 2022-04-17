import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school360/model/NoticeModelFromApiResponse.dart';

import '../constants/API.dart';

class NoticeController extends GetxController {
  var noticeModelFromApiResponse = NoticeModelFromApiResponse().obs;
  Future<bool> getNotice(String schoolId, String pageNo) async {
    String url = '${baseUrl}${schoolId}/service_bridge/getAllNotice';
    http.Response response = await http.post(Uri.parse(url), body: {
      "security_pin": security_pin,
      "row_per_page": 15.toString(),
      "segment": pageNo.toString()
    });
    print(url);
    String data = response.body;
    if (data.isEmpty) {
      return false;
    } else {
      var data1 = jsonDecode(data);
      if (data1["is_success"] == true) {
        noticeModelFromApiResponse.value =
            NoticeModelFromApiResponse.fromJson(data1);
        return true;
      }
    }
    return false;
  }
}
