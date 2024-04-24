import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/fonts_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../constants/colors_manager.dart';

addCoupon(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  return Get.defaultDialog(
    title: '',
    content: Column(
      children: [
        Center(
          child: Text(
            'add_coupon'.tr,
            style: getRegularStyle(
              color: ColorsManager.mainColor,
              fontSize: FontSizeManager.s14,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: 10)
              : const EdgeInsets.only(left: 10),
          child: Container(
            width: 275,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorsManager.greyColor,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 213,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'coupon_code'.tr,
                      hintStyle: getRegularStyle(
                        color: ColorsManager.defaultGreyColor,
                        fontSize: FontSizeManager.s12,
                      ),
                      fillColor: ColorsManager.greyColor,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      controller.couponCode = value;
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    controller.applyCoupon();
                  },
                  child: Container(
                    width: 62,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'add_ticket_button'.tr,
                        textAlign: TextAlign.center,
                        style: getRegularStyle(
                          color: ColorsManager.whiteColor,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}