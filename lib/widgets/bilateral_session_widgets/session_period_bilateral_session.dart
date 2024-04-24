import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget sessionPeriodBilateralSession(BuildContext context, dynamic controller) {
  return Row(
    children: [
      Obx(
        () => GestureDetector(
          onTap: () {
            controller.firstPeriod.value = !controller.firstPeriod.value;
            controller.selectFirstPeriod(controller.firstPeriod.value);
            // if (controller.gender1.value == true) {
            //   controller.selectDoctorGender('male');
            // } else {
            //   controller.selectDoctorGender('male');
            // }
          },
          child: Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: controller.firstPeriod.value == true
                  ? ColorsManager.primaryColor
                  : ColorsManager.lightGreyColor,
            ),
            child: Center(
              child: Text(
                '30Min'.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: controller.firstPeriod.value == true
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
        width: 20,
      ),
      Obx(
        () => GestureDetector(
          onTap: () {
            controller.secondPeriod.value = !controller.secondPeriod.value;
            controller.selectSecondPeriod(controller.secondPeriod.value);
            // controller.selectGender2 = controller.gender2.value;
            // if (controller.gender2.value == true) {
            //   controller.selectDoctorGender('female');
            // } else {
            //   controller.selectDoctorGender('female');
            // }
          },
          child: Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: controller.secondPeriod.value == true
                  ? ColorsManager.primaryColor
                  : ColorsManager.lightGreyColor,
            ),
            child: Center(
              child: Text(
                '45Min'.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: controller.secondPeriod.value == true
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
        width: 20,
      ),
      Obx(
        () => GestureDetector(
          onTap: () {
            controller.thirdPeriod.value = !controller.thirdPeriod.value;
            controller.selectThirdPeriod(controller.thirdPeriod.value);
            // if (controller.unImportant.value == true) {
            //   controller.selectDoctorGender('female');
            // } else {
            //   controller.selectDoctorGender('female');
            // }
          },
          child: Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: controller.thirdPeriod.value == true
                  ? ColorsManager.primaryColor
                  : ColorsManager.lightGreyColor,
            ),
            child: Center(
              child: Text(
                '60Min'.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: controller.thirdPeriod.value == true
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
