import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/login_model.dart';

class LoginProvider extends GetConnect {
  static LoginProvider get instance => Get.put(LoginProvider());
  GetStorage storage = GetStorage();
  final secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
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

  Future<LoginModel> login({
    required String phone,
    required String password,
    required String fcmToken,
    required String lang,
  }) async {
    try {
      final response = await post(
        HttpHelper.login,
        {
          'phone_number': phone,
          'password': password,
          'fcm_token': fcmToken,
          'lang': lang,
        },
      );
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        storage.write('token', data['data']['token']);
        storage.write('phone', data['data']['phone']);
        await secureStorage.write(key: 'token', value: data['data']['token']);
        storage.write('fname', data['data']['first_name']);
        storage.write('lname', data['data']['last_name']);
        storage.write('email', data['data']['email']);
        log('this is the token: ${data['data']['token']}');
        Dialogs.successDialog(Get.context!, 'login_success'.tr);
        
        String? biometricCheck = await secureStorage.read(key: 'biometric');
        if (biometricCheck != 'checked' || biometricCheck!.isEmpty) {
          Dialogs.successDialog(Get.context!, 'activate_biometric'.tr);
          await secureStorage.write(key: 'phone', value: data['data']['phone']);
          await secureStorage.write(key: 'password', value: password);
        }

        Get.offAllNamed(Routes.HOME);

        return LoginModel.fromJson(data);
      }

      if (data['code'] == 0) {
        EasyLoading.dismiss();
        if (data['msg'] == 'account is not active.') {
          Dialogs.errorDialog(Get.context!, 'account_not_active'.tr);
        } else if (data['msg'] ==
            'phone & Password does not match with our record.') {
          Dialogs.errorDialog(Get.context!, 'login_failed'.tr);
        } else if (data['msg'] == 'active account first.') {
          Dialogs.errorDialog(Get.context!, 'account_not_active'.tr);
        } else {
          Dialogs.errorDialog(Get.context!, 'login_failed'.tr);
        }
      }

      if (data['code'] == 2) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
      }
      return LoginModel.fromJson(data);
    } on TimeoutException catch (e) {
      Dialogs.errorDialog(Get.context!, 'timeout'.tr);
      log('Timeout Error: ${e.message}');
      return Future.error(e.toString());
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
      timeout = const Duration(seconds: 1);
      return Future.error(e.toString());
    }
  }
}
