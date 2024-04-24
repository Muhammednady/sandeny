import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget sessionNatureBilateralSession(BuildContext context, dynamic controller) {
  return Row(
    children: [
      Obx(
        () => GestureDetector(
          onTap: () {
            controller.videoSession.value = !controller.videoSession.value;
            // if (controller.gender1.value == true) {
            //   controller.selectDoctorGender('male');
            // } else {
            //   controller.selectDoctorGender('male');
            // }
          },
          child: Container(
            width: 153,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: controller.videoSession.value == true
                  ? ColorsManager.primaryColor
                  : ColorsManager.lightGreyColor,
            ),
            child: Center(
              child: Text(
                'video'.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: controller.videoSession.value == true
                          ? ColorsManager.whiteColor
                          : ColorsManager.fontColor,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Obx(
        () => GestureDetector(
          onTap: () {
            controller.audioSession.value = !controller.audioSession.value;
            // if (controller.unImportant.value == true) {
            //   controller.selectDoctorGender('female');
            // } else {
            //   controller.selectDoctorGender('female');
            // }
          },
          child: Container(
            width: 153,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: controller.audioSession.value == true
                  ? ColorsManager.primaryColor
                  : ColorsManager.lightGreyColor,
            ),
            child: Center(
              child: Text(
                'audio'.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: controller.audioSession.value == true
                          ? ColorsManager.whiteColor
                          : ColorsManager.fontColor,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
