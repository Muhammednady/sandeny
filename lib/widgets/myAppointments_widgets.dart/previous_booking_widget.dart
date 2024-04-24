import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/widgets/myAppointments_widgets.dart/previous_booking_body.dart';

import '../../constants/colors_manager.dart';

Widget previousBooking(BuildContext context) {
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
        child: previousBookingBody(context),
      ),
    ),
  );
}
