import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/bilateral_session_widgets/appointment_bilateral_session.dart';
import '../../../../widgets/scheduled_session_widgets/available_scheduled_date_appointment.dart';
import '../controllers/booking_scheduled_session_controller.dart';
import '../controllers/scheduled_session_controller.dart';

class Booking2ScheduledSessionView extends GetView {
  const Booking2ScheduledSessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    final controller = Get.put(ScheduledSessionController());
    final bookingScheduledSC = Get.put(BookingScheduledSessionController());
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
            availableScheduledDateAppointment(context),

            const SizedBox(
              height: 20,
            ),

            // body of appointment booking
            appointmentBookingBilateralBody(context),

            const SizedBox(
              height: 15,
            ),

            Container(
              width: 315,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.whiteColor,
                border: Border.all(
                  color: ColorsManager.darkGreyColor,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 315,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsManager.whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: ColorsManager.shadowColor,
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 20)
                          : const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'descripe_your_problem'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.mainColor,
                              fontSize: FontSizeManager.s15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 10, right: 25)
                        : const EdgeInsets.only(top: 10, left: 25),
                    child: Row(
                      children: [
                        Text(
                          'problem'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                            fontSize: FontSizeManager.s15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          )
                        : const EdgeInsets.only(
                            left: 20,
                            right: 30,
                          ),
                    child: Container(
                      height: 103,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: ColorsManager.greyColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          controller.problem = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: getRegularStyle(
                            color: const Color(0xFF646464),
                            fontSize: FontSizeManager.s13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 10, right: 25)
                        : const EdgeInsets.only(top: 10, left: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'attach_file'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          )
                        : const EdgeInsets.only(
                            left: 20,
                            right: 30,
                          ),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: ColorsManager.greyColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Obx(
                            () => controller.fileName.value == ''
                                ? const SizedBox()
                                : Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: isArabic
                                              ? const EdgeInsets.only(
                                                  right: 20, top: 10)
                                              : const EdgeInsets.only(
                                                  left: 20, top: 10),
                                          child: Text(
                                            controller.fileToDisplay.toString(),
                                            style: getRegularStyle(
                                              color: ColorsManager.errorColor,
                                              fontSize: FontSizeManager.s15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                          Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(
                                    top: 30,
                                  )
                                : const EdgeInsets.only(
                                    top: 30,
                                  ),
                            child: GestureDetector(
                              onTap: () => controller.requestPermission(),
                              child: SvgPicture.asset(
                                Images.attachFileIcon,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'attach'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.blackColor,
                              fontSize: FontSizeManager.s13,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
        child: ButtonsManager.primaryButton(
          text: 'book_appointment'.tr,
          onPressed: () {
            bookingScheduledSC.bookingScheduledSession();
          },
          context: context,
          maximumSize: const Size(315, 50),
          minimumSize: const Size(315, 50),
        ),
      ),
    );
  }
}
