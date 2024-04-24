import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../home/controllers/home_controller.dart';

Widget emptyComingAppointments(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        SizedBox(
          height: Get.height * 0.1,
        ),
        Center(
          child: SvgPicture.asset(
            Images.appointmentIcon,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'no_appointments'.tr,
          style: getMediumStyle(
            color: ColorsManager.fontColor,
            fontSize: FontSizeManager.s16,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'not_bokking_appointment'.tr,
          style: getRegularStyle(
            color: ColorsManager.fontColor,
            fontSize: FontSizeManager.s14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonsManager.primaryButton(
          text: 'see_doctors_list'.tr,
          onPressed: () {
            // Get.toNamed(Routes.DOCTORS, arguments: 1);
            final homeController = Get.find<HomeController>();
            homeController.getDoctorSpecificationId(
              id: homeController.getSpecificationData[0].id,
            );
            Get.toNamed(
              Routes.DOCTORS,
              arguments: homeController.getSpecificationData[0].id,
            );
          },
          context: context,
          minimumSize: const Size(50, 50),
          maximumSize: const Size(188, 188),
        )
      ],
    ),
  );
}
