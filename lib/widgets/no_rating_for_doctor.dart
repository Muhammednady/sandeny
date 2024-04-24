import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/images_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../app/routes/app_pages.dart';
import '../constants/colors_manager.dart';
import '../constants/fonts_manager.dart';

Widget noRatingForDoctor(BuildContext context) {
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? EdgeInsets.only(
            top: 280,
            left: Get.width * 0.13,
            right: Get.width * 0.13,
          )
        : EdgeInsets.only(
            top: 280,
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
              child: SvgPicture.asset(
                Images.starIcon,
                height: 40,
                width: 38,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'no_rating_yet'.tr,
            style: getMediumStyle(
              color: ColorsManager.fontColor,
              fontSize: FontSizeManager.s16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'be_the_first_to_rate'.tr,
            style: getRegularStyle(
              color: ColorsManager.fontColor,
              fontSize: FontSizeManager.s13,
              height: 1.8,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // ButtonsManager.primaryButton(
          //   text: 'appointment_booking'.tr,
          //   onPressed: () {
          //     Get.toNamed(Routes.APPOINTMENT_BOOKING);
          //   },
          //   context: context,
          //   minimumSize: const Size(188, 50),
          //   maximumSize: const Size(188, 50),
          // ),
        ],
      ),
    ),
  );
}
