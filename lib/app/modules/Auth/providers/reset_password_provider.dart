import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';
import '../models/rest_password_model.dart';

class ResetPasswordProvider extends GetConnect {
  static ResetPasswordProvider get instance => Get.put(ResetPasswordProvider());
  final storage =  const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
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

  Future<ResetPasswordModel> resetPassword({
    required String phone,
    required String newPassword,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await post(HttpHelper.resetPassword, {
        'phone_number': phone,
        'new_password': newPassword,
      }, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        await storage.write(key: 'phone', value: phone);
        await storage.write(key: 'password', value: newPassword);
        Dialogs.successDialog(Get.context!, 'reset_password_success'.tr);
        Get.offAllNamed(Routes.AUTH, arguments: 1);
      }

      if (data['code'] == 0) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, 'check_the_data'.tr);
      }

      if (data['code'] == 2) {
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
        EasyLoading.dismiss();
      }
      return ResetPasswordModel.fromJson(data);
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }
}
