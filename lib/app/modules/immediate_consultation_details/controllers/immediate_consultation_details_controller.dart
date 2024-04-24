import 'package:get/get.dart';
import '../../Immediate_consultation/models/get_instant_session_details_model.dart';

class ImmediateConsultationDetailsController extends GetxController {
  GetInstantSessionDetails immediateData = GetInstantSessionDetails();

  set setICD(GetInstantSessionDetails data) {
    immediateData = data;
    update();
  }

  GetInstantSessionDetails get getICD => immediateData;

}
