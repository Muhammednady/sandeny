import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/add_appointment_reason_provider.dart';

class ProblemDetailsController extends GetxController {
  static ProblemDetailsController get instance =>
      Get.put(ProblemDetailsController());

  var appointmentReasonProvider = AddAppointmentReasonProvider();
  var storage = GetStorage();
  FilePickerResult? result;
  RxString fileName = ''.obs;
  bool isLoading = false;
  List<PlatformFile> pickedFiles = [];
  List<File> filesToDisplay = [];
  String problem = '';

  void selectFiles() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      pickedFiles = result!.files;
      filesToDisplay = pickedFiles.map((file) => File(file.path!)).toList();
      log('filesToDisplay: $filesToDisplay');
    }
    update();
  }

  addProblemReason() {
    appointmentReasonProvider.addAppointmentReason(
      appointmentId: storage.read('appointmentId'),
      reason: problem,
      files: filesToDisplay,
    );
  }
}
