import 'package:get/get.dart';

import '../controllers/personal_clinc_controller.dart';

class SanednyClincBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalClincController>(
      () => PersonalClincController(),
    );
  }
}
