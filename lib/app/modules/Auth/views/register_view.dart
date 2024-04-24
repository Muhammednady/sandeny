import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/Auth/controllers/register_controller.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/payment_widgets/terms_and_conditions.dart';
import '../../../../widgets/text_form_fields.dart';

class RegisterView extends GetView {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.instance;

    var isEnglish = Get.locale!.languageCode == 'en';
    return Form(
      key: controller.registerFormKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Expanded(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: isEnglish
                            ? const EdgeInsets.only(
                                top: AppPadding.p20, left: AppPadding.p65)
                            : const EdgeInsets.only(
                                top: AppPadding.p20, right: AppPadding.p40),
                        child: Text(
                          'first_name'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.mainColor,
                            fontSize: FontSizeManager.s14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      firstNameFormField(
                          context,
                          controller,
                          ColorsManager.greyColor,
                          'first_name'.tr,
                          ColorsManager.hintStyleColor),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: isEnglish
                            ? const EdgeInsets.only(
                                top: AppPadding.p20, left: AppPadding.p65)
                            : const EdgeInsets.only(
                                top: AppPadding.p20, right: AppPadding.p40),
                        child: Text(
                          'last_name'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.mainColor,
                            fontSize: FontSizeManager.s14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      lastNameFormField(
                          context,
                          controller,
                          ColorsManager.greyColor,
                          'last_name'.tr,
                          ColorsManager.hintStyleColor),
                    ],
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
                    ColorsManager.hintStyleColor,
                  ),
                  const SizedBox(
                    height: 15,
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
                          'identity_number'.tr,
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
                  // identity number text field widget
                  identityFormField(
                      context,
                      controller,
                      ColorsManager.greyColor,
                      'identity_number'.tr,
                      ColorsManager.hintStyleColor),

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
                          'email'.tr,
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

                  // Email text field widget
                  emailWidget(
                    context,
                    controller,
                    ColorsManager.greyColor,
                    'email'.tr,
                    ColorsManager.hintStyleColor,
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
                          'password'.tr,
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
                  // Password text field widget
                  passwordFormField(
                    context,
                    controller,
                    ColorsManager.greyColor,
                    'password'.tr,
                    ColorsManager.hintStyleColor,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  // confirm password
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
                          'confirm_password'.tr,
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
                  // confirm password text field widget
                  confirmPasswordFormField(context, controller),

                  const SizedBox(
                    height: 10,
                  ),

                  termsAndConditions(context, controller),

                  const SizedBox(
                    height: 30,
                  ),
                  ButtonsManager.secondaryButton(
                    text: 'register'.tr,
                    onPressed: () {
                      if (controller.readTerms.value == true) {
                        controller.checkRegister();
                      } else {
                        Dialogs.errorDialog(
                            context, 'accepte_terms_and_conditions'.tr);
                      }
                    },
                    context: context,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
