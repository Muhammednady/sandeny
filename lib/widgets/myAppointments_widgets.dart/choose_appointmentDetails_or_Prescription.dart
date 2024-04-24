// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/myAppointments/controllers/my_appointments_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget chooseAppointmentDetailesorPrescriptionWidget(BuildContext context) {
  var controller = Get.put(MyAppointmentsController());
  int index = controller.selectIndex.value;
  return Stack(
    children: [
      Padding(
        padding: Get.locale!.languageCode == 'ar'
            ? const EdgeInsets.only(top: 20, left: 10)
            : const EdgeInsets.only(top: 20, left: 40),
        child: Obx(
          () => GestureDetector(
            onTap: () {
              controller.changeSelectIndex(index);
            },
            child: Container(
              width: 315,
              height: 42,
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
                      controller.changeSelectIndex(index = 0);
                      controller.selectIndex.value == 0;
                    },
                    child: Container(
                      width: Get.locale!.languageCode == 'ar' ? 150 : 196,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s50),
                        color: controller.selectIndex.value == 0
                            ? ColorsManager.primaryColor
                            : ColorsManager.whiteColor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: Text(
                                'apoointment_details'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: controller.selectIndex.value == 0
                                          ? ColorsManager.whiteColor
                                          : ColorsManager.fontColor,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
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
                      controller.changeSelectIndex(index = 1);
                      controller.selectIndex.value == 1;
                    },
                    child: Container(
                      width: Get.locale!.languageCode == 'ar' ? 150 : 114,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s50),
                        color: controller.selectIndex.value == 1
                            ? ColorsManager.primaryColor
                            : ColorsManager.whiteColor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'prescription'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: controller.selectIndex.value == 1
                                          ? ColorsManager.whiteColor
                                          : ColorsManager.fontColor,
                                    ),
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
