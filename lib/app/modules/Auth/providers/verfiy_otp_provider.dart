import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/Auth/providers/active_account_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../routes/app_pages.dart';
import '../models/verfiy_otp_model.dart';
import '../views/resetpassword_view.dart';

class VerifyOtpProvider extends GetConnect {
  static VerifyOtpProvider get instance => Get.put(VerifyOtpProvider());

  GetStorage storage = GetStorage();
  final secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
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

  Future<VerifyOtpModel> verifyOtp({
    required String phone,
    required String otpCode,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await post(
        HttpHelper.verify,
        {
          'phone': phone,
          'code': otpCode,
        },
      );
      var data = response.body;
      var statusCode = response.statusCode;
      final activeAccountProvider = ActiveAccountProvider();
      log('this is the status code: $statusCode');
      log(data.toString());

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        if (storage.read('code').toString() == otpCode) {
          if (storage.read('number').toString() == '0') {
            Get.offAll(const ResetpasswordView());
          } else if (storage.read('number').toString() == '1') {
            Dialogs.successDialog(Get.context!, 'sucsses_register'.tr);
            activeAccountProvider.activeAccount(
              phone: await secureStorage.read(key: 'phone'),
            );
            storage.write('token', data['data']['token']);
            Get.offAllNamed(Routes.COMPLETE_ACCOUNT_INFORMATION);
          }
        } else {
          Dialogs.errorDialog(Get.context!, 'user_verfication_failed'.tr);
        }
      }

      if (data['code'] == 0) {
        Dialogs.errorDialog(Get.context!, 'user_verfication_failed'.tr);
        EasyLoading.dismiss();
      }

      if (data['code'] == 2) {
        EasyLoading.show(status: 'loading'.tr);
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
        EasyLoading.dismiss();
      }
      return VerifyOtpModel.fromJson(data);
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
