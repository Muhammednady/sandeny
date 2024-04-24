import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../connect_with_doctor/views/connect_with_doctor_view.dart';
import '../../network/controllers/network_controller.dart';

class AddAppointmentReasonProvider extends GetConnect {
  static AddAppointmentReasonProvider get instance =>
      Get.put(AddAppointmentReasonProvider());

  final NetworkController networkController = NetworkController.instance;
  final GetStorage storage = GetStorage();
  Timer? timer;

  @override
  void onInit() {
    httpClient.baseUrl = HttpHelper.baseUrl;
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
  }

  Future<void> addAppointmentReason({
    required int appointmentId,
    required String reason,
    required List<File> files,
  }) async {
    log('this is the list of files: $files');
    await Future.delayed(const Duration(seconds: 1));

    const url = HttpHelper.baseUrl + HttpHelper.addAppointmentReason;
    final headers = {
      "authorization": "Bearer ${storage.read('token')}",
    };

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);

    request.fields['appointment_id'] = appointmentId.toString();
    request.fields['reason'] = reason;

    await Future.forEach(
      files,
      (file) async => {
        request.files.add(
          http.MultipartFile(
            'files[]',
            (http.ByteStream(file.openRead())).cast(),
            await file.length(),
            filename: basename(file.path),
          ),
        )
      },
    );

    final response = await request.send();

    // Handle the response
    final responseData = await response.stream.toBytes();
    final responseString = String.fromCharCodes(responseData);
    final data = json.decode(responseString);
    final statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log(data.toString());
    // print the request here
    log(request.toString());

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Dialogs.successDialog(
        Get.context!,
        'send_problem_details_sucssesfully'.tr,
      );
      Get.to(const ConnectWithDoctorView());
    } else if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
  }
}
