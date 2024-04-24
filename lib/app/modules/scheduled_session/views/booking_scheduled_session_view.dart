import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/immediate_consultation_widgets/session_period_widget.dart';
import '../../appointment_booking/controllers/appointment_booking_controller.dart';
import '../controllers/scheduled_session_controller.dart';

class BookingScheduledSessionView extends GetView<ScheduledSessionController> {
  const BookingScheduledSessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    final appointmentBookingController =
        Get.put(AppointmentBookingController());
    return Scaffold(
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
            fontSize: FontSizeManager.s16,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
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
                    'bilateral_session_des'.tr,
                    style: getRegularStyle(
                      color: ColorsManager.fontColor,
                      fontSize: FontSizeManager.s14,
                      height: 1.5,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 345,
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
                  width: 340,
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
                          'session_data'.tr,
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
                      ? const EdgeInsets.only(top: 20, right: 20)
                      : const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Images.clockIcon,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'session_period'.tr,
                        style: getMediumStyle(
                          color: ColorsManager.blackColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              top: 10,
                              right: 12,
                            )
                          : const EdgeInsets.only(
                              top: 10,
                              left: 12,
                            ),
                      child: sessionPeriodWidget(context, controller),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.15,
          ),
          ButtonsManager.primaryButton(
            text: 'next'.tr,
            minimumSize: const Size(315, 50),
            maximumSize: const Size(315, 50),
            onPressed: () {
              appointmentBookingController.getAvailableScheduledAppointment();
            },
            context: context,
          )
        ],
      ),
    );
  }
}
