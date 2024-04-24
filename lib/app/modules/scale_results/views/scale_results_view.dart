
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sandeny/app/modules/home/controllers/home_controller.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../scale_questions/controllers/scale_questions_controller.dart';
import '../../scales/controllers/scales_controller.dart';
import '../controllers/scale_results_controller.dart';

class ScaleResultsView extends GetView<ScaleResultsController> {
  const ScaleResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale!.languageCode == 'ar';
    final scaleQuestionController = Get.put(ScaleQuestionsController());
    final scaleController = Get.put(ScalesController());
    final homeController = Get.put(HomeController());
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
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(right: AppPadding.p40)
                    : const EdgeInsets.only(left: AppPadding.p40),
                child: Text(
                  'result'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                    fontSize: FontSizeManager.s12,
                  ),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${scaleQuestionController.getScaleResult.result}%',
                style: getRegularStyle(
                  color: ColorsManager.primaryColor,
                  fontSize: FontSizeManager.s17,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: Get.width * 0.1,
              left: Get.width * 0.13,
            ),
            child: StepProgressIndicator(
              totalSteps: scaleQuestionController.getScaleResult.finalScore!,
              currentStep: scaleQuestionController.getScaleResult.result!,
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: Get.width * 0.1,
              left: Get.width * 0.13,
            ),
            child: Container(
              width: 315,
              decoration: BoxDecoration(
                color: ColorsManager.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(
                                right: AppPadding.p15,
                              )
                            : const EdgeInsets.only(
                                left: AppPadding.p15,
                              ),
                        child: Text(
                          'scale_result'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                            fontSize: FontSizeManager.s15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(
                                  right: AppPadding.p15,
                                  left: AppPadding.p15,
                                )
                              : const EdgeInsets.only(
                                  right: AppPadding.p15,
                                  left: AppPadding.p15,
                                ),
                          child: Text(
                            isArabic
                                ? scaleQuestionController
                                    .getScaleResult.description!.ar!
                                : scaleQuestionController
                                    .getScaleResult.description!.en!,
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s12,
                              height: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(
                                  right: AppPadding.p15,
                                  left: AppPadding.p15,
                                )
                              : const EdgeInsets.only(
                                  right: AppPadding.p15,
                                  left: AppPadding.p15,
                                ),
                          child: Text(
                            'scale_result_description'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s12,
                              height: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(
                                right: AppPadding.p15,
                              )
                            : const EdgeInsets.only(
                                left: AppPadding.p15,
                              ),
                        child: Text(
                          'discuss_with_specialist'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                            fontSize: FontSizeManager.s15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonsManager.primaryButton(
                    text: 'choose_specialist'.tr,
                    onPressed: () {
                      homeController.getDoctorSpecificationId(
                              id: homeController.getSpecificationData[0].id!);
                          Get.toNamed(Routes.DOCTORS,
                              arguments:
                                  homeController.getSpecificationData[0].id!);
                    },
                    minimumSize: const Size(244, 50),
                    maximumSize: const Size(244, 50),
                    context: context,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
