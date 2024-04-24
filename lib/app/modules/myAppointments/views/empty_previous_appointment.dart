import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';


  Widget emptyPreviousAppointments(BuildContext context) {
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
          Padding(
           padding: Get.locale!.languageCode == 'en'
                ? const EdgeInsets.only(
                    left: 50,
                  )
                : const EdgeInsets.only(
                    left: 0,
                    right: 0
                  ),
            child: Text(
              'no_previos_appointments'.tr,
              style: getMediumStyle(
                color: ColorsManager.fontColor,
                fontSize: FontSizeManager.s16,
              ),
            ),
          ),
        ],
      ),
    );
  }