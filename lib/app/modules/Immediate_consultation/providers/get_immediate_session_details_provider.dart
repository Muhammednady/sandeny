import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/get_instant_session_details_model.dart';

class GetImmediateConsultationDetails extends GetConnect {
  static GetImmediateConsultationDetails get instance => Get.find();

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

  Future<GetInstantSessionDetails> getImmediateConsultationDetails(
      {required int doctorId, int? slotId, List? typeIds}) async {
    try {
      final response = await post(
        "${HttpHelper.baseUrl}${HttpHelper.getImmediateConsultationDetails}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
        {
          'doctor_id': doctorId.toString(),
          'slot_id': slotId.toString(),
          'type_ids': typeIds,
        },
      );

      var data = response.body;
      log('this is the list of data: $data');
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        Get.toNamed(Routes.IMMEDIATE_CONSULTATION_DETAILS);
        return GetInstantSessionDetails.fromJson(data);
      }
      if (data['code'] == 0) {
        EasyLoading.dismiss();
      }
      if (data['code'] == 2) {
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
      }
      return GetInstantSessionDetails.fromJson(data);
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
