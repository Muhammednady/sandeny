import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/appointment_booking/available_date_appointment.dart';
import '../../../../widgets/bilateral_session_widgets/appointment_bilateral_session.dart';
import 'bilateral_session_details_view.dart';

class Booking2BilateralSessionView extends GetView {
  const Booking2BilateralSessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.greyColor,
        elevation: 0,
        leading: Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: AppPadding.p30)
              : const EdgeInsets.only(left: AppPadding.p30),
          child: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsManager.blackColor,
            ),
          ),
        ),
        title: Text(
          'appointment_booking'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(
                            top: AppPadding.p20, right: AppPadding.p40)
                        : const EdgeInsets.only(
                            top: AppPadding.p20, left: AppPadding.p60),
                    child: Text(
                      'appointment_booking_des'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            // available date appointment
            availableDateAppointment(context),

            const SizedBox(
              height: 20,
            ),

            // body of appointment booking
            appointmentBookingBilateralBody(context),

            SizedBox(
              height: Get.height * 0.25,
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(right: 50)
                  : const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  ButtonsManager.primaryButton(
                    text: 'next'.tr,
                    onPressed: () {
                      Get.to(const BilateralSessionDetailsView());
                    },
                    context: context,
                    maximumSize: const Size(171, 50),
                    minimumSize: const Size(171, 50),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ButtonsManager.secondaryButton(
                    text: 'previous'.tr,
                    onPressed: () {
                      Get.back();
                    },
                    buttonColor: ColorsManager.greyColor,
                    textColor: ColorsManager.fontColor,
                    context: context,
                    maximumSize: const Size(134, 50),
                    minimumSize: const Size(134, 50),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
