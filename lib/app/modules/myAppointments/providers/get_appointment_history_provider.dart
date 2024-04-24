import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../models/get_my_appointment_history_model.dart';

class GetMyAppointmentsHistoryProvider extends GetConnect {
  static GetMyAppointmentsHistoryProvider get instance => Get.find();

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

  Future<List<AppointmentHistoryData>> getAppointmentHistory(
    int appointmentId,
    int pageNumber,
  ) async {
    try {
      final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.myAppointmentHistory}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
        query: {
          'status': appointmentId.toString(),
          'page': pageNumber.toString(),
        },
      );

      var data = response.body;
      log('this is the list of appointment history data: $data');
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');

      if (statusCode == 401) {
        userNotRegisteredWidget(Get.context!);
      }

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        final appointmentList = data['data'] as List;
        return appointmentList
            .map((e) => AppointmentHistoryData.fromJson(e))
            .toList();
      }
      if (data['code'] == 0) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, 'error_message'.tr);
      }
      if (data['code'] == 2) {
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
    return [];
  }
}
