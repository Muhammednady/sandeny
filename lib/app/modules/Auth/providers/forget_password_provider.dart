import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';
import '../models/forget_password_model.dart';
import '../views/otp_view.dart';

class ForgetPasswordProvider extends GetConnect {
  static ForgetPasswordProvider get instance =>
      Get.put(ForgetPasswordProvider());
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

  Future<ForgetPasswordModel> forgetPassword({
    required String phone,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await post(
        HttpHelper.forgetPassword,
        {
          'phone': phone,
        },
      );
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());
      if (data['code'] == 1) {
        EasyLoading.dismiss();
        storage.write('code', data['data']['code']);
        storage.write('number', '0');
        storage.write('phone', data['data']['phone']);
        Get.offAll(const OtpView());
      }

      if (data['code'] == 0) {
        Dialogs.errorDialog(Get.context!, 'valid_phone_number'.tr);
        EasyLoading.dismiss();
      }

      if (data['code'] == 2) {
        EasyLoading.show(status: 'loading'.tr);
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
        EasyLoading.dismiss();
      }
      return ForgetPasswordModel.fromJson(data);
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
