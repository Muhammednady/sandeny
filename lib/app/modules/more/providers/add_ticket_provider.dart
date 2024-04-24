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
import 'package:sandeny/widgets/more_screen_widgets/sucess_add_ticket.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';

class AddTicketProvider extends GetConnect {
  static AddTicketProvider get instance => Get.put(AddTicketProvider());

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

  Future<void> addTicket({
    required String address,
    required String type,
    required String importance,
    required String note,
    required List<File> files,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    const url = HttpHelper.baseUrl + HttpHelper.addTicket;
    final headers = {
      "authorization": "Bearer ${storage.read('token')}",
    };

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields['address'] = address;
    request.fields['type'] = type;
    request.fields['importance'] = importance;
    request.fields['note'] = note;

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

    log(files.length.toString());

    final response = await request.send();

    // Handle the response
    final responseData = await response.stream.toBytes();
    final responseString = String.fromCharCodes(responseData);
    final data = json.decode(responseString);
    final statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log(data.toString());

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Get.back();
      successAddTicket(Get.context!);
      Dialogs.successDialog(
        Get.context!,
        'sucssesfully_added_ticket'.tr,
      );
    } else if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
  }
}
