import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/programs/controllers/programs_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

programObjectives(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(ProgramsController());
  return Obx(
    () => controller.isShowMoreObj.value == false
        ? SizedBox(
            width: 315,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
              itemCount: controller.getProgram.goals!.length,
              itemBuilder: (context, index) => Container(
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
                                    right: AppPadding.p20, top: AppPadding.p15)
                                : const EdgeInsets.only(
                                    left: AppPadding.p20, top: AppPadding.p15),
                            child: Text(
                              isArabic
                                  ? controller
                                      .getProgram.goals![index].name!.ar!
                                  : controller
                                      .getProgram.goals![index].name!.en!,
                              style: getRegularStyle(
                                color: ColorsManager.mainColor,
                                fontSize: AppSize.s14,
                                height: 2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              top: AppPadding.p10,
                              right: AppPadding.p10,
                              left: AppPadding.p10,
                            )
                          : const EdgeInsets.only(
                              top: AppPadding.p10,
                              left: AppPadding.p10,
                              right: AppPadding.p10,
                            ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              isArabic
                                  ? controller
                                      .getProgram.goals![index].description!.ar!
                                  : controller.getProgram.goals![index]
                                      .description!.en!,
                              style: getRegularStyle(
                                color: ColorsManager.fontColor,
                                fontSize: AppSize.s12,
                                height: 1.6,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.changeShowMoreObj();
                            },
                            child: Text(
                              'show_more'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.primaryColor,
                                fontSize: AppSize.s10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox(
            width: 315,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
              itemCount: controller.getProgram.goals!.length,
              itemBuilder: (context, index) => Container(
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
                                    right: AppPadding.p20, top: AppPadding.p15)
                                : const EdgeInsets.only(
                                    left: AppPadding.p20, top: AppPadding.p15),
                            child: Text(
                              isArabic
                                  ? controller
                                      .getProgram.goals![index].name!.ar!
                                  : controller
                                      .getProgram.goals![index].name!.en!,
                              style: getRegularStyle(
                                color: ColorsManager.mainColor,
                                fontSize: AppSize.s14,
                                height: 2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: AppPadding.p10,
                              left: AppPadding.p10,
                            )
                          : const EdgeInsets.only(
                              left: AppPadding.p10,
                              right: AppPadding.p10,
                            ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              isArabic
                                  ? controller
                                      .getProgram.goals![index].description!.ar!
                                  : controller.getProgram.goals![index]
                                      .description!.en!,
                              style: getRegularStyle(
                                color: ColorsManager.fontColor,
                                fontSize: AppSize.s12,
                                height: 2,
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
          ),
  );
}
