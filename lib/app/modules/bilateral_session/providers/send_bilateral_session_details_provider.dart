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
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../../widgets/not_authenticated_user.dart';
import '../../network/controllers/network_controller.dart';
import '../models/send_bilateral_session_doctors_model.dart';

class SendBilateralSessionDetailsProvider extends GetConnect {
  static SendBilateralSessionDetailsProvider get instance =>
      Get.put(SendBilateralSessionDetailsProvider());

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

  Future<SendBilateralSessionDetailsModel> sendBilateralSessionDetails({
    required int doctorId,
    required int specializationTypeId,
    required int departmentId,
    required int workDayId,
    required int periodId,
    required String reason,
    required String date,
    required String phone,
    required String relativeRelation,
    required List<File> files,
    required String startTime,
    required String endTime,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    const url = HttpHelper.baseUrl + HttpHelper.sendBilateralSessionDetails;
    final headers = {
      "authorization": "Bearer ${storage.read('token')}",
    };
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields['doctor_id'] = doctorId.toString();
      request.fields['reason'] = reason;
      request.fields['specialization_type_id'] =
          specializationTypeId.toString();
      request.fields['department_id'] = departmentId.toString();
      request.fields['work_day_id'] = workDayId.toString();
      request.fields['period_id'] = periodId.toString();
      request.fields['date'] = date;
      request.fields['phone'] = phone;
      request.fields['relative_relation'] = relativeRelation;
      request.fields['start_time'] = startTime;
      request.fields['end_time'] = endTime;

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

      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final data = json.decode(responseString);
      final statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log('this is the data : ${data.toString()}');

      if (statusCode == 401) {
        userNotRegisteredWidget(Get.context!);
      }

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        Dialogs.successDialog(
          Get.context!,
          'send_bilateral_session_details_sucssesfully'.tr,
        );

        return SendBilateralSessionDetailsModel.fromJson(data);
      } else if (data['code'] == 0) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, 'error_message'.tr);
      }
      return SendBilateralSessionDetailsModel.fromJson(data);
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
