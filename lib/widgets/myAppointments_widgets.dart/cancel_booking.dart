import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/images_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../constants/colors_manager.dart';
import 'cancel_appointment.dart';

cancellBooking(BuildContext context, int index) {
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
    builder: (context) => Container(
      height: 150,
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorsManager.greyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(
                    top: 40,
                    right: 30,
                  )
                : const EdgeInsets.only(
                    top: 40,
                    left: 30,
                  ),
            child: Row(
              children: [
                Text(
                  'booking_management'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.fontColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(
                    top: 40,
                    right: 40,
                  )
                : const EdgeInsets.only(
                    top: 40,
                    left: 40,
                  ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    cancellApoointment(context, index);
                  },
                  child: SvgPicture.asset(
                    Images.cancelIcon,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'cancel_booking'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.blackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
