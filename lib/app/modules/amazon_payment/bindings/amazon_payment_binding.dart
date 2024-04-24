import 'package:get/get.dart';

import '../controllers/amazon_pay_controller.dart';


class AmazonPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AmazonPayController>(
      () => AmazonPayController(),
    );
  }
}
