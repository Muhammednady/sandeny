import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../bilateral_session/views/booking2_bilateral_session_view.dart';
import '../../scheduled_session/views/booking2_scheduled_session_view.dart';
import '../models/get_available_appointment_model.dart';

class GetAvailableAppointmentsProvider extends GetConnect {
  static GetAvailableAppointmentsProvider get instance => Get.find();

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

  Future<AvailableAppointmentModel> getAvailabeAppointments({
    required int doctorId,
    required int periodId,
    required String date,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.getAvailableAppointments}",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
      query: {
        'doctor_id': doctorId.toString(),
        'period_id': periodId.toString(),
        'date': date,
      },
    );

    var data = response.body;
    log('this is the list of data: $data');
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Get.to(const Booking2BilateralSessionView());
      return AvailableAppointmentModel.fromJson(data);
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return AvailableAppointmentModel.fromJson(data);
  }

  Future<AvailableAppointmentModel> getAvailabeScheduledAppointments({
    required int doctorId,
    required int periodId,
    required String date,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.getAvailableAppointments}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
        query: {
          'doctor_id': doctorId.toString(),
          'period_id': periodId.toString(),
          'date': date,
        });

    var data = response.body;
    log('this is the list of data: $data');
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Get.to(const Booking2ScheduledSessionView());
      return AvailableAppointmentModel.fromJson(data);
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return AvailableAppointmentModel.fromJson(data);
  }
}
