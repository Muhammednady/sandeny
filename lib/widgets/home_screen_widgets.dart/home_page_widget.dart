import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/widgets/home_screen_widgets.dart/clincs_widget.dart';
import 'package:sandeny/widgets/home_screen_widgets.dart/home_header.dart';
import 'package:sandeny/widgets/home_screen_widgets.dart/scales_widget.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../app/modules/home/controllers/home_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';
import '../select_session/select_session.dart';

homePage(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';

  return Column(
    children: [
      // home header
      homeHeaderWidget(context),

      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CarouselSlider(
              //   items: controller.imgList
              //       .map(
              //         (item) => SizedBox(
              //           child: Center(
              //             child: Image.asset(
              //               item,
              //               fit: BoxFit.cover,
              //               width: 1000,
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              //   options: CarouselOptions(
              //     autoPlay: true,
              //     enlargeCenterPage: true,
              //     aspectRatio: 2.0,
              //     onPageChanged: (index, reason) {},
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(
                            right: AppPadding.p40, top: AppPadding.p10)
                        : const EdgeInsets.only(
                            left: AppPadding.p40, top: AppPadding.p10),
                    child: Text(
                      'specialities'.tr,
                      style: getMediumStyle(
                        color: ColorsManager.blackColor,
                        fontSize: AppSize.s15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // Clinics Card  widget
              ShowCaseWidget(
                builder: Builder(
                  builder: (context) => clinicsWidget(context)
                ),
                ),

              Row(
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(
                            right: AppPadding.p40, top: AppPadding.p40)
                        : const EdgeInsets.only(
                            left: AppPadding.p40, top: AppPadding.p40),
                    child: Text(
                      'select_session'.tr,
                      style: getMediumStyle(
                        color: ColorsManager.blackColor,
                        fontSize: AppSize.s15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ShowCaseWidget(
                builder: Builder(
                  builder: (context) => selectSessionWidget(context)
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(
                            right: AppPadding.p40, top: AppPadding.p30)
                        : const EdgeInsets.only(
                            left: AppPadding.p40, top: AppPadding.p30),
                    child: Text(
                      'scales'.tr,
                      style: getMediumStyle(
                        color: ColorsManager.blackColor,
                        fontSize: AppSize.s15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(
                            left: AppPadding.p40, top: AppPadding.p30)
                        : const EdgeInsets.only(
                            right: AppPadding.p40, top: AppPadding.p30),
                    child: TextButton(
                      onPressed: () {
                        // Get.toNamed(Routes.DOCTORS, arguments: 0);
                      },
                      child: Text(
                        'see_all'.tr,
                        style: getRegularStyle(
                            color: ColorsManager.hintStyleColor,
                            fontSize: AppSize.s12),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // scales widget
              scalesWidget(context),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: isArabic
              //           ? const EdgeInsets.only(
              //               right: AppPadding.p40, top: AppPadding.p30)
              //           : const EdgeInsets.only(
              //               left: AppPadding.p40, top: AppPadding.p30),
              //       child: Text(
              //         'therapeutic_programmes'.tr,
              //         style: getMediumStyle(
              //           color: ColorsManager.blackColor,
              //           fontSize: AppSize.s15,
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: isArabic
              //           ? const EdgeInsets.only(
              //               left: AppPadding.p40, top: AppPadding.p30)
              //           : const EdgeInsets.only(
              //               right: AppPadding.p40, top: AppPadding.p30),
              //       child: TextButton(
              //         onPressed: () {
              //           // Get.toNamed(Routes.DOCTORS, arguments: 0);
              //         },
              //         child: Text(
              //           'see_all'.tr,
              //           style: getRegularStyle(
              //               color: ColorsManager.hintStyleColor,
              //               fontSize: AppSize.s12),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              // const SizedBox(
              //   height: 10,
              // ),

              // programsWidget(context),

              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      )
    ],
  );
}
