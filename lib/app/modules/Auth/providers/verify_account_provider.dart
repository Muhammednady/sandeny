import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';
import '../models/verify_account_model.dart';

class VerifyAccountProvider extends GetConnect {
  static VerifyAccountProvider get instance => Get.put(VerifyAccountProvider());
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

  Future<VerifyAccountModel> verifyAccount({
    required String phone,
    required String code,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response =
          await post('${HttpHelper.baseUrl}${HttpHelper.verifyAccount}', {
        'phone': phone,
        'code': code,
      }, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });
      log('this is the response: ${response.body.toString()}');
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log('this the verify account data : ${data.toString()}');

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        return VerifyAccountModel.fromJson(data);
      }

      if (data['code'] == 0) {
        EasyLoading.dismiss();
      }

      if (data['code'] == 2) {
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

    return VerifyAccountModel();
  }
}
