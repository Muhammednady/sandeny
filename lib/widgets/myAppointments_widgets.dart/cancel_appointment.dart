import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/myAppointments/controllers/my_appointments_controller.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Future cancellApoointment(BuildContext context, int index) {
  final controller = Get.put(MyAppointmentsController());
  return showModalBottomSheet(
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (context) => Container(
      height: 355,
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Container(
              width: 44,
              height: 6,
              decoration: const BoxDecoration(
                color: ColorsManager.defaultGreyColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: ColorsManager.greyColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Images.cancelAppointmentIcon,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'cancel_appointment'.tr,
            style: getMediumStyle(
              color: ColorsManager.mainColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'cancel_appointment_message'.tr,
                    style: getRegularStyle(
                      color: ColorsManager.fontColor,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(
                    top: 10,
                    right: 60,
                  )
                : const EdgeInsets.only(
                    top: 10,
                    left: 80,
                  ),
            child: Row(
              children: [
                ButtonsManager.primaryButton(
                  text: "to-retreat".tr,
                  onPressed: () {
                    Get.back();
                  },
                  context: context,
                  maximumSize: const Size(124, 50),
                  minimumSize: const Size(124, 50),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    controller.canceleAppointment(index);
                  },
                  child: Container(
                    height: 50,
                    width: Get.locale!.languageCode == 'ar' ? 124 : 155,
                    decoration: BoxDecoration(
                      color: ColorsManager.whiteColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: ColorsManager.defaultGreyColor,
                      ),
                    ),
                    child: Padding(
                      padding: Get.locale!.languageCode == 'ar'
                          ? const EdgeInsets.only(
                              right: 20,
                            )
                          : const EdgeInsets.only(
                              left: 10,
                            ),
                      child: Row(
                        children: [
                          Text(
                            'cancel_appointment'.tr,
                            style: getMediumStyle(
                              color: ColorsManager.defaultGreyColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
