import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/completeAccountInformation2/model/medical_file_question_model.dart';

class CustomQuestion extends GetView<CustomQuestionController> {
  const CustomQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _question(context, controller.questionData[0])),
    );
  }

  _question(context, questionData) {
    switch (questionData.isMultiple) {
      case 0:
        return GetBuilder(
          init: controller,
          builder: (controller) {
            return _isNotMultiple(context, questionData);
          },
        );
      case 1:
        return GetBuilder(
          init: controller,
          builder: (controller) {
            return _isMultiple(context, questionData);
          },
        );
    }
  }

  Widget _isMultiple(context, questionData) {
    return Container();
  }

  Widget _isNotMultiple(context, QuestionData questionData) {
    return Container();
  }
}

class CustomQuestionController extends GetxController {
  List<QuestionData> questionData = [];
}
