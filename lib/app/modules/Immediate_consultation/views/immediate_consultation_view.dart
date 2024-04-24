import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/immediate_consultation_widgets/choose_specialization_for_immediate_consultation.dart';
import '../../../../widgets/immediate_consultation_widgets/session_nature_widget.dart';
import '../../../../widgets/immediate_consultation_widgets/session_period_widget.dart';
import '../../../../widgets/search_widgets/rating_percentage.dart';
import '../../../../widgets/select_specialization_type/select_specialization_type.dart';
import '../../filter/controllers/filter_controller.dart';
import '../controllers/immediate_consultation_controller.dart';

class ImmediateConsultationView
    extends GetView<ImmediateConsultationController> {
  const ImmediateConsultationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var filterController = Get.put(FilterController());
    var controller =
        Get.put(ImmediateConsultationController(), permanent: true);

    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        title: Text(
          'immediate_consult'.tr,
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
              () => controller.iCList.isEmpty
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
                        chooseSpecializationFIC(context),

                        // choose Specialization Type
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(
                                  top: 10,
                                  right: 40,
                                )
                              : const EdgeInsets.only(
                                  top: 10,
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
                        selectSpecializationType(context, controller),
                        const SizedBox(
                          height: 5,
                        ),

                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(top: 10, right: 40)
                              : const EdgeInsets.only(top: 10, left: 40),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Images.personIcon,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'session_period'.tr,
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
                                  ? const EdgeInsets.only(top: 10, right: 45)
                                  : const EdgeInsets.only(top: 10, left: 60),
                              // choose Doctor Language widget
                              child: sessionPeriodWidget(context, controller),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        // Select Session Type widget
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
                                Images.videoIcon2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'session_nature'.tr,
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
                                  ? const EdgeInsets.only(top: 10, right: 45)
                                  : const EdgeInsets.only(top: 10, left: 60),
                              child: sessionNatureWidget(context, controller),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(top: 10, right: 40)
                              : const EdgeInsets.only(top: 10, left: 40),
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
                          height: 5,
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
                              ? const EdgeInsets.only(top: 10, right: 40)
                              : const EdgeInsets.only(top: 10, left: 40),

                          // choose rating percentage widget
                          child: ratingPercentage(context),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(right: 40)
                              : const EdgeInsets.only(left: 40),
                          child: Row(
                            children: [
                              Container(
                                width: 309,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: ColorsManager.greyColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 143,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color: ColorsManager.greyColor,
                                      ),
                                      child: Center(
                                        child: Obx(() {
                                          if (controller.isLoading.value ==
                                              true) {
                                            return const SizedBox();
                                          } else if (controller
                                                  .getSessionPData.data ==
                                              null) {
                                            return const SizedBox();
                                          } else {
                                            final sessionPeriod = controller
                                                .getSessionPData
                                                .data!
                                                .slot!
                                                .period!;
                                            final price = controller
                                                .getSessionPData
                                                .data!
                                                .slot!
                                                .price!;
                                            final periodTitle = isArabic
                                                ? sessionPeriod.title!.ar
                                                : sessionPeriod.title!.en;
                                            return Text(
                                              '$periodTitle ${'Min'.tr} / $price ${'SAR'.tr}',
                                              style: getRegularStyle(
                                                color: ColorsManager.blackColor,
                                                fontSize: 14,
                                              ),
                                            );
                                          }
                                        }),
                                      ),
                                    ),
                                    Obx(
                                      () => controller.sessionId.value != 0 &&
                                              filterController
                                                      .specializationId.value !=
                                                  0 &&
                                              controller
                                                      .sessionNatureId.value !=
                                                  0
                                          ? ButtonsManager.primaryButton(
                                              text:
                                                  'bedin_immediate_consultation'
                                                      .tr,
                                              onPressed: () {
                                                controller
                                                    .getAvailableDoctors();
                                              },
                                              context: context,
                                              fontSize: FontSizeManager.s14,
                                              minimumSize: const Size(166, 50),
                                              maximumSize: const Size(166, 50),
                                            )
                                          : ButtonsManager.primaryButton(
                                              text: 'book_appointment'.tr,
                                              onPressed: () {
                                                if (controller
                                                            .sessionId.value !=
                                                        0 &&
                                                    filterController
                                                            .specializationId
                                                            .value !=
                                                        0 &&
                                                    controller.sessionNatureId
                                                            .value !=
                                                        0) {}
                                              },
                                              fontSize: FontSizeManager.s14,
                                              context: context,
                                              minimumSize: const Size(166, 50),
                                              maximumSize: const Size(166, 50),
                                              buttonColor: Colors.grey,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
