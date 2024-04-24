import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CompleteAccountInformation3Controller extends GetxController {

  static CompleteAccountInformation3Controller get instance =>
      Get.put(CompleteAccountInformation3Controller());
  
  TextEditingController otherDetailsController = TextEditingController();
  TextEditingController otherDetailsController2 = TextEditingController();
  RxString selectedValue = 'yes'.tr.obs;
  int healthProblem = 0;
  int medication = 0;
  String healthProblemDescription = '';
  String medicationDescription = '';
  RxBool isSelected = false.obs;
  RxBool isSelected2 = false.obs;
  RxList<String> listOfAnswers = [
    'yes'.tr,
    'no'.tr,
  ].obs;

  RxInt selectedIndex = 0.obs;
  void selectQuestionIndex(int value) {
    selectedIndex.value = value;
    selectedValue.value = listOfAnswers[value];
    update();
  }

  RxInt selectedIndex2 = 0.obs;
  void selectQuestion2Index(int value) {
    selectedIndex2.value = value;
    selectedValue.value = listOfAnswers[value];
    update();
  }

  final count = 0.obs;



  void increment() => count.value++;
}
