import 'package:get/get.dart';

import '../controllers/immediate_consultation_details_controller.dart';

class ImmediateConsultationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImmediateConsultationDetailsController>(
      () => ImmediateConsultationDetailsController(),
    );
  }
}
