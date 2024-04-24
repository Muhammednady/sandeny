import 'package:get/get.dart';

import '../controllers/complete_account_information_controller.dart';

class CompleteAccountInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteAccountInformationController>(
      () => CompleteAccountInformationController(),
    );
  }
}
