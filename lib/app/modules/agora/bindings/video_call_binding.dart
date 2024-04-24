import 'package:get/get.dart';
import 'package:sandeny/app/modules/agora/controllers/agora_controller.dart';

class VideoCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgoraController>(
      () => AgoraController(),
    );
  }
}