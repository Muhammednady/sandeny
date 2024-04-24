import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/widgets/search_widgets/search_widget.dart';

import '../../app/routes/app_pages.dart';
import '../../constants/buttons_manager.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Widget noFilterResult(BuildContext context, dynamic controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: Get.locale!.languageCode == 'ar'
              ? EdgeInsets.only(
                  top: 20, left: Get.width * 0.10, right: Get.width * 0.1)
              : EdgeInsets.only(
                  top: 20, left: Get.width * 0.10, right: Get.width * 0.1),
          child: searchWidget(context),
        ),
        Padding(
          padding: Get.locale!.languageCode == 'ar'
              ? EdgeInsets.only(
                  top: 50,
                  left: Get.width * 0.13,
                  right: Get.width * 0.13,
                )
              : EdgeInsets.only(
                  top: 50,
                  left: Get.width * 0.13,
                  right: Get.width * 0.13,
                ),
          child: Container(
            width: 315,
            decoration: const BoxDecoration(
              color: ColorsManager.greyColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      Images.searchIcon,
                      height: 40,
                      width: 38,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'no_search_result'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.fontColor,
                    fontSize: FontSizeManager.s16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'no_search_result_description'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                    fontSize: FontSizeManager.s13,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonsManager.primaryButton(
                  text: 'see_doctor_list'.tr,
                  onPressed: () {
                    Get.toNamed(Routes.DOCTORS);
                  },
                  context: context,
                  minimumSize: const Size(188, 50),
                  maximumSize: const Size(188, 50),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
