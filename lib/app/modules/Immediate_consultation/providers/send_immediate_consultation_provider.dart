import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../../network/controllers/network_controller.dart';
import '../models/send_immediate_consultation.dart';

class SendImmediateConsultationProvider extends GetConnect {
  static SendImmediateConsultationProvider get instance =>
      SendImmediateConsultationProvider.instance;
  var networkController = NetworkController.instance;
  GetStorage storage = GetStorage();
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

  Future<SendImmediateConsultation> sendImmediateConsultation({
    required int consultationType,
    required int doctorId,
    required int slotId,
    required int departmentId,
    required int rate,
    required List feelings,
    required String couponCode,
  }) async {
    final Map<String, dynamic> requestBody = {
      "type_id": consultationType,
      "doctor_id": doctorId,
      "slot_id": slotId,
      "department_id": departmentId,
      "rate": rate,
      "feelings": feelings,
    };

    if (couponCode.isNotEmpty) {
      requestBody["coupon_code"] = couponCode;
    }

    try {
      final response = await post(
        "${HttpHelper.baseUrl}${HttpHelper.sendInstantConsultation}",
        headers: {
          "authorization": "Bearer ${storage.read('token')}",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        requestBody,
      );

      var statusCode = response.statusCode;
      var data = response.body;
      log('this is the immediate data: $data');
      log('this is the status code: $statusCode');

      if (statusCode == 401) {
        userNotRegisteredWidget(Get.context!);
      }

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        storage.write('appointmentId', data['data']['appointment_id']);
        log('this is the appointment id: ${storage.read('appointmentId')}');
        return SendImmediateConsultation.fromJson(data);
      }

      if (data['data']['doctor_id'] != null) {
        Dialogs.errorDialog(
            Get.context!, 'please_select_specialization_type'.tr);
      }

      if (data['data']['department_id'] != null) {
        Dialogs.errorDialog(Get.context!, 'please_select_specialization'.tr);
      }

      if (data['data']['slot_id'] != null) {
        Dialogs.errorDialog(Get.context!, 'please_select_slot'.tr);
      }

      if (data['code'] == 2) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
      }
      return SendImmediateConsultation.fromJson(data);
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
