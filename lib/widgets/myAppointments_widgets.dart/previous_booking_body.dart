import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:sandeny/app/modules/myAppointments/controllers/my_appointments_controller.dart';
import 'package:sandeny/app/modules/myAppointments/views/empty_previous_appointment.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/images_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';
import 'package:sandeny/widgets/myAppointments_widgets.dart/booking_manegment.dart';

Widget previousBookingBody(BuildContext context) {
  var controller = Get.put(MyAppointmentsController());
  final isArabic = Get.locale!.languageCode == 'ar';
  return Obx(() {
    if (controller.isLoading.value == true) {
      return SizedBox(
        height: Get.height * 0.1,
        child: const Center(
          child: CircularProgressIndicator(
            color: ColorsManager.mainColor,
          ),
        ),
      );
    }
    return SizedBox(
      height: Get.height,
      width: 315,
      child: controller.appointmentHistoryList2.isEmpty
          ? emptyPreviousAppointments(context)
          : LazyLoadScrollView(
              onEndOfPage: () {
                if (controller.isMoreDataAvailable.value == true) {
                  controller.getPreviousAppointment(
                    0,
                    controller.previousAPageNumber.value,
                  );
                }
              },
              child: ListView.separated(
                controller: controller.scrollController2,
                itemCount: controller.appointmentHistoryList2.length,
                itemBuilder: (context, index) => Container(
                  height: 192,
                  width: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorsManager.borderColor,
                        offset: Offset(0, 0),
                        blurRadius: 7,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: isArabic
                                    ? const EdgeInsets.only(
                                        top: 10,
                                        right: 10,
                                      )
                                    : const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                      ),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.getAppointmentDetails(
                                      controller
                                          .appointmentHistoryList2[index].id!,
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: ColorsManager.greyColor,
                                    child: Image.network(
                                      controller
                                          .appointmentHistoryList2[index]
                                          .profileImage!,
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: isArabic
                                    ? const EdgeInsets.only(top: 20, left: 0)
                                    : const EdgeInsets.only(top: 20, right: 0),
                                child: Column(
                                  children: [
                                    Text(
                                      controller.appointmentHistoryList2[index]
                                          .doctorName
                                          .toString(),
                                      style: getRegularStyle(
                                        color: ColorsManager.blackColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      isArabic
                                          ? controller
                                              .appointmentHistoryList2[index]
                                              .specializations!
                                              .ar!
                                          : controller
                                              .appointmentHistoryList2[index]
                                              .specializations!
                                              .en!,
                                      style: getRegularStyle(
                                        color: ColorsManager.defaultGreyColor,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(left: 20)
                                : const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                bookingManagement(
                                  context,
                                  controller.appointmentHistoryList2[index],
                                );
                              },
                              child: SvgPicture.asset(
                                Images.menueIcon,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(
                                right: 25,
                              )
                            : const EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Images.alarmIcon,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'period'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.defaultGreyColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${controller.appointmentHistoryList2[index].duration} ${'Minute'.tr}',
                              style: getRegularStyle(
                                color: ColorsManager.blackColor,
                                fontSize: 12,
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
                                left: 50,
                                right: 25,
                              )
                            : const EdgeInsets.only(
                                left: 25,
                                right: 50,
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              Images.appointmentIcon2,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'appointment'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.defaultGreyColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                '${controller.appointmentHistoryList2[index].date}-${controller.appointmentHistoryList2[index].startAt}',
                                style: getRegularStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: 12,
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
                                left: 50,
                                right: 25,
                              )
                            : const EdgeInsets.only(
                                left: 25,
                                right: 50,
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              Images.videoIcon,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'appointment_type'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.defaultGreyColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                '${controller.appointmentHistoryList2[index].sessionType}',
                                style: getRegularStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: 12,
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
                                left: 50,
                                right: 23,
                              )
                            : const EdgeInsets.only(
                                left: 25,
                                right: 50,
                              ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Images.videoIcon,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'natural'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.defaultGreyColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${controller.appointmentHistoryList2[index].type}',
                              style: getRegularStyle(
                                color: ColorsManager.blackColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              ),
            ),
    );
  });
}