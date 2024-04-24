import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/myAppointments/controllers/my_appointments_controller.dart';
import '../../app/modules/myAppointments/views/apointment_details_view.dart';
import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

bookingManagement2(BuildContext context) {
  var controller = Get.put(MyAppointmentsController());
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
      height: 220,
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
              top: 20,
            ),
            child: Container(
              width: 44,
              height: 6,
              decoration: const BoxDecoration(
                color: ColorsManager.greyColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(
                    top: 40,
                    right: 40,
                  )
                : const EdgeInsets.only(
                    top: 40,
                    left: 40,
                  ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // notComingAppointments(context, controller.appointment);
                  },
                  child: SvgPicture.asset(
                    Images.returnIcon,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'booking_new_appointment'.tr,
                    style: getMediumStyle(
                      color: ColorsManager.blackColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Divider(
              color: ColorsManager.primaryColor,
              thickness: 0.1,
            ),
          ),
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(
                    top: 10,
                    right: 40,
                  )
                : const EdgeInsets.only(
                    top: 10,
                    left: 40,
                  ),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const ApointmentDetailsView(index: 1));
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    Images.viewPrescription,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'view_prescription'.tr,
                    style: getMediumStyle(
                      color: ColorsManager.blackColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
