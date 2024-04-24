import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../network/controllers/network_controller.dart';
import '../providers/reset_password_provider.dart';

class ResetpasswordController extends GetxController {
  static ResetpasswordController get instance =>
      Get.put(ResetpasswordController());
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  var resetPasswordProvider = ResetPasswordProvider.instance;
  var networkController = NetworkController.instance;
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  late TextEditingController passwordController,
      confirmPasswordController,
      otpController,
      newPasswordController;
  String newPassword = '';
  String confirmPassword = '';
  var isObscureNew = true.obs;
  var isObscureConfirm = true.obs;
  Future resetPassword() async {
    await resetPasswordProvider.resetPassword(
      phone: await storage.read(key: 'phone') ?? '',
      newPassword: newPassword,
    );
  }

  checkResetPassword() async {
    var isValid = resetPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    resetPasswordFormKey.currentState!.save();
    EasyLoading.show(status: 'loading'.tr);
    await resetPassword();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    otpController = TextEditingController();
    newPasswordController = TextEditingController();
  }
}
