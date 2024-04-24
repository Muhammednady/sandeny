import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../app/modules/Auth/controllers/forget_password_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';
import '../text_form_fields.dart';

forgetPasswordWidget(BuildContext context) {
  var isEnglish = Get.locale!.languageCode == 'en';
  var controller = Get.put(ForgetPasswordController());
  return showModalBottomSheet(
    builder: (BuildContext context) {
      return Form(
        key: controller.forgetPasswordFormKey,
        child: Container(
          width: Get.width,
          height: Get.height * 0.5,
          decoration: const BoxDecoration(
            color: ColorsManager.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: isEnglish
                            ? const EdgeInsets.only(
                                top: AppPadding.p20, left: AppPadding.p65)
                            : const EdgeInsets.only(
                                top: AppPadding.p20, right: AppPadding.p40),
                        child: Text(
                          'phone_number'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.mainColor,
                            fontSize: FontSizeManager.s14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // Phone number text field widget
                  phoneNumberFormField(
                      context,
                      controller,
                      ColorsManager.greyColor,
                      'phone_number'.tr,
                      ColorsManager.hintStyleColor),
                  const SizedBox(
                    height: 35,
                  ),
                  ButtonsManager.primaryButton(
                      text: 'send'.tr,
                      maximumSize: const Size(315, 50),
                      minimumSize: const Size(315, 50),
                      onPressed: () {
                        // controller.checkForgetPassword();
                        controller.checkSendOtp();
                      },
                      context: context)
                ],
              ),
            ),
          ),
        ),
      );
    },
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    context: context,
  );
}
