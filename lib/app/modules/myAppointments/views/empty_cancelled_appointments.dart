import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';


  Widget emptyCancelledAppointments(BuildContext context) {
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
            'no_cancelled_appointments'.tr,
            style: getMediumStyle(
              color: ColorsManager.fontColor,
              fontSize: FontSizeManager.s16,
            ),
          ),
        ],
      ),
    );
  }