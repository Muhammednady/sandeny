import 'package:get/get.dart';
import 'package:sandeny/app/modules/connect_with_doctor/controllers/connect_with_doctor_controller.dart';


class ConnectWithDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectWithDoctorController>(
      () => ConnectWithDoctorController(),
    );
  }
}
