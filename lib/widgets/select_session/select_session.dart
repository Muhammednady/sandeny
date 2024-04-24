import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../app/modules/bilateral_session/views/bilateral_session_filter_view.dart';
import '../../app/modules/home/controllers/home_controller.dart';
import '../../app/routes/app_pages.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../home_screen_widgets.dart/show_case_widget.dart';

Widget selectSessionWidget(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.find<HomeController>();
  final IsFirstRun isFirstRun = IsFirstRun();
  // ignore: unrelated_type_equality_checks
  if (isFirstRun == true) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context).startShowCase([
        controller.globalKeyTwo,
        controller.globalKeyThree,
        controller.globalKeyFour,
      ]);
    });
  }

  return SizedBox(
    width: 311,
    child: Column(
      children: [
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: 5)
              : const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.IMMEDIATE_CONSULTATION);
                },
                // ignore: unrelated_type_equality_checks
                child: isFirstRun == true ?
                ShowCaseView(
                  description: 'booking_immediate_session_des'.tr,
                  globalKey: controller.globalKeyTwo,
                  title: 'booking_immediate_session'.tr,
                  child: Container(
                    width: 311,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsManager.whiteColor,
                      border: Border.all(
                        color: ColorsManager.greyColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 10)
                          : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color:
                                  ColorsManager.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: SvgPicture.asset(Images.clockIcon),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'immediate_consult'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.blackColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
                : Container(
                    width: 311,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsManager.whiteColor,
                      border: Border.all(
                        color: ColorsManager.greyColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 10)
                          : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color:
                                  ColorsManager.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: SvgPicture.asset(Images.clockIcon),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'immediate_consult'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.blackColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          )
                        ],
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
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SCHEDULED_SESSION);
              },
              // ignore: unrelated_type_equality_checks
              child: isFirstRun == true
                  ? ShowCaseView(
                      description: 'booking_scheduled_session_des'.tr,
                      globalKey: controller.globalKeyThree,
                      title: 'booking_scheduled_session'.tr,
                      child: Container(
                        width: 311,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorsManager.whiteColor,
                          border: Border.all(
                              color: ColorsManager.greyColor, width: 2),
                        ),
                        child: Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(right: 10)
                              : const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color:
                                      ColorsManager.mainColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    Images.calenderIcon,
                                    color: ColorsManager.mainColor,
                                    height: 15,
                                    width: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'schedule_consult'.tr,
                                style: getRegularStyle(
                                    color: ColorsManager.blackColor,
                                    fontSize: FontSizeManager.s14),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: 311,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorsManager.whiteColor,
                        border: Border.all(
                            color: ColorsManager.greyColor, width: 2),
                      ),
                      child: Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(right: 10)
                            : const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: ColorsManager.mainColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  Images.calenderIcon,
                                  color: ColorsManager.mainColor,
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'schedule_consult'.tr,
                              style: getRegularStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: FontSizeManager.s14),
                            )
                          ],
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
            GestureDetector(
              onTap: () {
                Get.to(const BilateralSessionFilterView());
              },
              // ignore: unrelated_type_equality_checks
              child: isFirstRun == true ?
               ShowCaseView(
                description: 'booking_bilateral_session_des'.tr,
                globalKey: controller.globalKeyFour,
                title: 'booking_bilateral_session'.tr,
                child: Container(
                  width: 311,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.whiteColor,
                    border:
                        Border.all(color: ColorsManager.greyColor, width: 2),
                  ),
                  child: Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(right: 10)
                        : const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: ColorsManager.blueColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              Images.twoPersonIcon,
                              color: ColorsManager.blueColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'bilateralـsession'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: FontSizeManager.s14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
              : Container(
                  width: 311,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.whiteColor,
                    border:
                        Border.all(color: ColorsManager.greyColor, width: 2),
                  ),
                  child: Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(right: 10)
                        : const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: ColorsManager.blueColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              Images.twoPersonIcon,
                              color: ColorsManager.blueColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'bilateralـsession'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: FontSizeManager.s14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ],
    ),
  );
}
