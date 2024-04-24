import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sandeny/app/modules/filter/controllers/filter_controller.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/search_widgets/choose_doctor_gender.dart';
import '../../../../widgets/search_widgets/choose_specialization.dart';
import '../../../../widgets/search_widgets/rating_percentage.dart';
import '../../../../widgets/select_language/select_specialist_language.dart';
import '../../../../widgets/select_specialization_type/select_specialization_type.dart';
import '../../../../widgets/text_form_fields.dart';
import '../controllers/scheduled_session_controller.dart';

class ScheduledSessionView extends GetView<ScheduledSessionController> {
  const ScheduledSessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var controller = Get.put(ScheduledSessionController());
    final filterController = Get.put(FilterController());
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        title: Text(
          'session_features'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        backgroundColor: ColorsManager.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: AppPadding.p30)
              : const EdgeInsets.only(left: AppPadding.p30),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => controller.sSList.isEmpty
                  ? SizedBox(
                      height: Get.height * 0.5,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainColor,
                        ),
                      ),
                    )
                  : Column(
                      children: [
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
                                width: 5,
                              ),
                              Text(
                                'specialization'.tr,
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
                          child: consultationPriceDropDownBilateral(controller),
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
                          child: yearsOfExperienceDropDownBilateral(controller),
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
                              child: chooseDoctorGender(context, controller),
                            ),
                          ],
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
                                Images.languageIcon,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'language'.tr,
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
                                  ? const EdgeInsets.only(top: 10, right: 40)
                                  : const EdgeInsets.only(top: 10, left: 40),
                              // choose Doctor Language widget
                              child:
                                  selectSpecialistLanguage(context, controller),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // choose Specialization Type
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(
                                  top: 20,
                                  right: 40,
                                )
                              : const EdgeInsets.only(
                                  top: 20,
                                  left: 40,
                                ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Images.clinicIcon,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'specialization_type'.tr,
                                style: getMediumStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // choose Specialization Type widget
                        Row(
                          children: [
                            Padding(
                              padding: isArabic
                                  ? const EdgeInsets.only(right: 30)
                                  : const EdgeInsets.only(left: 30),
                              child:
                                  selectSpecializationType(context, controller),
                            ),
                          ],
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
                                Images.fileIcon,
                                color: ColorsManager.primaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'what_you_feel'.tr,
                                style: getMediumStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: controller.getData.data!.feelings!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        log(e.id.toString());
                                        controller.selectListItems(e.id!);
                                      },
                                      child: Obx(
                                        () => Container(
                                          height: 50,
                                          width: isArabic
                                              ? e.title!.ar!.length <= 6
                                                  ? e.title!.ar!.length * 15.0
                                                  : e.title!.ar!.length * 9.0
                                              : e.title!.en!.length <= 6
                                                  ? e.title!.en!.length * 15.0
                                                  : e.title!.en!.length * 9.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: controller.fellingsList
                                                    .contains(e.id!)
                                                ? ColorsManager.primaryColor
                                                : ColorsManager.greyColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              isArabic
                                                  ? e.title!.ar!
                                                  : e.title!.en!,
                                              style: getRegularStyle(
                                                color: controller.fellingsList
                                                        .contains(e.id!)
                                                    ? ColorsManager.whiteColor
                                                    : ColorsManager.fontColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
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
                        Obx(
                          () => filterController.specializationTypeId.value !=
                                      0 &&
                                  controller.specializationTypeId.value != 0
                              ? ButtonsManager.primaryButton(
                                  text: 'features_application'.tr,
                                  onPressed: () {
                                    controller.getAvailableDoctors();
                                  },
                                  context: context,
                                  minimumSize: const Size(287, 50),
                                  maximumSize: const Size(287, 50),
                                )
                              : ButtonsManager.primaryButton(
                                  text: 'features_application'.tr.tr,
                                  onPressed: () {
                                  },
                                  context: context,
                                  minimumSize: const Size(287, 50),
                                  maximumSize: const Size(287, 50),
                                  buttonColor: Colors.grey,
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
