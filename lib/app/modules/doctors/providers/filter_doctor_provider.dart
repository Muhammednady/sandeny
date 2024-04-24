import 'dart:async';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';
import '../models/filter_model_model.dart';

class FilterModelProvider extends GetConnect {
  static FilterModelProvider get instance => FilterModelProvider.instance;
  GetStorage storage = GetStorage();
  var networkController = NetworkController.instance;
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

  Future<FilterModel> filterDoctor(
    int consultationPrice,
    int yearsOfExperience,
    int gender,
    double ratingPercentage,
    int specializationId,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await get(
      "${HttpHelper.baseUrl}${HttpHelper.filterDoctor}",
      query: {
        'consultation_price': consultationPrice.toString(),
        'year_exp': yearsOfExperience.toString(),
        'gender': gender.toString(),
        'rating_percentage': ratingPercentage.toString(),
        'specialization_id': specializationId.toString(),
      },
    );
    log(response.request.toString());
    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log('this is the list of data: $data');

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      return FilterModel.fromJson(data);
    }

    if (data['code'] == 0) {
      Dialogs.errorDialog(Get.context!, 'data_error'.tr);
    }
    return FilterModel.fromJson(data);
  }
}
