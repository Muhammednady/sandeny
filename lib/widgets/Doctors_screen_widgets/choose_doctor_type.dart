import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/home/controllers/home_controller.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../app/modules/doctors/controllers/doctors_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/values_manager.dart';

Widget chooseDoctorType(BuildContext context) {
  var controller = Get.put(DoctorsController());
  var homeController = Get.put(HomeController());
  var isArabic = Get.locale!.languageCode == 'ar';
  return Padding(
    padding: isArabic
        ? const EdgeInsets.only(top: 10)
        : const EdgeInsets.only(top: 10),
    child: Obx(
      () => Padding(
        padding: isArabic
            ? const EdgeInsets.only(
                right: AppPadding.p50,
              )
            : const EdgeInsets.only(
                left: AppPadding.p50,
              ),
        child: Container(
          width: Get.width * 0.9,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppSize.s50,
            ),
            color: ColorsManager.greyColor,
          ),
          child: ListView.separated(
            itemCount: homeController.specializationList.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.changeTabIndex(
                          homeController.specializationList[index].id!);
                      homeController.getDoctorSpecificationId(
                        id: homeController.specializationList[index].id!,
                      );
                    },
                    child: Container(
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s50),
                        color: homeController.specializationList[index].id! ==
                                controller.tabIndex.value
                            ? ColorsManager.primaryColor
                            : ColorsManager.whiteColor,
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
                                  ? homeController
                                      .specializationList[index].name!.ar!
                                  : homeController
                                      .specializationList[index].name!.en!,
                              style: getRegularStyle(
                                color: homeController
                                            .specializationList[index].id! ==
                                        controller.tabIndex.value
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.fontColor,
                                fontSize: FontSizeManager.s14,
                              ),
                            ),
                          ),
                        ],
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
  );
}
