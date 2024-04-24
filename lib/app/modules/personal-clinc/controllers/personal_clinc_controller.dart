import 'dart:developer';

import 'package:get/get.dart';
import '../../home/models/best_doctors_model.dart';
import '../../home/providers/select_favorite_doctor_provider.dart';

class PersonalClincController extends GetxController {
  static PersonalClincController get instance =>
      Get.put(PersonalClincController());

  List<String> doctorList = [
    'dr_mohamed'.tr,
    'dr_mohamed'.tr,
    'dr_mohamed'.tr,
    'dr_mohamed'.tr,
    'dr_mohamed'.tr,
  ];
  List<String> doctorSpeciality = [
    'psychiatry'.tr,
    'psychiatry'.tr,
    'psychiatry'.tr,
    'psychiatry'.tr,
    'psychiatry'.tr,
  ];

  List<String> doctorRate = [
    '5/5',
    '5/5',
    '5/5',
    '5/5',
    '5/5',
  ];

  List<String> doctorDescription = [
    'dr_mohamed_description'.tr,
    'dr_mohamed_description'.tr,
    'dr_mohamed_description'.tr,
    'dr_mohamed_description'.tr,
    'dr_mohamed_description'.tr,
  ];

  RxBool selectValue = false.obs;

  set selectAboutDoctorOrRatings(bool value) {
    selectValue.value = value;
    log(selectValue.value.toString());
    update();
  }

  bool get selectAboutDoctorOrRatings => selectValue.value;

  RxBool isFavorite = false.obs;

  var favoriteDoctorProvider = SelectFavoriteDoctorProvider();

  RxList<BestDoctorData> bestDoctorsList = <BestDoctorData>[].obs;

  RxBool isLoading = false.obs;



}
