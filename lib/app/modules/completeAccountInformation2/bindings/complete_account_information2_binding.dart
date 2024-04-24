import 'package:get/get.dart';

import '../controllers/complete_account_information2_controller.dart';

class CompleteAccountInformation2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteAccountInformation2Controller>(
      () => CompleteAccountInformation2Controller(),
    );
  }
}
