import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';

exitWorningWidget(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  return Get.defaultDialog(
    title: '',
    content: Column(
      children: [
        Text(
          'exit_from_exam'.tr,
          style: getRegularStyle(
            color: ColorsManager.primaryColor,
            fontSize: FontSizeManager.s14,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'are_you_sure'.tr,
          style: getRegularStyle(
            color: ColorsManager.fontColor,
            fontSize: FontSizeManager.s14,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: 10, left: 10)
              : const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorsManager.mainColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'cancel'.tr,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: ColorsManager.whiteColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.HOME);
                },
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffEEEDF8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'exit'.tr,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
