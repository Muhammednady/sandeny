import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';

class ActiveAccountProvider extends GetConnect {
  static ActiveAccountProvider get instance => Get.put(ActiveAccountProvider());
  GetStorage storage = GetStorage();
  var networkController = Get.put(NetworkController());
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

  Future<void> activeAccount({
    required String? phone,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await post(
        '${HttpHelper.baseUrl}${HttpHelper.activeAccount}',
        {
          'phone': phone!,
        },
      );
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());
      if (data['code'] == 1) {
        log('activate account sucssesfully');
        EasyLoading.dismiss();
      }
      if (data['code'] == 0) {
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
        EasyLoading.dismiss();
      }
      if (data['code'] == 2) {
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
        EasyLoading.dismiss();
      }
    } on TimeoutException catch (e) {
      Dialogs.errorDialog(Get.context!, 'timeout'.tr);
      log('Timeout Error: ${e.message}');
      return Future.error(e.toString());
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }
}
