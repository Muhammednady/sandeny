
import 'package:get/get.dart';
import 'package:sandeny/app/modules/chat/controllers/chat_controller.dart';

class ConnectWithDoctorController extends GetxController {
  ConnectWithDoctorController get instance =>
      Get.put(ConnectWithDoctorController());
  final doctorId = Get.arguments;
  
  var chatController = Get.put(ChatController());
  


}
