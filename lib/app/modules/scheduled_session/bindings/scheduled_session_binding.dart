import 'package:get/get.dart';

import '../controllers/scheduled_session_controller.dart';

class ScheduledSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduledSessionController>(
      () => ScheduledSessionController(),
    );
  }
}
