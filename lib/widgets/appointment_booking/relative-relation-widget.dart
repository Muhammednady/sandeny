import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/appointment_booking/controllers/appointment_booking_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

Widget relativeRelationDropDown(BuildContext context) {
  var controller = Get.put(AppointmentBookingController());
  var isEnglish = Get.locale!.languageCode == 'en';
  return Padding(
    padding: isEnglish
        ? const EdgeInsets.only(right: AppPadding.p40)
        : const EdgeInsets.only(right: 0),
    child: DropdownButtonHideUnderline(
      child: Obx(
        (() => DropdownButton2(
              isExpanded: true,
              hint: Text(
                controller.listOfRelativeRelation.first,
                style: getRegularStyle(
                  color: ColorsManager.defaultGreyColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
              items: controller
                  .addDividersAfterItems(controller.listOfRelativeRelation),
              customItemsHeights: controller.getCustomItemsHeights(),
              value: controller.relationType.value,
              onChanged: (value) {
                controller.selectRelation(value!);
              },
              buttonHeight: 50,
              buttonWidth: 315,
              itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              buttonPadding: const EdgeInsets.only(left: 20, right: 20),
              buttonDecoration: BoxDecoration(
                color: ColorsManager.greyColor,
                borderRadius: BorderRadius.circular(50),
              ),
              dropdownDecoration: BoxDecoration(
                color: ColorsManager.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
            )),
      ),
    ),
  );
}
