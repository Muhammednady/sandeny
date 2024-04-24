import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/Auth/views/otp_view.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';

class SendOtpProvider extends GetConnect {
  static SendOtpProvider get instance => Get.put(SendOtpProvider());
  GetStorage storage = GetStorage();
  static var httpHelper = HttpHelper();
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

  Future<void> sendOtp({
    required String phone,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await post(
        HttpHelper.sendOtp,
        {
          'phone_number': phone,
        },
      );
      storage.write('phone', phone);
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        storage.write('code', data['otp']);
        Get.to(const OtpView(), arguments: 0);
      }

      if (data['code'] == 0) {
        EasyLoading.dismiss();
      }

      if (data['code'] == 2) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
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
