import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../models/get_scheduled_session_details_model.dart';

class GetScheduledSessionDetailsProvider extends GetConnect {
  static GetScheduledSessionDetailsProvider get instance => Get.find();

  Timer? timer;
  @override
  void onInit() {
    EasyLoading.addStatusCallback(
      (status) {
        if (status == EasyLoadingStatus.dismiss) {
          timer?.cancel();
        }
      },
    );
  }

  Future<GetScheduledSessionDetailsModel> getSSDetails(
      {int? appointmentId}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      log('this is the appointmentId: $appointmentId');
      final response = await post(
        "${HttpHelper.baseUrl}${HttpHelper.getScheduledSessionDetails}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
        {
          "appointment_id": appointmentId.toString(),
        },
      );

      final request = response.request;
      log('this is the request: ${request!.url}');

      var data = response.body;
      log('this is the Scheduled Session Details data: $data');
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');

      if (statusCode == 401) {
        userNotRegisteredWidget(Get.context!);
      }

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        return GetScheduledSessionDetailsModel.fromJson(data);
      }
      if (data['code'] == 0) {
        EasyLoading.dismiss();
      }
      if (data['code'] == 2) {
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
      }
      return GetScheduledSessionDetailsModel.fromJson(data);
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
