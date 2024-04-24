import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/constants/httpHelper.dart';

import '../../../../constants/dialogs.dart';
import '../../network/controllers/network_controller.dart';
import '../models/search_doctors_model.dart';

class SearchDoctorsProvider extends GetConnect {
  var networkController = NetworkController.instance;
  GetStorage storage = GetStorage();
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

  Future<SearchDoctorsModel> getDoctor(
    String doctorName,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final response =
        await get("${HttpHelper.baseUrl}${HttpHelper.searchDoctors}", query: {
      'name': doctorName,
    });

    var data = response.body;
    log('this is the list of data: $data');
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      return SearchDoctorsModel.fromJson(data);
    }

    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }

    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }

    return SearchDoctorsModel.fromJson(data);
  }
}
