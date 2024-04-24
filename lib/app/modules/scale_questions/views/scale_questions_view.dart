import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/scales/controllers/scales_controller.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/images_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';
import 'package:sandeny/constants/values_manager.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../widgets/Scale_widgets/exit_warning_widget.dart';
import '../controllers/scale_questions_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ScaleQuestionsView extends GetView<ScaleQuestionsController> {
  const ScaleQuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var scaleController = Get.put(ScalesController());
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      appBar: AppBar(
        title: Text(
          isArabic
              ? scaleController.getScale.name!.ar!
              : scaleController.getScale.name!.en!,
          style: getMediumStyle(
            color: ColorsManager.fontColor,
            fontSize: FontSizeManager.s14,
          ),
        ),
        backgroundColor: ColorsManager.greyColor,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: AppPadding.p20)
              : const EdgeInsets.only(left: AppPadding.p20),
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
        actions: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(
                    left: AppPadding.p20, top: AppPadding.p10)
                : const EdgeInsets.only(
                    right: AppPadding.p20, top: AppPadding.p10),
            child: GestureDetector(
              onTap: () {
                exitWorningWidget(context);
              },
              child: SvgPicture.asset(
                Images.crossIcon,
              ),
            ),
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(
                        right: AppPadding.p40, top: AppPadding.p10)
                    : const EdgeInsets.only(
                        left: AppPadding.p40, top: AppPadding.p10),
                child: Obx(
                  () => Text(
                    "${controller.currentQuestion.value} ${'from'.tr} ${scaleController.getScale.questionCount!}",
                    style: getRegularStyle(
                      color: ColorsManager.fontColor,
                      fontSize: FontSizeManager.s12,
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(
                      left: AppPadding.p50, top: AppPadding.p10)
                  : const EdgeInsets.only(
                      right: AppPadding.p50, top: AppPadding.p10),
              child: Text(
                "${scaleController.getScale.questionCount} ${'questions'.tr}",
                style: getRegularStyle(
                  color: ColorsManager.primaryColor,
                  fontSize: FontSizeManager.s12,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            right: Get.width * 0.1,
            left: Get.width * 0.13,
            top: AppPadding.p10,
          ),
          child: Obx(
            () => StepProgressIndicator(
              totalSteps: scaleController.getScale.questionCount!,
              currentStep: controller.currentQuestion.value,
              size: 6,
              padding: 0,
              selectedColor: ColorsManager.primaryColor,
              roundedEdges: const Radius.circular(10),
              unselectedGradientColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ColorsManager.whiteColor, ColorsManager.whiteColor],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: Get.width * 0.1,
            left: Get.width * 0.13,
            top: AppPadding.p10,
          ),
          child: Container(
            width: 315,
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(
                                left: AppPadding.p10,
                                right: AppPadding.p10,
                                // top: AppPadding.p10,
                              )
                            : const EdgeInsets.only(
                                right: AppPadding.p10,
                                left: AppPadding.p10,
                                // top: AppPadding.p10,
                              ),
                        child: Obx(
                          () => Text(
                            isArabic
                                ? scaleController
                                    .getScale
                                    .questions![
                                        controller.currentQuestionIndex.value]
                                    .name!
                                    .ar!
                                : scaleController
                                    .getScale
                                    .questions![
                                        controller.currentQuestionIndex.value]
                                    .name!
                                    .en!,
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s14,
                              height: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: Get.width * 0.1,
            left: Get.width * 0.13,
            top: AppPadding.p15,
          ),
          child: Container(
            width: 315,
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 300,
              width: 315,
              child: ListView.separated(
                itemCount: scaleController
                    .getScale
                    .questions![controller.currentQuestionIndex.value]
                    .answers!
                    .length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  var answer = scaleController
                      .getScale
                      .questions![controller.currentQuestionIndex.value]
                      .answers![index];
                  return Column(
                    children: [
                      // Answer 1
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppPadding.p10,
                          right: AppPadding.p5,
                          left: AppPadding.p5,
                        ),
                        child: Row(
                          children: [
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  HapticFeedback.lightImpact();

                                  controller.selectAnswerIndex(answer.id!);

                                  controller.selectAnswer(
                                    answer.id!,
                                    scaleController.getScale.id!,
                                    scaleController
                                        .getScale
                                        .questions![controller
                                            .currentQuestionIndex.value]
                                        .id!,
                                  );
                                },
                                child: Container(
                                  width: 287,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorsManager.greyColor,
                                    border: Border.all(
                                      color: answer.id !=
                                              controller.selectedAnswerId.value
                                          ? ColorsManager.greyColor
                                          : ColorsManager.primaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: isArabic
                                        ? const EdgeInsets.only(right: 20)
                                        : const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          isArabic
                                              ? answer.name!.ar!
                                              : answer.name!.en!,
                                          style: getRegularStyle(
                                              color: ColorsManager.blackColor,
                                              fontSize: FontSizeManager.s14),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(
                  left: AppPadding.p10,
                  top: AppPadding.p15,
                )
              : const EdgeInsets.only(
                  right: AppPadding.p10,
                  top: AppPadding.p15,
                ),
          child: SizedBox(
            width: 315,
            child: Row(
              children: [
                ButtonsManager.primaryButton(
                  text: 'next'.tr,
                  onPressed: () {
                    if (controller.currentQuestionIndex.value ==
                        scaleController.getScale.questions!.length - 1) {
                      log('done');
                      controller.submitAnswers();
                    } else {
                      controller.selectAnswerIndex(0);
                      controller.increaseQuestion();
                      controller.increment();
                      HapticFeedback.lightImpact();
                    }
                  },
                  context: context,
                  minimumSize: const Size(171, 50),
                  maximumSize: const Size(171, 50),
                ),
                const SizedBox(
                  width: 10,
                ),
                ButtonsManager.secondaryButton(
                  text: 'previous'.tr,
                  buttonColor: ColorsManager.whiteColor,
                  textColor: ColorsManager.fontColor,
                  minimumSize: const Size(134, 50),
                  maximumSize: const Size(134, 50),
                  onPressed: () {
                    if (controller.currentQuestionIndex.value == 0) {
                      controller.currentQuestionIndex.value = 1;
                      exitWorningWidget(context);
                    }
                    controller.selectAnswerIndex(0);
                    controller.decreaseQuestion();
                    controller.decrement();
                    HapticFeedback.lightImpact();
                  },
                  context: context,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
