import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/scale_details_model.dart';

class ScaleDetailsProvider extends GetConnect {
  static ScaleDetailsProvider get instance => Get.find();

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

  Future<ScaleDetailsData> getScaleDetails(
    int scaleId,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.getScaleDetails}",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      query: {
        'scale_id': scaleId.toString(),
      },
    );

    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log('this is the status code: $data');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      return ScaleDetailsData.fromJson(data['data']);
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return ScaleDetailsData.fromJson(data['data']);
  }
}
