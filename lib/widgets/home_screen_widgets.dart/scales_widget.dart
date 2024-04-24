import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/scales/controllers/scales_controller.dart';

import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

scalesWidget(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(ScalesController());
  return Row(
    children: [
      Padding(
        padding: isArabic
            ? const EdgeInsets.only(right: AppPadding.p40, top: AppPadding.p10)
            : const EdgeInsets.only(left: AppPadding.p40, top: AppPadding.p10),
        child: Obx(
          () => controller.scalesList.isEmpty
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
                  height: 150,
                  width: 153,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.scalesList.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller
                            .getScaleDetails(controller.scalesList[index].id!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.scalesList[index].image!,
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              ColorsManager.blackColor.withOpacity(0.1),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: isArabic
                                  ? const EdgeInsets.only(
                                      left: AppPadding.p30, top: AppPadding.p20)
                                  : const EdgeInsets.only(
                                      right: AppPadding.p30,
                                      top: AppPadding.p20),
                              child: isArabic
                                  ? Text(
                                      controller.scalesList[index].name!.ar!,
                                      style: getMediumStyle(
                                        color: ColorsManager.whiteColor,
                                        fontSize: AppSize.s14,
                                      ),
                                    )
                                  : Text(
                                      controller.scalesList[index].name!.en!,
                                      style: getMediumStyle(
                                        color: ColorsManager.whiteColor,
                                        fontSize: AppSize.s14,
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: isArabic
                                  ? const EdgeInsets.only(
                                      left: AppPadding.p70, top: AppPadding.p15)
                                  : const EdgeInsets.only(
                                      right: AppPadding.p70,
                                      top: AppPadding.p15),
                              child: Text(
                                '${controller.scalesList[index].questionCount!} ${'questions'.tr}'
                                    .toString(),
                                style: getRegularStyle(
                                  color: ColorsManager.whiteColor,
                                  fontSize: AppSize.s12,
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
      ),
    ],
  );
}
