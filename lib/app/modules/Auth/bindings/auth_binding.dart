import 'package:get/get.dart';
import 'package:sandeny/app/modules/Auth/controllers/login_controller.dart';
import 'package:sandeny/app/modules/Auth/controllers/otp_controller.dart';
import 'package:sandeny/app/modules/Auth/controllers/register_controller.dart';
import 'package:sandeny/app/modules/Auth/controllers/resetpassword_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetpasswordController>(
      () => ResetpasswordController(),
    );
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
