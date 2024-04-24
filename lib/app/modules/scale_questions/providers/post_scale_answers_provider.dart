import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../../network/controllers/network_controller.dart';
import '../models/scale_results_model.dart';

class SendScaleAnswers extends GetConnect {
  static SendScaleAnswers get instance => SendScaleAnswers.instance;
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

  Future<ScaleResultData> postQuestions(Map body) async {
    const url = '${HttpHelper.baseUrl}${HttpHelper.addScale}';
    final headers = {
      "authorization": "Bearer ${storage.read('token')}",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    final response = await post(url, body, headers: headers);
    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the data: $data');
    log('this is the response: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Get.toNamed(Routes.SCALE_RESULTS);
      return ScaleResultData.fromJson(data['data']);
    }

    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_duplicated_scale'.tr);
    }

    if (data['code'] == 2) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }

    if (statusCode == 401) {
      userNotRegisteredWidget(Get.context!);
    }

    return ScaleResultData.fromJson(data['data']);
  }
}
