import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/appointment_booking/appointment_booking_body.dart';
import '../../../../widgets/appointment_booking/available_date_appointment.dart';
import '../controllers/appointment_booking_controller.dart';

class AppointmentBookingView extends GetView<AppointmentBookingController> {
  const AppointmentBookingView({Key? key}) : super(key: key);
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
            appointmentBookingBody(context),

            ButtonsManager.primaryButton(
              text: 'appointment_booking'.tr,
              onPressed: () {
                // Get.toNamed('/payment');
                Get.toNamed(Routes.PAYMENT, arguments: 0);
              },
              context: context,
              minimumSize: const Size(315, 50),
              maximumSize: const Size(315, 50),
            ),
          ],
        ),
      ),
    );
  }
}
