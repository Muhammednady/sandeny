import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/programs/controllers/programs_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

stagesList(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(ProgramsController());
  return SizedBox(
    width: 315,
    child: ListView.separated(
      itemCount: controller.getProgram.stages!.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(
                          right: AppPadding.p20,
                          top: AppPadding.p15,
                        )
                      : const EdgeInsets.only(
                          left: AppPadding.p20,
                          top: AppPadding.p15,
                        ),
                  child: Text(
                    isArabic
                        ? controller.getProgram.stages![index].name!.ar!
                        : controller.getProgram.stages![index].name!.en!,
                    style: getRegularStyle(
                      color: ColorsManager.mainColor,
                      fontSize: AppSize.s14,
                    ),
                  ),
                ),
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(
                          top: AppPadding.p20,
                          left: AppPadding.p15,
                        )
                      : const EdgeInsets.only(
                          top: AppPadding.p20,
                          right: AppPadding.p15,
                        ),
                  child: GestureDetector(
                    onTap: () {
                      controller.changeStageIndex(
                        controller.getProgram.stages![index].id!,
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'session1'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.primaryColor,
                            fontSize: AppSize.s12,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Obx(
                          () => controller.getProgram.stages![index].id! ==
                                  controller.stageIndex.value
                              ? SvgPicture.asset(
                                  Images.iconDown,
                                  width: 6,
                                  height: 6,
                                )
                              : SvgPicture.asset(
                                  Images.iconLeft,
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => controller.getProgram.stages![index].id! ==
                      controller.stageIndex.value
                  ? SizedBox(
                      width: 315,
                      child: Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(
                                top: AppPadding.p20,
                                right: AppPadding.p15,
                              )
                            : const EdgeInsets.only(
                                top: AppPadding.p20,
                                left: AppPadding.p15,
                              ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                isArabic
                                    ? controller.getProgram.stages![index]
                                        .description!.ar!
                                    : controller.getProgram.stages![index]
                                        .description!.en!,
                                style: getRegularStyle(
                                  color: ColorsManager.fontColor,
                                  fontSize: AppSize.s13,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ),
  );
}
