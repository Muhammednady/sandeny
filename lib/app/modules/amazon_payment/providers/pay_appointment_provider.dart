import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';

class PayAppointmentProvider extends GetConnect {
  static PayAppointmentProvider get instance => PayAppointmentProvider.instance;
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

  Future<void> sendAppointmentPay({
    required String appointmentId,
    required String paymentOption,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.payAppointment}",
      headers: {
        "authorization": "Bearer ${storage.read('token')}",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      query: {
        "appointment_id": appointmentId,
        "payment_option": paymentOption,
      },
    );

    var statusCode = response.statusCode;
    var data = response.body;
    log('####################');
    log('this is the data: $data');
    log('this is the status code: $statusCode');

    // if (data['code'] == 1) {
    //   EasyLoading.dismiss();
    //   Get.offAllNamed(Routes.HOME);
    // }

    // if (data['code'] == 2) {
    //   EasyLoading.dismiss();
    //   Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    // }
  }
}
