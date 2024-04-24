import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/home/controllers/home_controller.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Future appointmentTimeFinished(BuildContext context, dynamic appointment) {
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
      height: 380,
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
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
            'appointment_time_end'.tr,
            style: getMediumStyle(
              color: ColorsManager.fontColor,
              fontSize: FontSizeManager.s16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            Get.locale!.languageCode == 'ar'
                ? '${appointment.endAt!.toString()} ${'to'.tr} ${appointment.startAt!.toString()} - ${appointment.date!.toString()}'
                : '${appointment.date!.toString()}-${appointment.startAt!.toString()} ${'to'.tr} ${appointment.endAt!.toString()}',
            style: getRegularStyle(
              color: ColorsManager.blackColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'appointment_time_end_description'.tr,
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
              final homeController = Get.find<HomeController>();
              homeController.getDoctorSpecificationId(id:appointment.specializations!.id);
              Get.toNamed(Routes.DOCTORS,
                  arguments: appointment.specializations!.id);
            },
            context: context,
            minimumSize: const Size(50, 50),
            maximumSize: const Size(188, 188),
          )
        ],
      ),
    ),
  );
}
