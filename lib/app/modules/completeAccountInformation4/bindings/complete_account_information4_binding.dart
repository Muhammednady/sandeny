import 'package:get/get.dart';

import '../controllers/complete_account_information4_controller.dart';

class CompleteAccountInformation4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteAccountInformation4Controller>(
      () => CompleteAccountInformation4Controller(),
    );
  }
}
