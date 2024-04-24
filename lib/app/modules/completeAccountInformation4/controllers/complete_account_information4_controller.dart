import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../completeAccountInformation/controllers/complete_account_information_controller.dart';
import '../../completeAccountInformation2/controllers/complete_account_information2_controller.dart';
import '../../completeAccountInformation3/controllers/complete_account_information3_controller.dart';
import '../../network/controllers/network_controller.dart';
import '../providers/complete_account_provider.dart';

class CompleteAccountInformation4Controller extends GetxController {
  CompleteAccountInformation4Controller get instance =>
      Get.put(CompleteAccountInformation4Controller());

  var provider = Get.put(CompleteAccountProvider());

  var storage = GetStorage();

  TextEditingController otherDetailsController = TextEditingController();
  TextEditingController otherDetailsController2 = TextEditingController();

  var networkController = NetworkController.instance;
  // controllers for complete account pages
  var caiController1 = CompleteAccountInformationController.instance;
  var caiController2 = CompleteAccountInformation2Controller.instance;
  var caiController3 = CompleteAccountInformation3Controller.instance;

  RxString selectedValue = 'nothing'.tr.obs;
  RxBool isSelected = false.obs;
  RxBool isSelected2 = false.obs;
  RxBool isSelected3 = false.obs;
  RxBool isSelected4 = false.obs;
  List<dynamic> habits = [];
  String habitsDetails = '';
  RxInt diseases = 0.obs;
  String diseasesDetails = '';
  RxList<String> listOfHabits = [
    'smoking'.tr,
    'drinking'.tr,
    'take_drugs'.tr,
    'nothing'.tr,
  ].obs;

  RxString selectedValue2 = 'yes'.tr.obs;
  RxList<String> listOfAnswers = [
    'yes'.tr,
    'no'.tr,
  ].obs;
  RxInt selectedIndex = 3.obs;

  void selectQuestionIndex(int value) {
    selectedIndex.value = value;
    selectedValue.value = listOfHabits[value];
    update();
  }

  RxInt selectedIndex2 = 1.obs;
  void selectQuestion2Index(int value) {
    selectedIndex2.value = value;
    selectedValue2.value = listOfAnswers[value];
    update();
  }

  void selectHabits(String value) {
    if (habits.contains(value)) {
      habits.remove(value);
    } else {
      habits.add(value);
      storage.write('habits', json.encode(habits));
      log("this is the habits: ${json.decode(storage.read('habits'))}");
    }

    update();
  }

  Future completeAccountInformation() async {
    return await provider.completeAccount(
      // controller 1
      email: caiController1.email,
      weight: int.parse(caiController1.weight),
      height: int.parse(caiController1.height),
      birthDate: caiController1.birthDate,
      gender: caiController1.gender,
      materialStatus: caiController1.maritalStatus.value,
      familyMemberPhone: caiController1.familyPhoneNumber,
      // controller 2
      psychiatrist: caiController2.psychiatrist,
      psychiatristDescription: caiController2.psychiatristDescription,
      disability: caiController2.disability,
      disabilityDescription: caiController2.disabilityDescription,
      healthProblem: caiController3.healthProblem,
      healthProblemDescription: caiController3.healthProblemDescription,
      medication: caiController3.medication,
      medicationDescription: caiController3.medicationDescription,
      habits: json.decode(storage.read('habits')),
      diseases: diseases.value,
      diseasesOtherDetails: habitsDetails,
      habitsOtherDetails: diseasesDetails,
      otherPhone: caiController1.otherPhoneNumber,
    );
  }

  void checkCompleteProfile() {
    EasyLoading.show(status: 'loading'.tr);
    completeAccountInformation();
    EasyLoading.dismiss();
    update();
  }
}
