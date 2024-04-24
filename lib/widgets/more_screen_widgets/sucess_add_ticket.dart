import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/fonts_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';

successAddTicket(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
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
            height: 40,
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
          const SizedBox(
            height: 20,
          ),
          Text(
            'ticket_added_successfully'.tr,
            style: getMediumStyle(
              color: ColorsManager.mainColor,
              fontSize: FontSizeManager.s16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'ticket_added_successfully_des'.tr,
            style: getRegularStyle(
              color: ColorsManager.fontColor,
              fontSize: FontSizeManager.s14,
              height: 1.5,
            ),
          )
        ],
      ),
    ),
  );
}
