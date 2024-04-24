
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../app/modules/appointment_booking/controllers/appointment_booking_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

Widget availableScheduledDateAppointment(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.find<AppointmentBookingController>();
  // controller.getAvailableScheduledAppointment();
  return SizedBox(
    width: Get.width,
    height: 100,
    child: Padding(
      padding: isArabic
          ? const EdgeInsets.only(top: AppPadding.p20, right: AppPadding.p40)
          : const EdgeInsets.only(top: AppPadding.p20, left: AppPadding.p60),
      child: ListView.separated(
        shrinkWrap: true,
        controller: controller.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: controller.listOfDays.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.changeSelectedDate(index);
              controller.getAvailableScheduledAppointment();
              controller.selectedDate =
                  DateTime.now().add(Duration(days: index));
            },
            child: Obx(
              () => Container(
                height: 60,
                width: 59,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.currentDateSelectedIndex.value == index
                      ? ColorsManager.primaryColor
                      : ColorsManager.whiteColor,
                  border: Border.all(
                    color: ColorsManager.primaryColor,
                    width: 0.1,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      DateTime.now().add(Duration(days: index)).day.toString(),
                      style: TextStyle(
                          fontSize: FontSizeManager.s14,
                          fontWeight: FontWeight.w700,
                          color:
                              controller.currentDateSelectedIndex.value == index
                                  ? ColorsManager.whiteColor
                                  : ColorsManager.fontColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.listOfMonths[
                              DateTime.now().add(Duration(days: index)).month -
                                  1]
                          .toString(),
                      style: getSemiBoldStyle(
                        color:
                            controller.currentDateSelectedIndex.value == index
                                ? ColorsManager.whiteColor
                                : ColorsManager.fontColor,
                        fontSize: FontSizeManager.s12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    ),
  );
}
