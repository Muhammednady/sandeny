import 'package:get/get.dart';

import '../../scales/controllers/scales_controller.dart';

class ScaleResultsController extends GetxController {
  static ScaleResultsController get instance => Get.find();

  var scaleController = Get.put(ScalesController());

  final count = 0.obs;
  @override
  void onInit() {
    scaleController.getScales();
    super.onInit();
  }



  void increment() => count.value++;
}
