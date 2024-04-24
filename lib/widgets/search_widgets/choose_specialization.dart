import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/filter/controllers/filter_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget chooseSpecialization(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(FilterController());
  return Obx(
      ()=> controller.specializationDataList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            )
          :
       Padding(
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
          itemCount: controller.getSpecializationData.data!.length,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.selectDoctorSpecialization(
                      controller.getSpecializationData.data![index].id!,
                    );
                  },
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 157,
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s50),
                      color: controller.specializationTypeId.value ==
                              controller.getSpecializationData.data![index].id!
                          ? ColorsManager.primaryColor
                          : ColorsManager.lightGreyColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isArabic
                              ? controller
                                  .getSpecializationData.data![index].name!.ar!
                              : controller
                                  .getSpecializationData.data![index].name!.en!,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: controller.specializationTypeId.value ==
                                        controller.getSpecializationData
                                            .data![index].id!
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.fontColor,
                                fontSize: 14,
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
  );
}
