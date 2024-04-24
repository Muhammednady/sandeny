import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:sandeny/widgets/home_screen_widgets.dart/show_case_widget.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../app/modules/home/controllers/home_controller.dart';
import '../../app/routes/app_pages.dart';
import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

Widget clinicsWidget(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.find<HomeController>();
  final IsFirstRun isFirstRun = IsFirstRun();

  // ignore: unrelated_type_equality_checks
  if (isFirstRun == true) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    ShowCaseWidget.of(context).startShowCase([
      controller.globalKeyOne,
    ]);
  });
  }

  return Row(
    children: [
      Padding(
        padding: isArabic
            ? const EdgeInsets.only(top: AppPadding.p10, right: AppPadding.p60)
            : const EdgeInsets.only(top: AppPadding.p10, left: AppPadding.p40),
        child: Obx(
          () => controller.specializationList.isEmpty
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
                  height: 40,
                  width: Get.width * 0.8,
                  child: ListView.separated(
                    itemCount: controller.specializationList.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 20,
                      );
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.setSpecificationData =
                              controller.specializationList;
                          controller.getDoctorSpecificationId(
                              id: controller.specializationList[index].id!);
                          Get.toNamed(Routes.DOCTORS,
                              arguments:
                                  controller.specializationList[index].id!);
                        },
                        // ignore: unrelated_type_equality_checks
                        child: isFirstRun == true ?
                        ShowCaseView(
                          // description: 'explore_specifications_doctors'.tr,
                          description: '',
                          globalKey: controller.globalKeyOne,
                          title: 'explore_specifications_doctors'.tr,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorsManager.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: ColorsManager.borderColor,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: AppPadding.p10,
                                    right: AppPadding.p10,
                                  ),
                                  child: Text(
                                    isArabic
                                        ? controller
                                            .specializationList[index].name!.ar!
                                        : controller.specializationList[index]
                                            .name!.en!,
                                    style: getMediumStyle(
                                      color: index == 0
                                          ? ColorsManager.primaryColor
                                          : ColorsManager.mainColor,
                                      fontSize: AppSize.s14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ): Container(
                            decoration: BoxDecoration(
                              color: ColorsManager.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: ColorsManager.borderColor,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: AppPadding.p10,
                                    right: AppPadding.p10,
                                  ),
                                  child: Text(
                                    isArabic
                                        ? controller
                                            .specializationList[index].name!.ar!
                                        : controller.specializationList[index]
                                            .name!.en!,
                                    style: getMediumStyle(
                                      color: index == 0
                                          ? ColorsManager.primaryColor
                                          : ColorsManager.mainColor,
                                      fontSize: AppSize.s14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                      );
                    },
                  ),
                ),
        ),
      ),
    ],
  );
}