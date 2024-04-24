import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../../network/controllers/network_controller.dart';
import '../models/profile_model_model.dart';

class ProfileModelProvider extends GetConnect {
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

  Future getProfileInfo() async {
    final response =
        await get("${HttpHelper.baseUrl}${HttpHelper.user}", headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${storage.read('token')}',
    });

    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log(data.toString());
    if (data['code'] == 1) {
      return ProfileModel.fromJson(data);
    }

    if (statusCode == 401) {
      userNotRegisteredWidget(Get.context!);
    }

    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }

    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return ProfileModel.fromJson(data);
  }
}
