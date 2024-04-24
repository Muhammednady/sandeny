
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/bilateral_session/controllers/bilateral_session_controller.dart';
import '../../app/modules/filter/controllers/filter_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget chooseSpecializationFBS(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(FilterController());
  var bSController = Get.put(BilateralSessionController());
  return Padding(
    padding: isArabic
        ? const EdgeInsets.only(top: 10, right: 10)
        : const EdgeInsets.only(top: 10, left: 10),
    child: Container(
      width: 330,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSize.s50,
        ),
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: bSController.getData.data!.departments!.length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectDoctorClinics(
                      bSController.getData.data!.departments![index].id!);
                },
                child: Container(
                  // width: 157,
                  constraints: const BoxConstraints(
                    minWidth: 157,
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s50),
                    color: controller.specializationId.value ==
                            bSController.getData.data!.departments![index].id!
                        ? ColorsManager.primaryColor
                        : ColorsManager.lightGreyColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          isArabic
                              ? bSController
                                  .getData.data!.departments![index].name!.ar!
                              : bSController
                                  .getData.data!.departments![index].name!.en!,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: controller.specializationId.value ==
                                        bSController.getData.data!
                                            .departments![index].id!
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.fontColor,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
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
  );
}
