import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';
import '../model/medical_file_question_model.dart';

class MedicalFileQustionsProvider extends GetConnect {
  static MedicalFileQustionsProvider get instance =>
      MedicalFileQustionsProvider.instance;
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

  Future<List<QuestionData>> getMedicalQuestions(
      {required int page}
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    log('this is the page: $page');
    final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.getMedicalQuestions}",
        headers: {
          "authorization": "Bearer ${storage.read('token')}",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        query: {
          "page": page.toString(),
        }
        );

    var statusCode = response.statusCode;
    var data = response.body;
    log('this is the status code: $statusCode');
    if (statusCode == 200) {
      final mQlist = data['data'] as List;
      return mQlist.map((e) => QuestionData.fromJson(e)).toList();
    }

    if (statusCode == 400) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }

    if (statusCode == 500) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return [];
  }

    Future<MedicalFileQuestionsModel> getAllQuestions(
      {required int page}
    ) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.getMedicalQuestions}",
        headers: {
          "authorization": "Bearer ${storage.read('token')}",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        query: {
          "page": page.toString(),
        }
        );

    var statusCode = response.statusCode;
    var data = response.body;
    log('this is the status code: $statusCode');
    log('this is the data: $data');
    if (statusCode == 200) {
      return MedicalFileQuestionsModel.fromJson(data);
    }

    if (statusCode == 400) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }

    if (statusCode == 500) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return MedicalFileQuestionsModel.fromJson(data);
  }
}
