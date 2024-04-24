import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';

class SelectFavoriteDoctorProvider extends GetConnect {
  static SelectFavoriteDoctorProvider get instance =>
      SelectFavoriteDoctorProvider.instance;
  GetStorage storage = GetStorage();
  // static SelectFavoriteDoctorProvider get instance => Get.find();
  // var doctorController = Get.put(DoctorsController());
  Timer? timer;
  @override
  void onInit() async {
    httpClient.baseUrl = HttpHelper.baseUrl;
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
  }

  Future<void> addToFavorite({
    required int? doctorId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final response =
        await post("${HttpHelper.baseUrl}${HttpHelper.addfavoriteDoctor}", {
      'doctor_id': doctorId,
    }, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${storage.read('token')}',
    });
    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log(data.toString());

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Dialogs.successDialog(
          Get.context!, 'added_to_favorite_doctor_success'.tr);
    }

    if (data['code'] == 0) {
      Dialogs.errorDialog(Get.context!, 'error'.tr.tr);
    }

    if (data['code'] == 2) {
      EasyLoading.show(status: 'loading'.tr);
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    if (statusCode == 500) {
      Dialogs.errorDialog(Get.context!, "please_login_to_add_to_favorite".tr);
    }
  }

  Future<void> removeFromFavorite({
    required int? doctorId,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await post(
          "${HttpHelper.baseUrl}${HttpHelper.removefavoriteDoctor}", {
        'doctor_id': doctorId,
      },
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${storage.read('token')}',
          });
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        Dialogs.successDialog(
            Get.context!, 'removed_from_favorite_doctor_success'.tr);
      }

      if (data['code'] == 0) {
        Dialogs.errorDialog(Get.context!, 'error'.tr);
      }

      if (data['code'] == 2) {
        EasyLoading.show(status: 'loading'.tr);
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
      }
      if (statusCode == 500) {
        Dialogs.errorDialog(Get.context!, "please_login_to_add_to_favorite".tr);
      }
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
