import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../../app/modules/more/controllers/more_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../Account_settings/delete_account_widget.dart';

accountSettings(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(MoreController());
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) => Container(
      width: Get.width,
      height: Get.height * 0.4,
      decoration: const BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Container(
                width: 44,
                height: 6,
                decoration: const BoxDecoration(
                  color: ColorsManager.lightGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),

            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 30)
                  : const EdgeInsets.only(top: 30),
              child: Text(
                'account_settings'.tr,
                style: getMediumStyle(
                  color: ColorsManager.mainColor,
                  fontSize: FontSizeManager.s16,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Change Password field
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 20, right: 20)
                        : const EdgeInsets.only(top: 20, left: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(Images.lockIcon),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'change_password'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 10)
                        : const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(top: 5, left: 30)
                              : const EdgeInsets.only(top: 5, right: 30),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: ColorsManager.primaryColor,
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 5, left: 20, right: 20)
                  : const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: const Divider(
                color: ColorsManager.primaryColor,
                thickness: 0.1,
              ),
            ),

            // Notification Field
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(right: 20)
                      : const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(Images.faceId),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'biometric_auth'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(left: 20)
                          : const EdgeInsets.only(right: 20),
                      child: Obx(
                        () => CupertinoSwitch(
                          value: controller.biometricSwitch.value,
                          activeColor: const Color(0xff2ECC71),
                          onChanged: (value) {
                            controller.enableBiometricAuth(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(left: 20, right: 20)
                  : const EdgeInsets.only(left: 20, right: 20),
              child: const Divider(
                color: ColorsManager.primaryColor,
                thickness: 0.1,
              ),
            ),

            // Logout Field
            GestureDetector(
              onTap: () async {
                await controller.submitLogot();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 10, right: 20)
                        : const EdgeInsets.only(top: 10, left: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(Images.logoutIcon),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'logout'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 5, left: 20, right: 20)
                  : const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: const Divider(
                color: ColorsManager.primaryColor,
                thickness: 0.1,
              ),
            ),

            // Delete Account Field
            GestureDetector(
              onTap: () {
                deleteAccount(context, controller);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 10, right: 20)
                        : const EdgeInsets.only(top: 10, left: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(Images.trashIcon),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'delete_account'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 5, left: 20, right: 20)
                  : const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: const Divider(
                color: ColorsManager.primaryColor,
                thickness: 0.1,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
