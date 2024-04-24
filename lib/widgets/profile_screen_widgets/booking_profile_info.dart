import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';

Widget bokkingProfileDataWidget(BuildContext context) {
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? const EdgeInsets.only(
            top: 15,
            right: 10,
          )
        : const EdgeInsets.only(
            top: 15,
            left: 10,
          ),
    child: Container(
      height: 112,
      width: 315,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsManager.whiteColor,
        // put the border color to dark grey
        border: Border.all(
          color: ColorsManager.borderColor,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, right: 20)
                    : const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  'my_bookings'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.mainColor,
                    fontSize: FontSizeManager.s14,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 20, right: 20)
                    : const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'next_bookings'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.hintStyleColor,
                    fontSize: FontSizeManager.s14,
                  ),
                ),
              ),
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 20, right: 20)
                    : const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'previous_bookings'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.hintStyleColor,
                    fontSize: FontSizeManager.s14,
                  ),
                ),
              ),
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 20, left: 20)
                    : const EdgeInsets.only(top: 20, right: 20),
                child: Text(
                  'cancelled_bookings'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.hintStyleColor,
                    fontSize: FontSizeManager.s14,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, right: 30)
                    : const EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  '1',
                  style: getMediumStyle(
                    color: ColorsManager.mainColor,
                    fontSize: FontSizeManager.s17,
                  ),
                ),
              ),
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, right: 20)
                    : const EdgeInsets.only(top: 10, left: 0),
                child: Text(
                  '15',
                  style: getMediumStyle(
                    color: ColorsManager.mainColor,
                    fontSize: FontSizeManager.s17,
                  ),
                ),
              ),
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, left: 30)
                    : const EdgeInsets.only(top: 10, right: 30),
                child: Text(
                  '0',
                  style: getMediumStyle(
                    color: ColorsManager.mainColor,
                    fontSize: FontSizeManager.s17,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
