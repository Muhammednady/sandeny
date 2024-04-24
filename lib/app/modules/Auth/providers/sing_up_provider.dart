import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/Auth/models/sing_up_model.dart';
import 'package:sandeny/app/modules/network/controllers/network_controller.dart';
import 'package:sandeny/constants/dialogs.dart';
import 'package:sandeny/constants/httpHelper.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../views/otp_view.dart';

class SingUpProvider extends GetConnect {
  static SingUpProvider get instance => Get.put(SingUpProvider());
  GetStorage storage = GetStorage();
  final secureStorage = const FlutterSecureStorage(
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

  Future<SingUpModel> register({
    required String fname,
    required String lname,
    required String igama,
    required String phone,
    required String password,
    required String fcmToken,
    required String lang,
    required String email,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await post(
        HttpHelper.register,
        {
          'first_name': fname,
          'last_name': lname,
          'iqama_number': int.parse(igama),
          'phone_number': phone,
          'password': password,
          'fcm_token': fcmToken,
          'lang': lang,
          'email': email,
        },
      );
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        await secureStorage.write(key: 'phone', value: data['data']['phone']);
        await secureStorage.write(key: 'password', value: password);
        await secureStorage.write(key: 'token', value: data['data']['token']);
        storage.write('code', data['data']['otp_code']);
        storage.write('phone', data['data']['phone']);
        storage.write('fname', data['data']['first_name']);
        storage.write('lname', data['data']['last_name']);
        storage.write('email', data['data']['email']);
        storage.write('token', data['data']['token']);
        Get.to(const OtpView(), arguments: 1);
      }
      if (data['code'] == 0) {
        if (data['data']['first_name'] != null) {
          Dialogs.errorDialog(Get.context!, 'first_name_already_exist'.tr);
          EasyLoading.dismiss();
        }
        if (data['data']['last_name'] != null) {
          Dialogs.errorDialog(Get.context!, 'last_name_already_exist'.tr);
          EasyLoading.dismiss();
        }
        if (data['data']['phone_number'] != null) {
          Dialogs.errorDialog(Get.context!, 'phone_already_exist'.tr);
          EasyLoading.dismiss();
        }
        if (data['data']['iqama_number'] != null) {
          Dialogs.errorDialog(Get.context!, 'igama_already_exist'.tr);
          EasyLoading.dismiss();
        }
      }

      if (data['code'] == 2) {
        EasyLoading.show(status: 'loading'.tr);
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
        EasyLoading.dismiss();
      }
      return SingUpModel.fromJson(data);
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
