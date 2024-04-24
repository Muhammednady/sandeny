import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/get_medical_file_model.dart';
import '../models/profile_model_model.dart';
import '../providers/get_medical_file_provider.dart';
import '../providers/profile_model_provider.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.put(ProfileController());
  RxList profileList = <ProfileModel>[].obs;
  RxList medicalAnswersList = <MedicalQuestionData>[].obs;
  RxBool isLoading = false.obs;
  RxBool selectValue = false.obs;
  final provider = ProfileModelProvider();
  final medicalProvider = GetMedicalFileProvider();
  set selectProfileOrMedical(bool value) {
    selectValue.value = value;
    update();
  }

  bool get selectProfileOrMedical => selectValue.value;

  loadProfile() async {
    isLoading.value = true;
    final data = await provider.getProfileInfo().timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        EasyLoading.dismiss();
        isLoading.value = false;
        update();
      },
    );
    if (data != null) {
      profileList.add(data);
    }
    isLoading.value = false;
    EasyLoading.dismiss();

    update();
  }

  loadMedicalFile() async {
    isLoading.value = true;
    try {
      var data = await medicalProvider.getMedicalFileAnswers();
      medicalAnswersList.addAll(data);
      isLoading.value = false;
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      log('this is the error: $e');
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadProfile();
    loadMedicalFile();
  }
}
