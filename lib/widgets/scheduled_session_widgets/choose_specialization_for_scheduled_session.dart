
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/filter/controllers/filter_controller.dart';
import '../../app/modules/scheduled_session/controllers/scheduled_session_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget chooseSpecializationFIC(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(FilterController());
  var sSController = Get.put(ScheduledSessionController());
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
        itemCount: sSController.getData.data!.departments!.length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectValue.value = !controller.selectValue.value;
                  controller.selectClinic(controller.selectValue.value);
                  controller.selectDoctorClinics(
                      sSController.getData.data!.departments![index].id!);
                  // sSController.getImmediatePrice();
                },
                child: Container(
                  width: 157,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s50),
                    color: controller.specializationId.value ==
                            sSController.getData.data!.departments![index].id!
                        ? ColorsManager.primaryColor
                        : ColorsManager.lightGreyColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          isArabic
                              ? sSController
                                  .getData.data!.departments![index].name!.ar!
                              : sSController
                                  .getData.data!.departments![index].name!.en!,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: controller.specializationId.value ==
                                        sSController.getData.data!
                                            .departments![index].id!
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.fontColor,
                                fontSize: 14,
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