import 'package:get/get.dart';

import '../controllers/favorite_doctor_controller.dart';

class FavoriteDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteDoctorController>(
      () => FavoriteDoctorController(),
    );
  }
}
