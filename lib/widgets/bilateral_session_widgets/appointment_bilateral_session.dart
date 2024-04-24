
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/appointment_booking/controllers/appointment_booking_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Widget appointmentBookingBilateralBody(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.find<AppointmentBookingController>();
  return SizedBox(
    height: 310,
    width: 315,
    child: Container(
      width: 315,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsManager.whiteColor,
        border: Border.all(
          color: ColorsManager.darkGreyColor,
        ),
      ),
      child: Obx(
        // make if statement here
        () => controller.isLoading.value == false
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              )
             :  controller.getAvailableAppointmentData.data!.isEmpty
            ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Center(
                child: Text(
                  'no_available_appointment'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                    fontSize: FontSizeManager.s14,
                  ),
                ),
              ),
            ),
          ],
        ): Column(
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
                      'good_time'.tr,
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
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount:
                controller.getAvailableAppointmentData.data!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(top: 10, right: 15)
                            : const EdgeInsets.only(top: 10, left: 15),
                        child: Obx(
                              () => GestureDetector(
                            onTap: () {
                              // controller.changeSelected();
                              controller.changeSelectedIndex(index);
                              controller.startAt.value = controller
                                  .getAvailableAppointmentData
                                  .data![index]
                                  .startAt!;
                              controller.endAt.value = controller
                                  .getAvailableAppointmentData
                                  .data![index]
                                  .endAt!;
                            },
                            child: Row(
                              children: [
                                controller.selected.value == index
                                    ? SvgPicture.asset(Images.selectIcon)
                                    : SvgPicture.asset(
                                    Images.unSelectIcon),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  isArabic
                                      ? '${controller.getAvailableAppointmentData.data![index].endAt!} - ${controller.getAvailableAppointmentData.data![index].startAt!}'
                                      : '${controller.getAvailableAppointmentData.data![index].startAt!} - ${controller.getAvailableAppointmentData.data![index].endAt!}',
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                    child: Divider(
                      color: ColorsManager.primaryColor.withOpacity(0.3),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
