import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;
import '../../network/controllers/network_controller.dart';
import '../controllers/profile_controller.dart';
import '../models/profile_model_model.dart';

class EditProfileProvider extends GetConnect {
  var networkController = NetworkController.instance;
  var profileController = ProfileController.instance;
  static EditProfileProvider get instance => Get.put(EditProfileProvider());
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

  Future<ProfileModel> editProfile({
    required String fname,
    required String lname,
    required String igama,
    required String phone,
    required String birthDate,
    required int gender,
    required String maritalStatus,
    required File image,
    required String email,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        HttpHelper.baseUrl + HttpHelper.user,
      ),
    );
    request.headers["authorization"] = "Bearer ${storage.read('token')}";
    request.fields['first_name'] = fname;
    request.fields['last_name'] = lname;
    request.fields['iqama_number'] = igama;
    request.fields['phone'] = phone;
    request.fields['birth_of_date'] = birthDate;
    request.fields['gender'] = gender.toString();
    request.fields['marital_status'] = maritalStatus;
    request.fields['email'] = email;
    if (image.path != '') {
      request.files.add(
        await http.MultipartFile.fromPath(
          'personal_image',
          image.path,
        ),
      );
    } else {
      request.fields['personal_image'] = '';
    }
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    var data = json.decode(responseString);
    var statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log(data.toString());
    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Dialogs.successDialog(Get.context!, 'edit_profile_success'.tr);
      final storage = GetStorage();
      storage.write('email', email);
      Get.offAllNamed(Routes.HOME);

      // call the get profile api
      profileController.loadProfile();
      return ProfileModel.fromJson(data);
    }
    if (data['code'] == 0) {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'error_message'.tr);
    } else {
      EasyLoading.dismiss();
      Dialogs.errorDialog(Get.context!, 'unknown_error'.tr);
    }
    return ProfileModel();
  }
}
