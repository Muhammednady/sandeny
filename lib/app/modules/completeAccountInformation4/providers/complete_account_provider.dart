import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../routes/app_pages.dart';
import '../../network/controllers/network_controller.dart';
import '../models/complete_account_model.dart';

class CompleteAccountProvider extends GetConnect {
  GetStorage storage = GetStorage();
  var networkController = NetworkController.instance;
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

  Future<CompleteUserAccountModel> completeAccount({
    required String email,
    required int weight,
    required int height,
    required String birthDate,
    required String gender,
    required String materialStatus,
    required String familyMemberPhone,
    required int psychiatrist,
    required String psychiatristDescription,
    required int disability,
    required String disabilityDescription,
    required int healthProblem,
    required String healthProblemDescription,
    required int medication,
    required String medicationDescription,
    required List<dynamic> habits,
    required String habitsOtherDetails,
    required int diseases,
    required String diseasesOtherDetails,
    required String otherPhone,
  }) async {
    final response = await post(HttpHelper.completePatientProfile, {
      'email': email,
      'other_phone': otherPhone,
      'weight': weight,
      'height': height,
      'birth_date': birthDate,
      'gender': gender,
      'marital_status': materialStatus,
      'family_member_phone': familyMemberPhone,
      'psychiatrist': psychiatrist,
      'psychiatrist_description': psychiatristDescription,
      'disability': disability,
      'disability_description': disabilityDescription,
      'health_problem': healthProblem,
      'health_problem_description': healthProblemDescription,
      'medication': medication,
      'medication_description': medicationDescription,
      'habits': json.decode(storage.read('habits')) as List<dynamic>,
      'habits_other_details': habitsOtherDetails,
      'diseases': diseases,
      'diseases_other_details': diseasesOtherDetails,
    }, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${storage.read('token')}',
    });
    var data = response.body;
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log(data.toString());

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Dialogs.successDialog(Get.context!, 'complete_account_success'.tr);
      Get.offAllNamed(Routes.HOME);
    }

    if (data['code'] == 0) {
      log(data['error']['details']);
      // if (data['error']['details'][0]) {
      //   EasyLoading.dismiss();
      //   Dialogs.errorDialog(Get.context!, 'email_already_exist'.tr);
      // }
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'complete_account_failed'.tr);
    }

    if (statusCode == 500) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'server_error'.tr);
    }
    return CompleteUserAccountModel.fromJson(data);
  }
}
