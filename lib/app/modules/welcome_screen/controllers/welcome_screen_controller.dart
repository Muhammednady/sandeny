import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {
  static WelcomeScreenController get instance =>
      Get.put(WelcomeScreenController());

  final count = 0.obs;



  void increment() => count.value++;
}
