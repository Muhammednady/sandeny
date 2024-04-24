import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/network/controllers/network_controller.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sandeny/constants/dialogs.dart';
import 'package:sandeny/constants/httpHelper.dart';


class ChangePasswordProvider extends GetConnect {
  static ChangePasswordProvider get instance =>
      Get.put(ChangePasswordProvider());
  GetStorage storage = GetStorage();
  var networkController = NetworkController.instance;
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

  Future<void> updatePassword({
    required String newPassword,
  }) async {
    final response = await post(HttpHelper.updatePassword, {
      'new_password': newPassword,
    }, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${storage.read('token')}',
    });
    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log('this is the data: $data');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Dialogs.successDialog(Get.context!, 'change_password_success'.tr);
      Get.offAllNamed(Routes.AUTH, arguments: 1);
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'old_password_error'.tr);
    }

    if (data['code'] == 2) {
      EasyLoading.show(status: 'loading'.tr);
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
      EasyLoading.dismiss();
    }
  }
}
