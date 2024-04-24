import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget selectSpecialistLanguage(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  // final controller = Get.put(ScheduledSessionController());
  return Padding(
    padding: isArabic
        ? const EdgeInsets.only(top: 10)
        : const EdgeInsets.only(top: 10),
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
        itemCount: controller.getData.data!.languages!.length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectDoctorLanguage(
                      controller.getData.data!.languages![index].id!);
                },
                child: Container(
                  width: 157,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s50),
                    color: controller.languageId.value ==
                            controller.getData.data!.languages![index].id!
                        ? ColorsManager.primaryColor
                        : ColorsManager.lightGreyColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isArabic
                            ? controller
                                .getData.data!.languages![index].language!.ar!
                            : controller
                                .getData.data!.languages![index].language!.en!,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: controller.languageId.value ==
                                          controller.getData.data!
                                              .languages![index].id!
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
  );
}
