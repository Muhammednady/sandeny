import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

notComingAppointments(BuildContext context, dynamic appointment) {
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
      height: 455,
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorsManager.greyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
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
                  color: ColorsManager.defaultGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: Get.locale!.languageCode == 'ar'
                  ? const EdgeInsets.only(
                      top: 30,
                      left: 10,
                    )
                  : const EdgeInsets.only(
                      top: 30,
                      right: 20,
                    ),
              child: SvgPicture.asset(
                Images.videoAppointmentIcon,
              ),
            ),
            Padding(
              padding: Get.locale!.languageCode == 'ar'
                  ? const EdgeInsets.only(
                      top: 10,
                      right: 80,
                      left: 80,
                    )
                  : const EdgeInsets.only(
                      top: 10,
                      left: 80,
                      right: 110,
                    ),
              child: Text(
                'not_consultation_time'.tr,
                style: getMediumStyle(
                  color: ColorsManager.mainColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${'consultation_date'.tr} ${appointment.doctorName} ${'is'.tr}',
              style: getRegularStyle(
                color: ColorsManager.fontColor,
                fontSize: 13,
              ),
            ),
            Padding(
              padding: Get.locale!.languageCode == 'ar'
                  ? const EdgeInsets.only(
                      top: 10,
                      right: 100,
                    )
                  : const EdgeInsets.only(
                      top: 10,
                      left: 110,
                    ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Images.calenderIcon,
                    color: ColorsManager.mainColor,
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Get.locale!.languageCode == 'ar'
                        ? ' ${appointment.endAt!.toString()} ${'to'.tr} ${appointment.startAt!.toString()} - ${appointment.date!.toString()}'
                        : '${appointment.date!.toString()}-${appointment.startAt!.toString()} ${'to'.tr} ${appointment.endAt!.toString()}',
                    style: getRegularStyle(
                      color: ColorsManager.blackColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: Get.locale!.languageCode == 'ar'
                  ? const EdgeInsets.only(
                      top: 10,
                      right: 80,
                      left: 60,
                    )
                  : const EdgeInsets.only(
                      top: 10,
                      left: 80,
                      right: 60,
                    ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'consultation_time_description'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonsManager.primaryButton(
              onPressed: () {
                Get.toNamed(Routes.IMMEDIATE_CONSULTATION);
              },
              context: context,
              text: 'immediate_consultation'.tr,
              minimumSize: const Size(248, 50),
              maximumSize: const Size(248, 50),
            ),
          ],
        ),
      ),
    ),
  );
}
