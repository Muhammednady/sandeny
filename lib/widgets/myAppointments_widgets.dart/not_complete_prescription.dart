import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/fonts_manager.dart';
import 'package:sandeny/constants/images_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../constants/colors_manager.dart';

Widget notCompletePrescriptionWidget(BuildContext context) {
  return Padding(
      padding: Get.locale!.languageCode == 'ar'
          ? EdgeInsets.only(
              top: 80,
              left: Get.width * 0.13,
              right: Get.width * 0.13,
            )
          : EdgeInsets.only(
              top: 80,
              left: Get.width * 0.13,
              right: Get.width * 0.13,
            ),
      child: SizedBox(
        width: 315,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                Images.prescriptionIcon,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'not_yet_filled'.tr,
                style: getMediumStyle(
                  color: ColorsManager.fontColor,
                  fontSize: FontSizeManager.s16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'not_completed_prescription_description'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: FontSizeManager.s13,
                        height: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
}
