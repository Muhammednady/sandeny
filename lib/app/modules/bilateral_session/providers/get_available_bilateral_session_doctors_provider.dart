import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../models/get_available_bilateral_session_doctors_model.dart';
import '../views/get_bilateral_session_doctors_view.dart';

class GetAvailableBSDoctorProvider extends GetConnect {
  static GetAvailableBSDoctorProvider get instance => Get.find();

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

  Future<List<BilateralSessionDoctors>> getAvailabeDoctors({
    required int specializationTypeId,
  }) async {
    try {
      final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.getAvailableInstantDoctor}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
        query: {
          'specialization_type_id': specializationTypeId.toString(),
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
        final doctorsList = data['data'] as List;
        Get.to(() => const GetAvailableBSDoctorView());
        return doctorsList
            .map((e) => BilateralSessionDoctors.fromJson(e))
            .toList();
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
      return Future.error(e.toString());
    }
  }
}
