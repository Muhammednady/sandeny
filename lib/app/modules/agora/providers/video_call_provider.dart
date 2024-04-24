import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/agora/models/video_call_model.dart';
import 'package:sandeny/app/modules/agora/views/video_call_view.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';

class VideoCallProvider extends GetConnect {
  static VideoCallProvider get instance => Get.find();

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

  Future<GetVideoCallModel> getAvailabeAppointments({
    required int appointmentId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final response =
        await get("${HttpHelper.baseUrl}${HttpHelper.joinMeeting}", headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    }, query: {
      'appointment_id': appointmentId.toString(),
    });

    var data = response.body;
    log('this is the data: $data');
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Get.to(const VideoCallView());
      return GetVideoCallModel.fromJson(data);
    }

    if (data['code'] == 0) {
      Get.back();
      if (data['msg'] == 'meeting not exist') {
        Dialogs.errorDialog(Get.context!, 'meeting_not_exist'.tr);
      }
      EasyLoading.dismiss();
    }
    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return GetVideoCallModel.fromJson(data);
  }
}
