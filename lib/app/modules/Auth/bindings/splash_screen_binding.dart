import 'package:get/get.dart';
import 'package:sandeny/app/modules/Auth/controllers/splash_screen_controller.dart';


class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplachScreenController>(
      () => SplachScreenController(),
    );
  }
}