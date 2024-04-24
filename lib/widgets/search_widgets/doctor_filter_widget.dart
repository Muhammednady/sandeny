import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/widgets/search_widgets/choose_doctor_gender.dart';
import 'package:sandeny/widgets/search_widgets/choose_doctor_gender_filter.dart';
import 'package:sandeny/widgets/search_widgets/rating_percentage.dart';

import '../../app/modules/filter/controllers/filter_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../text_form_fields.dart';
import 'choose_specialization.dart';

doctorFilter(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(FilterController());
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
      height: Get.height * 0.86,
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
                color: ColorsManager.lightGreyColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(
                    top: 30,
                  )
                : const EdgeInsets.only(
                    top: 30,
                  ),
            child: Text(
              'filter_by'.tr,
              style: getMediumStyle(
                color: ColorsManager.mainColor,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(
                    top: 30,
                    right: 40,
                  )
                : const EdgeInsets.only(
                    top: 30,
                    left: 40,
                  ),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.clinicIcon,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'clinic'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.blackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // choose PersonalOr Family Clinics widget
          chooseSpecialization(context),

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20, right: 40)
                : const EdgeInsets.only(top: 20, left: 40),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.priceIcon,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'consultation_price'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.blackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 330,
            child: consultationPriceDropDown(controller),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20, right: 40)
                : const EdgeInsets.only(top: 20, left: 40),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.sortIcon,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'years_of_experience'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.blackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 330,
            height: 60,
            child: yearsOfExperienceDropDown(controller),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20, right: 40)
                : const EdgeInsets.only(top: 20, left: 40),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.personIcon,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'doctor_gender'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.blackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(top: 20, right: 40)
                    : const EdgeInsets.only(top: 20, left: 40),
                // choose Doctor Gender widget
                // child: chooseDoctorGender(context, controller),
                child: chooseDoctorGenderFilter(context, controller),
              ),
            ],
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 30, right: 40)
                : const EdgeInsets.only(top: 30, left: 40),

            // choose rating percentage widget
            child: ratingPercentage(context),
          ),
          const SizedBox(
            height: 40,
          ),
          ButtonsManager.primaryButton(
            text: 'List-filter'.tr,
            onPressed: () {
              controller.checkSubmitFilter();
            },
            context: context,
            minimumSize: const Size(287, 50),
            maximumSize: const Size(287, 50),
          ),
        ],
      ),
    ),
  );
}
