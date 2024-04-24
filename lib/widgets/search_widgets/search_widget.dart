import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

Widget searchWidget(BuildContext context) {
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? const EdgeInsets.only(left: 10, top: AppPadding.p20, right: 10)
        : const EdgeInsets.only(left: 10, top: AppPadding.p20, right: 10),
    child: Container(
      width: 315,
      height: 50,
      decoration: BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.SEARCH);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: Get.locale!.languageCode == 'ar'
                  ? const EdgeInsets.only(right: AppPadding.p20)
                  : const EdgeInsets.only(left: AppPadding.p20),
              child: Text(
                'search_for_doctor'.tr,
                style: getRegularStyle(
                    color: ColorsManager.hintStyleColor,
                    fontSize: FontSizeManager.s12),
              ),
            ),
            Container(
              width: 54,
              height: 50,
              decoration: BoxDecoration(
                color: ColorsManager.mainColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.SEARCH);
                },
                icon: const Icon(
                  Icons.search,
                  color: ColorsManager.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
