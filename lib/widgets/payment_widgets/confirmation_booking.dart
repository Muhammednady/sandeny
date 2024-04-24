import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../app/modules/payment/controllers/payment_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

confirmationBooking(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(PaymentController());
  return showModalBottomSheet(
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    context: context,
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
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: ColorsManager.greyColor,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                Images.successIcon,
              ),
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 30)
                : const EdgeInsets.only(top: 30),
            child: Text(
              'booking_success'.tr,
              style: getMediumStyle(
                color: ColorsManager.mainColor,
                fontSize: FontSizeManager.s16,
              ),
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20, right: 50)
                : const EdgeInsets.only(top: 20, left: 80),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'booking_success_des'.tr,
                    style: getRegularStyle(
                      color: ColorsManager.fontColor,
                      fontSize: FontSizeManager.s14,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
