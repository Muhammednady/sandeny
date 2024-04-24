import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/programs/controllers/programs_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

aboutProgram(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(ProgramsController());
  return Obx(
    () => controller.isShowMore.value == false
        ? Container(
            width: 315,
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: AppPadding.p20, top: AppPadding.p15)
                          : const EdgeInsets.only(
                              left: AppPadding.p20, top: AppPadding.p15),
                      child: Text(
                        'about_program'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: AppSize.s14,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Divider(),
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
                              ? controller.getProgram.overview!.ar!
                              : controller.getProgram.overview!.en!,
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
                          controller.changeShowMore();
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
          )
        : Container(
            width: 315,
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: AppPadding.p20, top: AppPadding.p15)
                          : const EdgeInsets.only(
                              left: AppPadding.p20, top: AppPadding.p15),
                      child: Text(
                        'about_program'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: AppSize.s14,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Divider(),
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
                          'about_program_des'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                            fontSize: AppSize.s12,
                            height: 2,
                            overflow: TextOverflow.ellipsis,
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
  );
}
