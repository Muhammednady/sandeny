import 'dart:developer';

import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../models/scale_answers_model.dart';
import '../models/scale_results_model.dart';
import '../providers/post_scale_answers_provider.dart';

class ScaleQuestionsController extends GetxController {
  static ScaleQuestionsController get instance => Get.find();

  var selectedAnswers = <ScaleAnswers>[];

  RxInt currentQuestionIndex = 0.obs;

  RxInt answerIndex = 0.obs;

  RxInt selectedAnswerId = 0.obs;

  RxList<ScaleResultData> scaleResultList = <ScaleResultData>[].obs;
  var isLoading = false.obs;

  ScaleResultData scaleResult = ScaleResultData();

  set setScaleResult(ScaleResultData scale) {
    scaleResult = scale;
    update();
  }

  ScaleResultData get getScaleResult {
    return scaleResult;
  }

  selectAnswerIndex(int index) {
    selectedAnswerId.value = index;
    log('$answerIndex');
    update();
  }

  final sendAnswerProvider = SendScaleAnswers();

  void selectAnswer(int answerId, int scaleId, int scaleQuestionId) {
    if (!selectedAnswers.any((answer) => answer.scaleAnswerId == answerId)) {
      selectedAnswers.add(ScaleAnswers(
          scaleAnswerId: answerId,
          scaleId: scaleId,
          scaleQuestionId: scaleQuestionId));
    }
    selectedAnswerId.value = answerId;
  }

  bool areAnswersSelected(List<ScaleAnswers> answers, int selectedAnswerId) {
    for (var answer in answers) {
      if (answer.scaleAnswerId == selectedAnswerId) {
        return true;
      }
    }
    return false;
  }

  void submitAnswers() async {
    final api = sendAnswerProvider;

    var questions = 0;
    var scaleId = 0;
    var answerId = 0;

    List<dynamic> requestBody = [];

    for (final answer in selectedAnswers) {
      questions = answer.scaleQuestionId;
      scaleId = answer.scaleId;
      answerId = answer.scaleAnswerId;

      log('this is the scaleId: $scaleId');
      log('this is the questionId: $questions');
      log('this is the answerId: $answerId');

      requestBody.add({
        "scale_id": scaleId,
        "scale_question_id": questions,
        "scale_answer_id": answerId
      });
    }

    Map body = {
      "questions": requestBody.map((e) => e).toList(),
    };

    log('this is the requestBody: $requestBody');

    try {
      await api.postQuestions(body).then((value) => setScaleResult = value);
    } catch (e) {
      log('$e');
    }
  }

  void increment() {
    currentQuestionIndex++;
    log('$currentQuestionIndex');
  }

  void decrement() {
    currentQuestionIndex--;
    log('$currentQuestionIndex');
  }

  final currentQuestion = 1.obs;

  final totalQuestions = 10.obs;

  void increaseQuestion() {
    if (currentQuestion.value < totalQuestions.value) {
      currentQuestion.value++;
    } else if (currentQuestion.value >= totalQuestions.value) {
      Get.toNamed(Routes.SCALE_RESULTS);
    }
    update();
  }

  void decreaseQuestion() {
    if (currentQuestion.value > 0) {
      currentQuestion.value--;
    }
    update();
  }

  RxBool loading = false.obs;



}

// import 'dart:developer';

// import 'package:get/get.dart';
// import 'package:sandeny/app/routes/app_pages.dart';

// import '../models/scale_answers_model.dart';
// import '../providers/post_scale_answers_provider.dart';

// class ScaleQuestionsController extends GetxController {
//   static ScaleQuestionsController get instance => Get.find();

//   var selectedAnswers = <ScaleAnswers>[];

//   RxInt currentQuestionIndex = 0.obs;

//   RxInt answerIndex = 0.obs;

//   RxInt selectedAnswerId = 0.obs;

//   selectAnswerIndex(int index) {
//     answerIndex.value = index;
//     log('$answerIndex');
//     update();
//   }

//   final sendAnswerProvider = SendScaleAnswers();

//   // void selectAnswer(int answerId, int scaleId, int scaleQuestionId) {
//   //   final currentQuestion = ScaleAnswers(
//   //     scaleId: scaleId,
//   //     scaleQuestionId: scaleQuestionId,
//   //     scaleAnswerId: answerId,
//   //   );

//   //   final newQuestion =
//   //       currentQuestion.withAnswerId(answerId, scaleId, scaleQuestionId);

//   //   if (selectedAnswers.contains(newQuestion)) {
//   //     selectedAnswers.remove(newQuestion);
//   //     log('############');
//   //   } else {
//   //     log('*************');
//   //     selectedAnswers.add(newQuestion);
//   //   }

//   //   log('this is the selectedAnswers: $newQuestion');
//   // }
//   void selectAnswer(int answerId, int scaleId, int scaleQuestionId) {
//   if (!selectedAnswers.any((answer) => answer.scaleAnswerId == answerId)) {
//     selectedAnswers.add(ScaleAnswers(scaleAnswerId: answerId, scaleId: scaleId, scaleQuestionId: scaleQuestionId));
//   }
//   selectedAnswerId.value = answerId;
// }

//   bool areAnswersSelected(List<ScaleAnswers> answers, int selectedAnswerId) {
//   for (var answer in answers) {
//     if (answer.scaleAnswerId == selectedAnswerId) {
//       return true;
//     }
//   }
//   return false;
// }


//   void submitAnswers() {
//     final api = sendAnswerProvider;

//     var questions = 0;
//     var scaleId = 0;
//     var answerId = 0;

//     List<dynamic> requestBody = [];

//     for (final answer in selectedAnswers) {
//       questions = answer.scaleQuestionId;
//       scaleId = answer.scaleId;
//       answerId = answer.scaleAnswerId;

//       log('this is the scaleId: $scaleId');
//       log('this is the questionId: $questions');
//       log('this is the answerId: $answerId');

//       requestBody.add({
//         "scale_id": scaleId,
//         "scale_question_id": questions,
//         "scale_answer_id": answerId
//       });
//     }

//     Map body = {
//       "questions": requestBody.map((e) => e).toList(),
//     };

//     log('this is the requestBody: $requestBody');
//     api.postQuestions(body);
//   }

//   void increment() {
//     currentQuestionIndex++;
//     log('$currentQuestionIndex');
//   }

//   void decrement() {
//     currentQuestionIndex--;
//     log('$currentQuestionIndex');
//   }

//   final currentQuestion = 1.obs;

//   final totalQuestions = 10.obs;

//   void increaseQuestion() {
//     if (currentQuestion.value < totalQuestions.value) {
//       currentQuestion.value++;
//     } else if (currentQuestion.value >= totalQuestions.value) {
//       Get.toNamed(Routes.SCALE_RESULTS);
//     }
//     update();
//   }

//   void decreaseQuestion() {
//     if (currentQuestion.value > 0) {
//       currentQuestion.value--;
//     }
//     update();
//   }

//   RxBool answer1 = true.obs;
//   void changeAnswer1(bool value) {
//     // answer1.value = !answer1.value;
//     answer1.value = value;
//     update();
//   }

//   // for second answer selected
//   RxBool answer2 = true.obs;
//   void changeAnswer2() {
//     answer2.value = !answer2.value;
//     update();
//   }

//   // for third answer selected
//   RxBool answer3 = true.obs;
//   void changeAnswer3() {
//     answer3.value = !answer3.value;
//     update();
//   }

//   RxBool answer4 = true.obs;
//   void changeAnswer4() {
//     answer4.value = !answer4.value;
//     update();
//   }

//   void setTotalQuestions(int total) => totalQuestions.value = total;
//   RxBool loading = false.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }
// }
