import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';

class SendMedicalAnswers extends GetConnect {
  static SendMedicalAnswers get instance => SendMedicalAnswers.instance;
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

  Future<void> sendMedicalAnswers({
    required List answer,
    required int questionId,
    required String otherAnswer,
    required String otherAnswer2,
    required int questionId2,
    required List answer2,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await post(
      "${HttpHelper.baseUrl}${HttpHelper.postMedicalAnswers}",
      headers: {
        "authorization": "Bearer ${storage.read('token')}",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      {
        "questions": [
          {
            "id": questionId,
            "answer": answer,
            "other_answer": otherAnswer,
          },
          {
            "id": questionId2,
            "answer": answer2,
            "other_answer": otherAnswer2,
          }
        ]
      },
    );
    var statusCode = response.statusCode;
    var data = response.body;
    log('this is the data: $data');
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Get.toNamed(Routes.COMPLETE_ACCOUNT_INFORMATION2);
    }

    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }

    if (data['code'] == 2) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
  }
}
