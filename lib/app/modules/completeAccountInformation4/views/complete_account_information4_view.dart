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
import '../controllers/complete_account_information4_controller.dart';

class CompleteAccountInformation4View
    extends GetView<CompleteAccountInformation4Controller> {
  const CompleteAccountInformation4View({Key? key}) : super(key: key);
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
                        '4-from-4'.tr,
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
                              'choose_habits'.tr,
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Obx(
                            () => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.isSelected.value =
                                        !controller.isSelected.value;
                                    if (controller.isSelected.value == true) {
                                      controller.selectHabits('smoking'.tr);
                                    } else {
                                      controller.selectHabits('smoking'.tr);
                                    }
                                  },
                                  child: controller.isSelected.value
                                      ? SvgPicture.asset(Images.selectIcon)
                                      : SvgPicture.asset(Images.unSelectIcon),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'smoking'.tr,
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: ColorsManager.primaryColor.withOpacity(0.2),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Drinking field
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Obx(
                            () => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.isSelected2.value =
                                        !controller.isSelected2.value;
                                    if (controller.isSelected2.value == true) {
                                      controller.selectHabits('drinking'.tr);
                                      // controller.habits.add('drinking'.tr);
                                      // storage.write('habits', controller.habits);
                                    } else {
                                      controller.selectHabits('drinking'.tr);
                                      // controller.habits.remove('drinking'.tr);
                                      // storage.write('habits', controller.habits);
                                    }
                                  },
                                  child: controller.isSelected2.value
                                      ? SvgPicture.asset(Images.selectIcon)
                                      : SvgPicture.asset(Images.unSelectIcon),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'drinking'.tr,
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: ColorsManager.primaryColor.withOpacity(0.2),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Drugs field
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Obx(
                            () => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.isSelected3.value =
                                        !controller.isSelected3.value;
                                    if (controller.isSelected3.value == true) {
                                      controller.selectHabits('take_drugs'.tr);
                                    } else {
                                      controller.selectHabits('take_drugs'.tr);
                                    }
                                  },
                                  child: controller.isSelected3.value
                                      ? SvgPicture.asset(Images.selectIcon)
                                      : SvgPicture.asset(Images.unSelectIcon),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'take_drugs'.tr,
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: ColorsManager.primaryColor.withOpacity(0.2),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Nothing field
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Obx(
                            () => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var storage = GetStorage();
                                    controller.isSelected4.value =
                                        !controller.isSelected4.value;
                                    if (controller.isSelected4.value == true) {
                                      controller.selectHabits('nothing'.tr);
                                    } else {
                                      controller.selectHabits('nothing'.tr);
                                    }
                                  },
                                  child: controller.isSelected4.value
                                      ? SvgPicture.asset(Images.selectIcon)
                                      : SvgPicture.asset(Images.unSelectIcon),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'nothing'.tr,
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorsManager.primaryColor.withOpacity(0.2),
                    ),
                    const SizedBox(
                      height: 10,
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
                      child: habitsDetailsWidget(
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
                              'genetic_diseases'.tr,
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
                                      controller.diseases.value = 1;
                                      log('diseases ${controller.diseases.value}');
                                    } else {
                                      controller.diseases.value = 0;
                                      log('diseases ${controller.diseases.value}');
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
                            'disease name'.tr,
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
                      child: diseasesDetailsWidget(
                        context,
                        controller,
                        ColorsManager.whiteColor,
                        'det'.tr,
                        ColorsManager.hintStyleColor,
                      ),
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
                        controller.checkCompleteProfile();
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
                            'save'.tr,
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
