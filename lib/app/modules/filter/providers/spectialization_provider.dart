import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/specialization_model.dart';

class SpecializationProvider extends GetConnect {
  static SpecializationProvider get instance => Get.find();

  Timer? timer;
  @override
  void onInit() {
    httpClient.baseUrl = HttpHelper.baseUrl;
    EasyLoading.addStatusCallback(
      (status) {
        if (status == EasyLoadingStatus.dismiss) {
          timer?.cancel();
        }
      },
    );
  }

  Future<SpecializationModel> getSpecialization() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.specialization}",
    );

    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      return SpecializationModel.fromJson(data);
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return SpecializationModel.fromJson(data);
  }
}
