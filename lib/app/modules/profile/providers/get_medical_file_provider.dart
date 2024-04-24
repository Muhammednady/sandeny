import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../../network/controllers/network_controller.dart';
import '../models/get_medical_file_model.dart';

class GetMedicalFileProvider extends GetConnect {
  var networkController = NetworkController.instance;
  GetStorage storage = GetStorage();
  Timer? timer;
  @override
  void onInit() {
    httpClient.baseUrl = HttpHelper.baseUrl;
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
  }

  Future<List<MedicalQuestionData>> getMedicalFileAnswers() async {
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.getMedicalAnswers}",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${storage.read('token')}',
      },
    );

    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the answers list data : ${data.toString()}');
    log('this is the status code: $statusCode');
    if (statusCode == 200) {
      final mQlist = data['data'] as List;
      return mQlist.map((e) => MedicalQuestionData.fromJson(e)).toList();
    }

    if (statusCode == 401) {
      userNotRegisteredWidget(Get.context!);
    }

    if (statusCode == 400) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }

    if (statusCode == 500) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return [];
  }
}
