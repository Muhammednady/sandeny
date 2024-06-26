import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/scale_model.dart';

class ScaleProvider extends GetConnect {
  static ScaleProvider get instance => Get.find();

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

  Future<List<ScaleData>> getScales() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.getScales}",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );

    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      final slist = data['data'] as List;
      log('this is the list of data: $slist');
      return slist.map((e) => ScaleData.fromJson(e)).toList();
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    
    return [];
  }
}
