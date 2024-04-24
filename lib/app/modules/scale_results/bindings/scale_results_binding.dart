import 'package:get/get.dart';

import '../controllers/scale_results_controller.dart';

class ScaleResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScaleResultsController>(
      () => ScaleResultsController(),
    );
  }
}
