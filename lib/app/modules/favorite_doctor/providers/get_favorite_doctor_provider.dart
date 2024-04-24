import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../../network/controllers/network_controller.dart';
import '../models/get_favorite_doctor_model.dart';

class GetFavoriteDoctorProvider extends GetConnect {
  static GetFavoriteDoctorProvider get instance => GetFavoriteDoctorProvider();
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

  Future<GetFavoriteDoctor> getFavoriteDoctors() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
        "${HttpHelper.baseUrl}${HttpHelper.getFavoriteDoctors}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${storage.read('token')}',
        });

    var data = response.body;
    log('this is the list of data: $data');
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      return GetFavoriteDoctor.fromJson(data);
    }

    if (data['code'] == 0) {
      EasyLoading.dismiss();
      if (data['error']['details'] == "Unauthenticated.") {
        userNotRegisteredWidget(Get.context!);
      }
    }

    if (data['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return GetFavoriteDoctor.fromJson(data);
  }
}
