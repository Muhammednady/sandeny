import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';

class DoctorRatingProvider extends GetConnect {
  static DoctorRatingProvider get instance => Get.put(DoctorRatingProvider());
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

  Future<void> addRating({
    required int doctorId,
    required String comment,
    required int rate,
  }) async {
    try {
      final response = await post(
        HttpHelper.addRate,
        {
          'doctor_id': doctorId,
          'comment': comment,
          'rate': rate,
        },
        headers: {
          'Authorization': "Bearer ${storage.read('token')}",
        },
      );
      var data = response.body;
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        Get.back();
        Dialogs.successDialog(Get.context!, 'rating_added_success'.tr);
      }

      if (data['code'] == 0) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, "error_occured".tr);
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
      timeout = const Duration(seconds: 1);
      return Future.error(e.toString());
    }
  }
}
