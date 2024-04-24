import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/fonts_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';
import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget aboutDoctorOrRatings(BuildContext context, dynamic controller) {
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? EdgeInsets.only(
            top: 190,
            right: Get.width * 0.11,
          )
        : EdgeInsets.only(
            top: 190,
            left: Get.width * 0.11,
          ),
    child: Obx(
      () => GestureDetector(
        onTap: () {
          controller.selectAboutDoctorOrRatings = false;
        },
        child: Container(
          width: 315,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppSize.s50,
            ),
            color: ColorsManager.whiteColor,
            // color: Colors.grey
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 157,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s50),
                  color: controller.selectValue.value == false
                      ? ColorsManager.primaryColor
                      : ColorsManager.whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'about_doctor'.tr,
                      style: getRegularStyle(
                        fontSize: FontSizeManager.s14,
                        color: controller.selectValue.value == false
                            ? ColorsManager.whiteColor
                            : ColorsManager.fontColor,
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                  ],
                ),
              ),
              Obx(
                (() => GestureDetector(
                      onTap: () {
                        controller.selectAboutDoctorOrRatings = true;
                      },
                      child: Container(
                        width: 157,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s50),
                          color: controller.selectValue.value == true
                              ? ColorsManager.primaryColor
                              : ColorsManager.whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${'doctor_ratings'.tr} (${controller.getDoctor.rateCount})',
                              style: getRegularStyle(
                                fontSize: FontSizeManager.s14,
                                color: controller.selectValue.value == true
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.fontColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
