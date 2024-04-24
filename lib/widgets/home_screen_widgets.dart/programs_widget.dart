import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/programs/controllers/programs_controller.dart';

import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

programsWidget(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(ProgramsController());
  return Row(
    children: [
      Padding(
        padding: isArabic
            ? const EdgeInsets.only(right: AppPadding.p40, top: AppPadding.p10)
            : const EdgeInsets.only(left: AppPadding.p40, top: AppPadding.p10),
        child: Obx(
          () => controller.programsList.isEmpty
              ? SizedBox(
                  height: 40,
                  width: Get.width * 0.6,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainColor,
                    ),
                  ),
                )
              : SizedBox(
                  width: Get.width * 0.8,
                  height: 196,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.programsList.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => Container(
                      width: 153,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            ColorsManager.blackColor.withOpacity(0.4),
                            BlendMode.darken,
                          ),
                          image: NetworkImage(
                            controller.programsList[index].image!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(
                                    right: AppPadding.p5,
                                    top: AppPadding.p10,
                                    left: AppPadding.p5,
                                  )
                                : const EdgeInsets.only(
                                    right: AppPadding.p5,
                                    top: AppPadding.p10,
                                    left: AppPadding.p5,
                                  ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    isArabic
                                        ? controller
                                            .programsList[index].title!.ar!
                                        : controller
                                            .programsList[index].title!.en!,
                                    style: getMediumStyle(
                                      color: ColorsManager.whiteColor,
                                      fontSize: AppSize.s14,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(
                                    left: AppPadding.p70, top: AppPadding.p15)
                                : const EdgeInsets.only(
                                    right: AppPadding.p70, top: AppPadding.p15),
                            child: Text(
                              '${controller.programsList[index].stagesCount!} ${'stages'.tr}',
                              style: getRegularStyle(
                                color: ColorsManager.whiteColor,
                                fontSize: AppSize.s12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.getProgramDetails(
                                  controller.programsList[index].id!);
                            },
                            child: Container(
                              width: 135,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: ColorsManager.whiteColor,
                              ),
                              child: Center(
                                child: Text(
                                  'join_now'.tr,
                                  style: getRegularStyle(
                                    color: ColorsManager.primaryColor,
                                    fontSize: AppSize.s12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    ],
  );
}
