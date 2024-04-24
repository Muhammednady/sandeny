import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/myAppointments/controllers/my_appointments_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

Widget chooseAppointmentType(BuildContext context) {
  var controller = Get.put(MyAppointmentsController());
  int index = controller.tabIndex.value;
  return Stack(
    children: [
      Padding(
        padding: Get.locale!.languageCode == 'ar'
            ? const EdgeInsets.only(top: 50, right: 40)
            : const EdgeInsets.only(top: 50, left: 40),
        child: Obx(
          () => GestureDetector(
            onTap: () {
              controller.changeTabIndex(index);
            },
            child: Container(
              width: 315,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppSize.s50,
                ),
                color: ColorsManager.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.changeTabIndex(index = 0);
                      controller.getNextAppointment(
                        1,
                        controller.nextAPageNumber.value = 1,
                      );
                    },
                    child: Container(
                      width: 101,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s50),
                        color: controller.tabIndex.value == 0
                            ? ColorsManager.primaryColor
                            : ColorsManager.whiteColor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'next_bookings'.tr,
                              style: getRegularStyle(
                                color: controller.tabIndex.value == 0
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.fontColor,
                                fontSize: FontSizeManager.s14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeTabIndex(index = 1);
                      controller.getPreviousAppointment(
                          0, controller.previousAPageNumber.value = 1);

                    },
                    child: Container(
                      width: 101,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s50),
                        color: controller.tabIndex.value == 1
                            ? ColorsManager.primaryColor
                            : ColorsManager.whiteColor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'previous_bookings'.tr,
                              style: getRegularStyle(
                                color: controller.tabIndex.value == 1
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.fontColor,
                                fontSize: FontSizeManager.s14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeTabIndex(index = 2);
                      controller.getAppointment(3);
                    },
                    child: Container(
                      width: 101,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s50),
                        color: controller.tabIndex.value == 2
                            ? ColorsManager.primaryColor
                            : ColorsManager.whiteColor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'cancelled_bookings'.tr,
                              style: getRegularStyle(
                                color: controller.tabIndex.value == 2
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.fontColor,
                                fontSize: FontSizeManager.s14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
