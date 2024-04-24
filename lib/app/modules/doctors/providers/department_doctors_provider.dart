import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/constants/pagination.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';
import '../models/department_doctors_model.dart';

class DepartmentClinicsProvider extends GetConnect {
  var networkController = NetworkController.instance;
  static DepartmentClinicsProvider get istance => Get.find();
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

  Future<DepartmentDoctorsModel> getDepartmentDoctors(PaginationFilter filter,
      {required String id}) async {
        await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.departmentDoctors}$id",
      query: {
        "page": filter.page,
      }.map((key, value) => MapEntry(key, value.toString())),
    );

    if (response.body['code'] == 1) {
      return DepartmentDoctorsModel.fromJson(response.body);
    }

    if (response.body['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
    if (response.body['code'] == 2) {
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return DepartmentDoctorsModel.fromJson(response.body);
  }
}
