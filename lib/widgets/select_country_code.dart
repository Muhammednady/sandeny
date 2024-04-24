import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/colors_manager.dart';
import '../constants/images_manager.dart';
import '../constants/styles_manager.dart';

selectCountryCode(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  // var controller = Get.put(AuthController());
  showModalBottomSheet(
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) => Container(
      width: Get.width,
      height: Get.height * 0.5,
      decoration: const BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(top: 30, right: 30)
                    : const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  'select_country'.tr,
                  style: const TextStyle(
                    color: ColorsManager.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => Padding(
                padding: isArabic
                    ? const EdgeInsets.only(right: 10)
                    : const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: Get.height,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: ListTile(
                          title: Obx(
                            () => Row(
                              children: [
                                Text(
                                  '${controller.countriesList[index]!.code} |',
                                  style: getRegularStyle(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? ColorsManager.primaryColor
                                            : ColorsManager.blackColor,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  isArabic
                                      ? controller.countriesList[index]!.name.ar
                                          .toString()
                                      : controller.countriesList[index]!.name.en
                                          .toString(),
                                  style: getRegularStyle(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? ColorsManager.primaryColor
                                            : ColorsManager.blackColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Obx(
                            () => controller.selectedIndex.value == index
                                ? SvgPicture.asset(
                                    Images.selectIcon,
                                  )
                                : const SizedBox(),
                          ),
                          onTap: () {
                            controller.selectCountryIndex(index);
                            Get.back();
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                        child: Divider(
                          color: ColorsManager.primaryColor,
                          thickness: 0.1,
                        ),
                      );
                    },
                    itemCount: controller.countriesList.length,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
