import 'package:get/get.dart';

import '../controllers/immediate_consultation_controller.dart';

class ImmediateConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImmediateConsultationController>(
      () => ImmediateConsultationController(),
    );
  }
}
