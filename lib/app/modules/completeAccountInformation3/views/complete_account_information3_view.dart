import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/text_form_fields.dart';
import '../../../routes/app_pages.dart';
import '../controllers/complete_account_information3_controller.dart';

class CompleteAccountInformation3View
    extends GetView<CompleteAccountInformation3Controller> {
  const CompleteAccountInformation3View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var isEnglish = Get.locale!.languageCode == 'en';
    var storage = GetStorage();
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.greyColor,
        elevation: 0,
        title: Text(
          'complete_information'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    height: 40,
                    width: 155,
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        '3-from-4'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.whiteColor,
                          fontSize: FontSizeManager.s13,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsManager.whiteColor,
                  border: Border.all(
                    color: ColorsManager.darkGreyColor,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 315,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorsManager.whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            color: ColorsManager.shadowColor,
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(right: 20)
                            : const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              'Q3'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.fontColor,
                                fontSize: FontSizeManager.s15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Obx(
                            () => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.selectQuestionIndex(index);
                                    controller.healthProblem = index;
                                    index;
                                    if (index == 0) {
                                      controller.healthProblem = 1;
                                      log(
                                          'healt Problem: ${controller.healthProblem}');
                                    } else {
                                      controller.healthProblem = 0;
                                      log(
                                          'healt Problem: ${controller.healthProblem}');
                                    }
                                  },
                                  child: controller.selectedIndex.value == index
                                      ? SvgPicture.asset(Images.selectIcon)
                                      : SvgPicture.asset(Images.unSelectIcon),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  controller.listOfAnswers[index],
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                          child: Divider(
                            color: ColorsManager.primaryColor.withOpacity(0.2),
                          ),
                        );
                      },
                      itemCount: controller.listOfAnswers.length,
                    ),
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 20)
                          : const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'other_details'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.mainColor,
                              fontSize: FontSizeManager.s15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: healthProblemWidget(
                          context,
                          controller,
                          ColorsManager.whiteColor,
                          'det'.tr,
                          ColorsManager.hintStyleColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Disability Question Widget

              Container(
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsManager.whiteColor,
                  border: Border.all(
                    color: ColorsManager.darkGreyColor,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 315,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorsManager.whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            color: ColorsManager.shadowColor,
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(right: 20)
                            : const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              'Q4'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.fontColor,
                                fontSize: FontSizeManager.s15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Obx(
                            () => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.selectQuestion2Index(index);
                                    if (index == 0) {
                                      controller.medication = 1;
                                      log(
                                          'medication1: ${controller.medication}');
                                    } else {
                                      controller.medication = 0;
                                      log(
                                          'medication2: ${controller.medication}');
                                    }
                                  },
                                  child: controller.selectedIndex2.value ==
                                          index
                                      ? SvgPicture.asset(Images.selectIcon)
                                      : SvgPicture.asset(Images.unSelectIcon),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  controller.listOfAnswers[index],
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                          child: Divider(
                            color: ColorsManager.primaryColor.withOpacity(0.2),
                          ),
                        );
                      },
                      itemCount: controller.listOfAnswers.length,
                    ),
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 20)
                          : const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'medicament name'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.mainColor,
                              fontSize: FontSizeManager.s15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: medicationWidget(
                          context,
                          controller,
                          ColorsManager.whiteColor,
                          'det'.tr,
                          ColorsManager.hintStyleColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: isEnglish
                    ? const EdgeInsets.only(
                        top: AppPadding.p30, left: AppPadding.p20)
                    : const EdgeInsets.only(
                        top: AppPadding.p30, right: AppPadding.p12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.COMPLETE_ACCOUNT_INFORMATION4);
                      },
                      child: Container(
                        width: 174,
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'next'.tr,
                            textAlign: TextAlign.center,
                            style: getRegularStyle(
                              color: ColorsManager.whiteColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorsManager.lightGreyColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'previous'.tr,
                            textAlign: TextAlign.center,
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
