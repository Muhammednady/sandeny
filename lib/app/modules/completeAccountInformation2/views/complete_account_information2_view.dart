import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/text_form_fields.dart';
import '../controllers/complete_account_information2_controller.dart';

class CompleteAccountInformation2View
    extends GetView<CompleteAccountInformation2Controller> {
  const CompleteAccountInformation2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var isEnglish = Get.locale!.languageCode == 'en';
    var controller = Get.put(CompleteAccountInformation2Controller());
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      body: SingleChildScrollView(
        child: Form(
          child: GetBuilder(
              init: controller,
              builder: (context) {
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: AppPadding.p50, right: 30),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.offNamed('/home');
                            },
                            child: Text(
                              'skip'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.fontColor,
                                fontSize: FontSizeManager.s14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'complete_information'.tr,
                              style: getMediumStyle(
                                color: ColorsManager.mainColor,
                                fontSize: FontSizeManager.s15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            child: GetX(
                              init: controller,
                              builder: (context) {
                                return controller.questionsData.isNotEmpty
                                    ? Text(
                                        '${controller.questionsData[0].currentPage} ${'from'.tr} ${controller.questionsData[0].lastPage} ${'complete_medical_profile'.tr}',
                                        style: getRegularStyle(
                                          color: ColorsManager.whiteColor,
                                          fontSize: FontSizeManager.s13,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    : const SizedBox();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      if (controller.isLoading.value == true) {
                        EasyLoading.show(status: 'loading'.tr);
                      }
                      return controller.medicalQList.isNotEmpty
                          ? SizedBox(
                              height: Get.height * 0.6,
                              width: 315,
                              child: ListView.separated(
                                itemCount: controller.medicalQList.length,
                                itemBuilder: (context, index) => Container(
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
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 315,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              Expanded(
                                                child: Text(
                                                  isArabic
                                                      ? controller
                                                          .medicalQList[index]
                                                          .question!
                                                          .ar
                                                          .toString()
                                                      : controller
                                                          .medicalQList[index]
                                                          .question!
                                                          .en
                                                          .toString(),
                                                  style: getRegularStyle(
                                                    color:
                                                        ColorsManager.fontColor,
                                                    fontSize:
                                                        FontSizeManager.s15,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
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
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .medicalQList[index]
                                            .answersList!
                                            .length,
                                        itemBuilder: (context, i) {
                                          var id = controller
                                              .medicalQList[index]
                                              .answersList![i]
                                              .id!;

                                          var selectIsMultiple = controller
                                              .medicalQList[index].isMultiple!;

                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Obx(
                                              () => Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (index == 0) {
                                                        controller
                                                            .selectMultipleAnswers(
                                                                id);
                                                      } else {
                                                        controller
                                                            .selectAnswers(id);
                                                      }
                                                    },
                                                    child: index == 0
                                                        ? controller
                                                                .listOfAnswers
                                                                .contains(id)
                                                            ? SvgPicture.asset(
                                                                Images
                                                                    .selectIcon,
                                                              )
                                                            : SvgPicture.asset(
                                                                Images
                                                                    .unSelectIcon,
                                                              )
                                                        : controller
                                                                .listOfAnswers2
                                                                .contains(id)
                                                            ? SvgPicture.asset(
                                                                Images
                                                                    .selectIcon,
                                                              )
                                                            : SvgPicture.asset(
                                                                Images
                                                                    .unSelectIcon,
                                                              ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    isArabic
                                                        ? controller
                                                                .medicalQList[
                                                                    index]
                                                                .answersList![i]
                                                                .answers!
                                                                .ar
                                                                ?.toString() ??
                                                            ''
                                                        : controller
                                                                .medicalQList[
                                                                    index]
                                                                .answersList![i]
                                                                .answers!
                                                                .en
                                                                ?.toString() ??
                                                            '',
                                                    style: getRegularStyle(
                                                      color: ColorsManager
                                                          .fontColor,
                                                      fontSize:
                                                          FontSizeManager.s15,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                              color: ColorsManager.primaryColor
                                                  .withOpacity(0.2),
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
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
                                        child: index == 0
                                            ? psychiatristDetailsWidget(
                                                context,
                                                controller,
                                                ColorsManager.whiteColor,
                                                'det'.tr,
                                                ColorsManager.hintStyleColor,
                                              )
                                            : disabilityDetailsWidget(
                                                context,
                                                controller,
                                                ColorsManager.whiteColor,
                                                'det'.tr,
                                                ColorsManager.hintStyleColor,
                                              ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                              ),
                            )
                          : SizedBox(
                              height: Get.height * 0.6,
                            );
                    }),
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
                              controller.sendMedicalAnswers();
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
                              if (controller.questionsData[0].currentPage ==
                                  1) {
                                Get.offAllNamed(Routes.HOME);
                              }
                              controller.goToPreviousPage();
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
                );
              }),
        ),
      ),
    );
  }
}
