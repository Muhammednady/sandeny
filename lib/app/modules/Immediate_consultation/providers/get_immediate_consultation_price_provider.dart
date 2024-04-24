import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/get_immediate_consultation_price.dart';

class GetImmediateConsultationPriceProvider extends GetConnect {
  static GetImmediateConsultationPriceProvider get instance => Get.find();

  Timer? timer;
  @override
  void onInit() {
    httpClient.baseUrl = HttpHelper.baseUrl;
    EasyLoading.addStatusCallback(
      (status) {
        if (status == EasyLoadingStatus.dismiss) {
          timer?.cancel();
        }
      },
    );
  }

  Future<GetImmediateConsultationPrice> getImmediateConsultationPrice({
    required int periodId,
    required int specializationTypeId,
  }) async {
    try {
      final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.getImmediatePrice}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
        query: {
          'period_id': periodId.toString(),
          'specialization_type_id': specializationTypeId.toString(),
        },
      );

      var data = response.body;
      log('this is the list of data: $data');
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        return GetImmediateConsultationPrice.fromJson(data);
      }
      if (data['msg'] == 'no available appointment for now') {
        EasyLoading.dismiss();
        Dialogs.errorDialog(
            Get.context!, 'no_available_appointment_for_department'.tr);
      }
      if (data['code'] == 0) {
        EasyLoading.dismiss();
      }
      if (data['code'] == 2) {
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
      }
      return GetImmediateConsultationPrice.fromJson(data);
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
