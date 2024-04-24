import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/get_doctors_model.dart';
import '../models/specialization_model.dart';

class SpecializationsProvider extends GetConnect {
  static SpecializationsProvider get instance => Get.find();

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

  Future<List<SpecificationData>> getSpecialization() async {
    try {      final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.specialization}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      var data = response.body;
      log('this is the list of data: $data');
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        final splist = data['data'] as List;
        return splist.map((e) => SpecificationData.fromJson(e)).toList();
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

  Future<List<ResultData>> getDoctorsBySPId(
    int specializationId,
  ) async {
    try {
      final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.getDoctor}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        query: {
          'specifications': specializationId.toString(),
        },
      );

      var data = response.body;
      log('this is the list of data: $data');
      var statusCode = response.statusCode;
      log('this is the status code: $statusCode');

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        final doctorsList = data['data'] as List;
        return doctorsList.map((e) => ResultData.fromJson(e)).toList();
      }
      if (data['code'] == 0) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, 'error_message'.tr);
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
      timeout = const Duration(seconds: 1);
      return Future.error(e.toString());
    }
  }
}
