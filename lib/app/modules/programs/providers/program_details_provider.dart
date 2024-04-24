import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/program_details_model.dart';

class ProgramDetailsProvider extends GetConnect {
  static ProgramDetailsProvider get instance => Get.find();

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

  Future<ProgramDetailsData> getProgramDetails(
    int programId,
  ) async {
    var storage = GetStorage();

    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.getProgramsDetails}",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${storage.read('token')}'
      },
      query: {
        'id': programId.toString(),
      },
    );

    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log('this is the status code: $data');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      return ProgramDetailsData.fromJson(data['data']);
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return ProgramDetailsData.fromJson(data['data']);
  }
}
