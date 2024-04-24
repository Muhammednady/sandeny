import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';

Widget searchDetailsWidget(BuildContext context, dynamic controller) {
  return Container(
    width: 315,
    height: 50,
    decoration: BoxDecoration(
      color: ColorsManager.whiteColor,
      borderRadius: BorderRadius.circular(4),
    ),
    child: GestureDetector(
      onTap: () {
        controller.getSearchDoctor();
      },
      child: Row(
        children: [
          SizedBox(
            width: 254,
            height: 50,
            child: TextFormField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'search'.tr,
                hintStyle: getRegularStyle(
                    color: ColorsManager.hintStyleColor,
                    fontSize: FontSizeManager.s12),
                fillColor: ColorsManager.whiteColor,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: ((value) => controller.searchDoctor(value)),
            ),
          ),
          Container(
            width: 56,
            height: 50,
            decoration: BoxDecoration(
              color: ColorsManager.mainColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              onPressed: () {
                controller.getSearchDoctor();
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
  );
}
