import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/fonts_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../app/modules/home/controllers/home_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';

Widget bottomNavigarionBarWidget(BuildContext context) {
  var controller = Get.put(HomeController());
  return Obx(
    () => CustomNavigationBar(
      items: [
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            Images.homeIcon,
            color: controller.pageIndex.value == 0
                ? ColorsManager.primaryColor
                : ColorsManager.fontColor,
          ),
          title: Text(
            "home".tr,
            textAlign: TextAlign.center,
            style: getRegularStyle(
              color: controller.pageIndex.value == 0
                  ? ColorsManager.primaryColor
                  : ColorsManager.fontColor,
              fontSize: FontSizeManager.s12,
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            Images.calenderIcon,
            color: controller.pageIndex.value == 1
                ? ColorsManager.primaryColor
                : ColorsManager.fontColor,
          ),
          title: Text(
            "my_appointments".tr,
            textAlign: TextAlign.center,
            style: getRegularStyle(
              color: controller.pageIndex.value == 1
                  ? ColorsManager.primaryColor
                  : ColorsManager.fontColor,
              fontSize: FontSizeManager.s10,
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SvgPicture.asset(
              Images.scaleIcon,
              color: controller.pageIndex.value == 2
                  ? ColorsManager.primaryColor
                  : ColorsManager.fontColor,
            ),
          ),
          title: Text(
            'scales'.tr,
            textAlign: TextAlign.center,
            style: getRegularStyle(
              color: controller.pageIndex.value == 2
                  ? ColorsManager.primaryColor
                  : ColorsManager.fontColor,
              fontSize: FontSizeManager.s12,
            ),
          ),
        ),
        // CustomNavigationBarItem(
        //   icon: Padding(
        //     padding: const EdgeInsets.only(left: 5, right: 5),
        //     child: SvgPicture.asset(
        //       Images.fileIcon,
        //       color: controller.pageIndex.value == 3
        //           ? ColorsManager.primaryColor
        //           : ColorsManager.fontColor,
        //     ),
        //   ),
        //   title: Text(
        //     'programs'.tr,
        //     textAlign: TextAlign.center,
        //     style: getRegularStyle(
        //       color: controller.pageIndex.value == 3
        //           ? ColorsManager.primaryColor
        //           : ColorsManager.fontColor,
        //       fontSize: FontSizeManager.s12,
        //     ),
        //   ),
        // ),
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            Images.moreIcon,
            color: controller.pageIndex.value == 3
                ? ColorsManager.primaryColor
                : ColorsManager.fontColor,
          ),
          title: Text(
            "more".tr,
            textAlign: TextAlign.center,
            style: getRegularStyle(
              color: controller.pageIndex.value == 3
                  ? ColorsManager.primaryColor
                  : ColorsManager.fontColor,
              fontSize: FontSizeManager.s12,
            ),
          ),
        ),
        // assets/images/message.svg
      ],
      onTap: (index) {
        controller.setPage = index;
      },
    ),
  );
}
