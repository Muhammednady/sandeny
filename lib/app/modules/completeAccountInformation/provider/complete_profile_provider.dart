import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;
import '../model/complete_profile_model.dart';

class CompleteProfileProvider extends GetConnect {
  static CompleteProfileProvider get instance =>
      Get.put(CompleteProfileProvider());
  GetStorage storage = GetStorage();
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

  Future<CompleteProfileModel> completeProfile({
    required String familyPhone,
    required String birthDate,
    required int gender,
    required String maritalStatus,
    required String otherPhone,
    // required String email,
    required String height,
    required String weight,
  }) async {
    log('this is the family phone: $familyPhone');
    log('this is birth date: $birthDate');
    log('this is gender : $gender');
    log('this is marital status: $maritalStatus');
    log('this is other phone: $otherPhone');
    log('this is height: $height');
    log('this is weight: $weight');
    await Future.delayed(const Duration(seconds: 1));
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        HttpHelper.baseUrl + HttpHelper.user,
      ),
    );
    request.headers["authorization"] = "Bearer ${storage.read('token')}";
    request.fields['family_phone'] = familyPhone;
    request.fields['birth_of_date'] = birthDate;
    request.fields['gender'] = gender.toString();
    // request.fields['email'] = email;
    request.fields['marital_status'] = maritalStatus;
    request.fields['phone_others'] = otherPhone;
    request.fields['height'] = height;
    request.fields['weight'] = weight;
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    final responseString = String.fromCharCodes(responseData);
    var data = json.decode(responseString);
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log('this is the response data: $data');
    if (data['code'] == 1) {
      EasyLoading.dismiss();
      final storage = GetStorage();
      storage.write('email', data['data']['email']);
      Get.offAllNamed(Routes.COMPLETE_ACCOUNT_INFORMATION2);
      return CompleteProfileModel();
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    }
    if (data['code'] == 2) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    } else {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return CompleteProfileModel();
  }
}
