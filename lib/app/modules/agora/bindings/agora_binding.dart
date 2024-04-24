import 'package:get/get.dart';

import '../controllers/video_call_controller.dart';

class AgoraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoCallController>(
      () => VideoCallController(),
    );
  }
}