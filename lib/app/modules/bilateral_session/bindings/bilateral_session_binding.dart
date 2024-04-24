import 'package:get/get.dart';

import '../controllers/bilateral_session_controller.dart';

class BilateralSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BilateralSessionController>(
      () => BilateralSessionController(),
    );
  }
}
