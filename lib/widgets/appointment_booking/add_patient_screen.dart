import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/styles_manager.dart';
import 'package:sandeny/widgets/appointment_booking/relative-relation-widget.dart';

import '../../app/modules/appointment_booking/controllers/appointment_booking_controller.dart';
import '../../constants/buttons_manager.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/values_manager.dart';
import '../text_form_fields.dart';

addPatient(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var isEnglish = Get.locale!.languageCode == 'en';
  var controller = Get.find<AppointmentBookingController>();
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
    builder: (BuildContext context) {
      return Container(
        height: Get.height * 0.90,
        width: Get.width,
        decoration: const BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 20)
                      : const EdgeInsets.only(top: 20),
                  child: Text(
                    'add_another_patient'.tr,
                    style: getSemiBoldStyle(
                      color: ColorsManager.mainColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p40)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'first_name'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(top: 10, left: AppPadding.p30)
                          : const EdgeInsets.only(
                              top: 10,
                              right: AppPadding.p20,
                            ),
                      child: firstNameFormField(
                        context,
                        controller,
                        ColorsManager.greyColor,
                        'first_name'.tr,
                        ColorsManager.defaultGreyColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p40)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'last_name'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(top: 10, left: AppPadding.p30)
                          : const EdgeInsets.only(
                              top: 10,
                              right: AppPadding.p20,
                            ),
                      child: lastNameFormField(
                        context,
                        controller,
                        ColorsManager.greyColor,
                        'last_name'.tr,
                        ColorsManager.defaultGreyColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p40)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'birth_date'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: isEnglish
                      ? const EdgeInsets.only(top: 10, right: AppPadding.p40)
                      : const EdgeInsets.only(top: 10, left: AppPadding.p8),
                  child: birthDateWidget(
                    context,
                    controller,
                    ColorsManager.greyColor,
                    'birth_date'.tr,
                    ColorsManager.defaultGreyColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p40)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'sex'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Types of sex male or female
                selectGender(context, controller),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p40)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'relative-relation'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                relativeRelationDropDown(context),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p40)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'phone_number'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: isEnglish
                      ? const EdgeInsets.only(right: AppPadding.p40)
                      : const EdgeInsets.only(right: 0),
                  child: phoneNumberFormField(
                      context,
                      controller,
                      ColorsManager.greyColor,
                      'phone_number'.tr,
                      ColorsManager.defaultGreyColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p40)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'identity_number'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // identity number text field widget
                Padding(
                  padding: isEnglish
                      ? const EdgeInsets.only(right: AppPadding.p40)
                      : const EdgeInsets.only(right: 0),
                  child: identityFormField(
                      context,
                      controller,
                      ColorsManager.greyColor,
                      'igama_number'.tr,
                      ColorsManager.defaultGreyColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonsManager.primaryButton(
                    text: 'add_button'.tr,
                    onPressed: () {
                      // if (controller.formKey.currentState!.validate()) {
                      //   controller.addPatient();
                    },
                    context: context),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
