import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

scaleHeader(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  return Container(
    height: 194,
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: NetworkImage(
          controller.getScale.image!,
        ),
        colorFilter: ColorFilter.mode(
          ColorsManager.blackColor.withOpacity(0.1),
          BlendMode.darken,
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 50,
          left: isArabic ? null : 25,
          right: isArabic ? 25 : null,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: Get.width * 0.2,
              ),
              Text(
                isArabic
                    ? controller.getScale.name.ar!
                    : controller.getScale.name.en!,
                style: getMediumStyle(
                  color: ColorsManager.whiteColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: isArabic
              ? EdgeInsets.only(
                  right: Get.width * 0.42,
                  top: 90,
                )
              : const EdgeInsets.only(
                  right: AppPadding.p70, top: AppPadding.p15),
          child: Text(
            '${controller.getScale.questionCount!} ${'questions'.tr}',
            style: getRegularStyle(
              color: ColorsManager.whiteColor,
              fontSize: AppSize.s12,
            ),
          ),
        ),
      ],
    ),
  );
}
