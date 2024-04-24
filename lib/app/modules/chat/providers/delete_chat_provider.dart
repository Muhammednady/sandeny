import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../models/chat_model.dart';

class DeleteChatProvider extends GetConnect {
  static DeleteChatProvider get instance => Get.find();

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

  Future<ChatModel> deleteMessages({
    required String userId,
  }) async {
    log('this is the userId: $userId');
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.deleteChat}",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
      query: {
        'subUser_id': userId,
      },
    );

    var data = response.body;
    log('this is the list of data: $data');
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Get.back();
      Dialogs.successDialog(Get.context!, 'delete_chat_sucssesfully'.tr);
      return ChatModel.fromJson(data);
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'delete_chat_failed'.tr);
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return ChatModel.fromJson(data);
  }
}
