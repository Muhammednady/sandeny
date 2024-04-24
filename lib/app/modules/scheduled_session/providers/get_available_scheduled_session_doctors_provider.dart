import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../models/get_available_scheduled_session_doctors.dart';

class GetAvailableSSDoctorProvider extends GetConnect {
  static GetAvailableSSDoctorProvider get instance => Get.find();
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

  Future<List<ScheduledSessionDoctors>> getAvailabeDoctors({
    required int departmentId,
    required int specializationTypeId,
    required int priceRange,
    required int gender,
    required int yearsOfExperiences,
    required int languageId,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.getAvailableScheduledSessionDoctor}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
      );

      var data = response.body;
      log('this is the list of data: $data');
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');

      if (statusCode == 401) {
        userNotRegisteredWidget(Get.context!);
      }

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        final doctorsList = data['data']['doctors'] as List;
        return doctorsList
            .map((e) => ScheduledSessionDoctors.fromJson(e))
            .toList();
      }
      if (data['code'] == 0) {
        if (data['data']['gender'] != null) {
          Dialogs.errorDialog(Get.context!, 'gender_invalid'.tr);
        } else if (data['data']['department_id'] != null) {
          Dialogs.errorDialog(Get.context!, 'departmentId_invalid'.tr);
        } else if (data['data']['specialization_type_id'] != null) {
          Dialogs.errorDialog(Get.context!, 'specializationTypeId_invalid'.tr);
        } else if (data['data']['price_range'] != null) {
          Dialogs.errorDialog(Get.context!, 'priceRange_invalid'.tr);
        } else if (data['data']['year_experiences'] != null) {
          Dialogs.errorDialog(Get.context!, 'year_experiences_invalid'.tr);
        } else if (data['data']['language_id'] != null) {
          Dialogs.errorDialog(Get.context!, 'language_id_invalid'.tr);
        } else {
          Dialogs.errorDialog(Get.context!, 'error_message'.tr);
        }
      }
      if (data['code'] == 2) {
        Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
      }
      return [];
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
