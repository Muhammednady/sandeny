import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/Auth/models/forget_password_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../network/controllers/network_controller.dart';
import '../models/countries_model.dart';
import '../providers/countries_provider.dart';
import '../providers/forget_password_provider.dart';
import '../providers/send_otp_provider.dart';

class ForgetPasswordController extends GetxController {
  // form key
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  var networkController = NetworkController.instance;

  TextEditingController phoneNumberController = TextEditingController();
  // get the forget password provider here
  final forgetPasswordProvider = ForgetPasswordProvider.instance;

  final countriesProvider = CountriesProvider();

  RxList<CountryData> countriesList = <CountryData>[].obs;

  var sendOtpProvider = SendOtpProvider.instance;

  final isLoading = false.obs;

  // storage insialisations
  GetStorage storage = GetStorage();
  // text field values
  String phone = '';

  Future<ForgetPasswordModel> forgetPassword() async {
    return await forgetPasswordProvider.forgetPassword(
      phone: phone,
    );
  }

  void checkForgetPassword() async {
    var isValid = forgetPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgetPasswordFormKey.currentState!.save();
    EasyLoading.show(status: 'loading'.tr);
    await forgetPassword();
    update();
  }

  Future<void> getCountries() async {
    isLoading.value = true;
    try {
      final data = await countriesProvider.getCountries();
      countriesList.clear();
      countriesList.addAll(data);
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
    }
    EasyLoading.dismiss();
    isLoading.value = false;
    update();
  }

  RxInt key = 966.obs;
  var isObscure = true.obs;
  var isObscureConfirm = true.obs;
  void selectCountry(int value) {
    countriesList[value].code = value.toString();
    key.value = int.parse(countriesList[value].code!);
    log('key is :${key.value}');
    update();
  }

  RxInt selectedIndex = 0.obs;
  void selectCountryIndex(int value) {
    selectedIndex.value = value;
    key.value = int.parse(countriesList[value].code!);
    update();
  }

  Future sendOtp() async {
    return await sendOtpProvider.sendOtp(
      phone: phone,
    );
  }

  void checkSendOtp() async {
    var isValid = forgetPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgetPasswordFormKey.currentState!.save();
    EasyLoading.show(status: 'loading'.tr);
    await sendOtp();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    phoneNumberController = TextEditingController();
    getCountries();
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
  }
}
