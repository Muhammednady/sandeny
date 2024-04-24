import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/best_doctors_model.dart';

class BestDoctorsProvider extends GetConnect {
  // var networkController = NetworkController.instance;
  // make instance of this provider
  static BestDoctorsProvider get instance => Get.find();
  // GetStorage storage = GetStorage(); //set values here
  
  Timer? timer;
  @override
  void onInit() {
    httpClient.baseUrl = HttpHelper.baseUrl;
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
  }

  Future<BestDoctorsModel> getBestDoctors(http.Client? client) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));
    final response = await client!.get(
        Uri.parse("${HttpHelper.baseUrl}${HttpHelper.bestDoctors}"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${pref.getString('token')}',
        });

    var data = json.decode(response.body);
    log('this is the list of data: $data');
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      return BestDoctorsModel.fromJson(data);
    }

    if (data['code'] == 0) {
      EasyLoading.dismiss();
      if (data['error']['details'] == "Unauthenticated.") {
        Dialogs.errorDialog(Get.context!, 'unauthorized_error'.tr);
      } else {
        Dialogs.errorDialog(Get.context!, 'error_message'.tr);
      }
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return BestDoctorsModel.fromJson(data);
  }
}
