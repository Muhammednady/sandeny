import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/widgets/myAppointments_widgets.dart/next_booking_body.dart';

Widget nextBooking(BuildContext context) {
  return Expanded(
    child: Padding(
      padding: Get.locale!.languageCode == 'ar'
          ? EdgeInsets.only(
              top: 130, right: Get.width * 0.10, left: Get.width * 0.13)
          : EdgeInsets.only(
              top: 130, right: Get.width * 0.10, left: Get.width * 0.13),
      child: Container(
        height: Get.height,
        width: 315,
        color: ColorsManager.greyColor,
        child: nextBookingBody(context),
      ),
    ),
  );
}