import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/appointment_booking/controllers/appointment_booking_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget choosePatientGender(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var isEnglish = Get.locale!.languageCode == 'en';
  var controller = Get.put(AppointmentBookingController());
  return Padding(
    padding: isEnglish
        ? const EdgeInsets.only(left: AppPadding.p40)
        : const EdgeInsets.only(right: AppPadding.p40),
    child: Row(
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.gender1.value = !controller.gender1.value;
              controller.selectGender1 = controller.gender1.value;
            },
            child: Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s50),
                color: controller.gender1.value == true
                    ? ColorsManager.primaryColor
                    : ColorsManager.lightGreyColor,
              ),
              child: Center(
                child: Text(
                  'male'.tr,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: controller.gender1.value == true
                            ? ColorsManager.whiteColor
                            : ColorsManager.fontColor,
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.gender2.value = !controller.gender2.value;
              controller.selectGender2 = controller.gender2.value;
            },
            child: Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s50),
                color: controller.gender2.value == true
                    ? ColorsManager.primaryColor
                    : ColorsManager.lightGreyColor,
              ),
              child: Center(
                child: Text(
                  'female'.tr,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: controller.gender2.value == true
                            ? ColorsManager.whiteColor
                            : ColorsManager.fontColor,
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
