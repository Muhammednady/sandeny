import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes/app_pages.dart';
import '../constants/colors_manager.dart';
import '../constants/fonts_manager.dart';
import '../constants/styles_manager.dart';

userNotRegisteredWidget(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  return Get.defaultDialog(
    radius: 13,
    title: '',
    content: Column(
      children: [
        Text(
          'login_required'.tr,
          style: getMediumStyle(
            color: ColorsManager.primaryColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'login_required_message'.tr,
          style: getRegularStyle(
              color: ColorsManager.fontColor,
              fontSize: FontSizeManager.s14,
              height: 1.5),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.AUTH, arguments: 1);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                width: 145,
                height: 40,
                child: Padding(
                  padding: isArabic? 
                  const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ) : const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 10,
                  ),
                  child: Text(
                    'register'.tr,
                    style: getRegularStyle(
                      color: ColorsManager.whiteColor,
                      fontSize: FontSizeManager.s14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.AUTH, arguments: 0);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                width: 120,
                height: 40,
                child: Padding(
                  padding: isArabic? 
                  const EdgeInsets.only(
                    top: 10,
                    right: 20,
                  ) : const EdgeInsets.only(
                    top: 10,
                    left: 40,
                  ),
                  child: Text(
                    'login'.tr,
                    style: getRegularStyle(
                      color: ColorsManager.whiteColor,
                      fontSize: FontSizeManager.s14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}