import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';
import 'package:sandeny/constants/values_manager.dart';

import '../../../../constants/fonts_manager.dart';
import '../../../../widgets/forget_password_widget/forget_password.dart';
import '../../../../widgets/text_form_fields.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    var isEnglish = Get.locale!.languageCode == 'en';
    var storage = GetStorage();
    return GetBuilder(
        init: controller,
        builder: (ctx) {
          return Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Expanded(
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                            child: GestureDetector(
                              onTap: () {
                                // forgetPasswordController
                                //     .forgetPassword();
                                forgetPasswordWidget(context);
                              },
                              child: Text(
                                'forget_password'.tr,
                                style: getRegularStyle(
                                  color: ColorsManager.fontColor,
                                  fontSize: FontSizeManager.s14,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonsManager.secondaryButton(
                        text: 'login'.tr,
                        onPressed: () {
                          controller.checkLogin();
                        },
                        context: context,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      // Biometric Login button
                      controller.fprint.value.isNotEmpty
                          ? ButtonsManager.primaryButton(
                              text: 'login_with_biometric'.tr,
                              onPressed: () {
                                // controller.checkLogin();
                                // if(controller.fprint.value.isNotEmpty){
                                //   controller.biometricAuth.isAuth('message');
                                // }
                                controller.biometricLogin();
                              },
                              context: context,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
