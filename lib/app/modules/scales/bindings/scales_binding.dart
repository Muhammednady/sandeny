import 'package:get/get.dart';

import '../controllers/scales_controller.dart';

class ScalesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScalesController>(
      () => ScalesController(),
    );
  }
}
