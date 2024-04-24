import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../../network/controllers/network_controller.dart';
import '../models/get_tabby_model.dart';

class PayWithTabbyProvider extends GetConnect {
  static PayWithTabbyProvider get instance => PayWithTabbyProvider.instance;
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


  // Pay with Tabby and StcPay
  Future<PayWithTabbyModel> payWithTabby({
    required String appointmentId,
    required String type,
    required String urlType,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.amazonPay}",
      headers: {
        "authorization": "Bearer ${storage.read('token')}",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      query: {
        "appointment_id": appointmentId,
        "type": type,
        "url_type": urlType
      },
    );

    var statusCode = response.statusCode;
    var data = response.body;
    log('this is the signature data: $data');
    log('this is the status code: $statusCode');

    if(statusCode == 401){
      userNotRegisteredWidget(Get.context!);
    }

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      return PayWithTabbyModel.fromJson(data);
    }

    if (data['code'] == 2) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return PayWithTabbyModel.fromJson(data);
  }
}