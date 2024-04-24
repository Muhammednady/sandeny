import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../../network/controllers/network_controller.dart';
import '../models/save_scheduled_session_model.dart';

class SendScheduledSessionProvider extends GetConnect {
  static SendScheduledSessionProvider get instance =>
      Get.put(SendScheduledSessionProvider());

  final NetworkController networkController = NetworkController.instance;
  final GetStorage storage = GetStorage();
  Timer? timer;

  @override
  void onInit() {
    httpClient.baseUrl = HttpHelper.baseUrl;
    EasyLoading.addStatusCallback(
      (status) {
        if (status == EasyLoadingStatus.dismiss) {
          timer?.cancel();
        }
      },
    );
  }

  Future<SaveScheduledSessionModel> sendScheduledSession({
    required int doctorId,
    required int specializationTypeId,
    required int departmentId,
    required int periodId,
    required String reason,
    required String date,
    required List feelings,
    required File file,
    required String startTime,
    required String endTime,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      const url = HttpHelper.baseUrl + HttpHelper.saveScheduled;
      final headers = {
        "authorization": "Bearer ${storage.read('token')}",
      };

      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields['doctor_id'] = doctorId.toString();
      request.fields['reason'] = reason;
      request.fields['specialization_type_id'] =
          specializationTypeId.toString();
      request.fields['department_id'] = departmentId.toString();
      request.fields['date'] = date;

      for (var element in feelings) {
        request.fields['feelings[]'] = element.toString();
      }
      request.fields['start_time'] = startTime;
      request.fields['end_time'] = endTime;

      // Check if the file path is valid before adding it to the request
      if (file.path.isNotEmpty && File(file.path).existsSync()) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'files',
            file.path,
          ),
        );
      }

      final response = await request.send();

      // Handle the response
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final data = json.decode(responseString);
      final statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());

      if (statusCode == 401) {
        userNotRegisteredWidget(Get.context!);
      }

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        Dialogs.successDialog(
          Get.context!,
          'send_scheduled_session_data_sucssesfully'.tr,
        );

        return SaveScheduledSessionModel.fromJson(data);
      } else if (data['code'] == 0) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, 'error_message'.tr);
      }
      return SaveScheduledSessionModel.fromJson(data);
    } on TimeoutException catch (e) {
      Dialogs.errorDialog(Get.context!, 'timeout'.tr);
      log('Timeout Error: ${e.message}');
      return Future.error(e.toString());
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }
}
