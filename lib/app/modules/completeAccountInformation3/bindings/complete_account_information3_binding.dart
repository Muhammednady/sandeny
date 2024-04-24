import 'package:get/get.dart';

import '../controllers/complete_account_information3_controller.dart';

class CompleteAccountInformation3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteAccountInformation3Controller>(
      () => CompleteAccountInformation3Controller(),
    );
  }
}
