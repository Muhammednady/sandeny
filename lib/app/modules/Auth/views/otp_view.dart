import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sandeny/app/modules/Auth/views/resetpassword_view.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';
import 'package:sandeny/constants/validations.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/values_manager.dart';
import '../controllers/otp_controller.dart';
import '../providers/verify_account_provider.dart';

class OtpView extends GetView {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int? number = Get.arguments;
    var controller = OtpController.instance;
    var storage = GetStorage();
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      body: Form(
        key: controller.otpCodeFormKey,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 106),
                child: Image.asset(
                  Images.logo,
                  height: 121,
                  width: 188,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppPadding.p20),
                    topRight: Radius.circular(AppPadding.p20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: AppSize.s20),
                        child: Text(
                          'enter_otp'.tr,
                          style: getMediumStyle(color: ColorsManager.mainColor),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'description1_otp'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                      Text(
                        'description2_otp'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      PinCodeTextField(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        textStyle: getMediumStyle(
                          color: ColorsManager.fontColor,
                          fontSize: FontSizeManager.s14,
                        ),
                        pinTheme: PinTheme(
                          activeColor: ColorsManager.greyColor,
                          inactiveColor: ColorsManager.whiteColor,
                          disabledColor: ColorsManager.whiteColor,
                          selectedColor: ColorsManager.primaryColor,
                          selectedFillColor: ColorsManager.whiteColor,
                          activeFillColor: ColorsManager.greyColor,
                          inactiveFillColor: ColorsManager.greyColor,
                          errorBorderColor: ColorsManager.errorColor,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 54,
                          fieldWidth: 52,
                        ),
                        validator: (value) => Validations().validateOtp(value!),
                        backgroundColor: ColorsManager.whiteColor,
                        enableActiveFill: true,
                        controller: controller.otpController,
                        onCompleted: (v) {
                          controller.code = v;
                        },
                        onChanged: (value) {
                          controller.changeOtp(value);
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ButtonsManager.primaryButton(
                        text: 'confirm'.tr,
                        onPressed: () async {
                          if (number == 1) {
                            if (storage.read('code').toString() ==
                                controller.code) {
                              log('phone ${storage.read('phone').toString()}');
                              final verifyAccountProvider =
                                  VerifyAccountProvider();
                              verifyAccountProvider
                                  .verifyAccount(
                                phone: storage.read('phone').toString(),
                                code: controller.code,
                              ).then((value) {
                                if (value.code == 1) {
                                  Dialogs.successDialog(
                                    context,
                                    'sucsses_register'.tr,
                                  );
                                  Get.offAllNamed(
                                      Routes.COMPLETE_ACCOUNT_INFORMATION);
                                }
                                if (value.code == 0) {
                                  Dialogs.errorDialog(context, 'otp_error'.tr);
                                }
                              });
                            } else {
                              Dialogs.errorDialog(context, 'otp_error'.tr);
                            }
                          } else {
                            Get.to(() => const ResetpasswordView());
                          }
                        },
                        context: context,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'not_receive_code'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.blackColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.resendOTP();
                            },
                            child: Obx(
                              () => controller.isResendEnabled.value == false
                                  ? const SizedBox()
                                  : Text(
                                      'resend'.tr,
                                      style: getRegularStyle(
                                        color: ColorsManager.mainColor,
                                        fontSize: FontSizeManager.s14,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => controller.isResendEnabled.value
                            ? const SizedBox()
                            : Text(
                                '${'seconds_remaining'.tr} : ${controller.secondsRemaining.value}',
                                style: getRegularStyle(
                                  color: ColorsManager.primaryColor,
                                  fontSize: FontSizeManager.s14,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
