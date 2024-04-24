import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../constants/dialogs.dart';
import '../model/medical_file_question_model.dart';
import '../provider/get_medical_questions_provider.dart';
import '../provider/send_medical_answers.dart';

class CompleteAccountInformation2Controller extends GetxController {
  static CompleteAccountInformation2Controller get instance =>
      Get.put(CompleteAccountInformation2Controller());

  TextEditingController otherDetailsController = TextEditingController();
  TextEditingController otherDetailsController2 = TextEditingController();

  int psychiatrist = 0;
  String psychiatristDescription = '';
  int disability = 0;
  String disabilityDescription = '';
  RxString selectedValue = 'yes'.tr.obs;
  RxBool isSelected = false.obs;
  RxBool isSelected2 = false.obs;
  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;
  String otherAnswer = '';
  String otherAnswer2 = '';
  RxInt pageNumber = 1.obs;

  void selectQuestionIndex(int value) {
    selectedIndex.value = value;
    update();
  }

  RxInt selectedIndex2 = 0.obs;
  void selectQuestion2Index(int value) {
    selectedIndex2.value = value;
    update();
  }

  var listOfAnswers = <int>[].obs;

  var listOfAnswers2 = <int>[].obs;

  final medicalQList = <QuestionData>[].obs;

  final questionsData = <MedicalFileQuestionsModel>[].obs;

  final provider = MedicalFileQustionsProvider();

  final sendAnswerProvider = SendMedicalAnswers();

  void increasePageNumber(int value) {
    pageNumber.value = value;
    pageNumber.value++;
    log("++++++++++increasePageNumber+++++++++++ = ${pageNumber.value}");
    update();
  }

  void decreasePageNumber(int value) {
    pageNumber.value = value;
    pageNumber.value--;
    log("++++++++++decreasePageNumber+++++++++++ = ${pageNumber.value}");
    update();
  }

  get getNumber {
    return pageNumber.value;
  }

  void selectAnswers(int value) {
    if (listOfAnswers2.contains(value)) {
      listOfAnswers2.remove(value);
    } else {
      listOfAnswers2.add(value);
    }
    log('$listOfAnswers2');
    update();
  }

  void selectMultipleAnswers(int value) {
    if (listOfAnswers.contains(value)) {
      listOfAnswers.remove(value);
    } else {
      listOfAnswers.add(value);
    }
    log('$listOfAnswers');
    update();
  }

  Future<void> getMedicalQuestions() async {
    medicalQList.clear();
    try {
      isLoading.value = true;
      var data = await provider.getMedicalQuestions(
        page: pageNumber.value,
      );

      medicalQList.addAll(data);
      isLoading.value = false;
      EasyLoading.dismiss();
    } catch (e) {
      isLoading.value = false;
      EasyLoading.dismiss();
      log(e.toString());
    }
  }

  Future<void> getAllQuestions() async {
    try {
      var data = await provider.getAllQuestions(
        page: pageNumber.value,
      );
      questionsData.clear();
      questionsData.add(data);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendMedicalAnswers() async {
    try {
      await sendAnswerProvider.sendMedicalAnswers(
        answer: listOfAnswers,
        questionId: medicalQList[0].id!,
        otherAnswer: otherAnswer,
        otherAnswer2: otherAnswer2,
        questionId2: medicalQList[1].id!,
        answer2: listOfAnswers2,
      );
      increasePageNumber(pageNumber.value);

      listOfAnswers.clear();
      listOfAnswers2.clear();
      if (questionsData[0].currentPage == questionsData[0].lastPage) {
        Dialogs.successDialog(Get.context!, 'sucsses_send_medical_file'.tr);
        Get.offAllNamed('/home');
      }
      getAllQuestions();
      getMedicalQuestions();
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
    }
  }

  goToPreviousPage() {
    decreasePageNumber(pageNumber.value);
    listOfAnswers.clear();
    listOfAnswers2.clear();
    getAllQuestions();
    getMedicalQuestions();
  }

  @override
  void onInit() {
    super.onInit();
    getMedicalQuestions();
    getAllQuestions();
    otherDetailsController = TextEditingController();
  }
}
