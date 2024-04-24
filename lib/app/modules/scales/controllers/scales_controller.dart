import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/scale_details_model.dart';
import '../models/scale_model.dart';
import '../providers/scale_details_provider.dart';
import '../providers/scale_provider.dart';
import '../views/scales_description_view.dart';

class ScalesController extends GetxController {
  static ScalesController get instance => Get.find();
  var scaleProvider = ScaleProvider();
  var scalesDetailsProvider = ScaleDetailsProvider();

  RxList<ScaleData> scalesList = <ScaleData>[].obs;
  RxList<ScaleDetailsModel> scalesDetailsList = <ScaleDetailsModel>[].obs;
  var isLoading = false.obs;

  ScaleDetailsData scaleDetails = ScaleDetailsData();

  set setScale(ScaleDetailsData scale) {
    scaleDetails = scale;
    update();
  }

  ScaleDetailsData get getScale => scaleDetails;

  getScales() async {
    isLoading.value = true;
    try {
      var data = await scaleProvider.getScales();
      scalesList.addAll(data);
      log(scalesList.length.toString());
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      log('$e');
    }
    update();
  }

  getScaleDetails(int scaleId) async {
    try {
      EasyLoading.show(status: 'loading'.tr);
      await scalesDetailsProvider.getScaleDetails(scaleId).then((value) {
        scaleDetails = value;
        Get.to(const ScalesDescriptionView());
        EasyLoading.dismiss();
      });
      update();
    } catch (e) {
      log('$e');
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getScales();
  }
}
