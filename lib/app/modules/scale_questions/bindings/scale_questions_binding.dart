import 'package:get/get.dart';

import '../controllers/scale_questions_controller.dart';

class ScaleQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScaleQuestionsController>(
      () => ScaleQuestionsController(),
    );
  }
}
