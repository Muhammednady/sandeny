import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/changePassword/provider/change_password_provider.dart';

import '../../../../constants/dialogs.dart';
import '../../network/controllers/network_controller.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get instance =>
      Get.put(ChangePasswordController());

  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  late TextEditingController passwordController,
      confirmPasswordController,
      oldPasswordController;

  var networkController = NetworkController.instance;

  var provider = ChangePasswordProvider.instance;
  // storage insialisations
  GetStorage storage = GetStorage();
  // text field values
  String oldPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  Future<void> updatePassword() async {
    return await provider.updatePassword(
      newPassword: newPassword,
    );
  }

  void checkUpdatePassword() async {
    var isValid = changePasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    changePasswordFormKey.currentState!.save();
    EasyLoading.show(status: 'loading'.tr);
    await updatePassword();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    oldPasswordController = TextEditingController();
  }

  var isObscure = true.obs;
  var isObscureNew = true.obs;
  var isObscureConfirm = true.obs;
}
