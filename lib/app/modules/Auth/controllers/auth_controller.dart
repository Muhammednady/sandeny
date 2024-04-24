
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.put(AuthController());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  late TextEditingController phoneNumberController,
      passwordController,
      firstNameController,
      lastNameController,
      confirmPasswordController,
      identityNumberController,
      otpController,
      newPasswordController;


  @override
  void onInit() {
    super.onInit();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    confirmPasswordController = TextEditingController();
    identityNumberController = TextEditingController();
    otpController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    confirmPasswordController.dispose();
    identityNumberController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
  }


  void checkOtp() {
    var isValid = otpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    otpFormKey.currentState!.save();
    Get.offAllNamed(Routes.HOME);
    update();
  }

  RxBool selectValue = false.obs;
  set selectLoginOrRegister(bool value) {
    selectValue.value = value;
    update();
  }

  bool get selectLoginOrRegister => selectValue.value;
}
