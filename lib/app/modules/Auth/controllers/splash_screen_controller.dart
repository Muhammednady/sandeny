import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:sandeny/app/modules/Auth/views/auth_view.dart';
import 'package:sandeny/app/modules/home/views/home_view.dart';
import 'package:sandeny/app/modules/welcome_screen/views/welcome_screen_view.dart';

class SplachScreenController extends GetxController {
  static SplachScreenController get instance =>
      Get.put(SplachScreenController());

  void navigateToNextScreen() async {
    bool firstRun = await IsFirstRun.isFirstRun();

    if (firstRun == true) {
      Get.offAll(() => const WelcomeScreenView());
    } else {
      Get.offAll(() => const AuthView(), arguments: 0);
    }
  }

  @override
  void onInit() {
    navigateToNextScreen();
    super.onInit();
  }
}
