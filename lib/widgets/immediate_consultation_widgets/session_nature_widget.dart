import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/Immediate_consultation/controllers/immediate_consultation_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget sessionNatureWidget(BuildContext context, dynamic controller) {
  var iCController = Get.put(ImmediateConsultationController());
  var isArabic = Get.locale!.languageCode == 'ar';
  return Row(
    children: [
      Container(
        width: 330,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppSize.s50,
          ),
        ),
        child: ListView.separated(
          itemCount: iCController.getData.data!.types!.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              controller.selectSessionNatureById(
                  iCController.getData.data!.types![index].id!);
            },
            child: Obx(
              () => Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s50),
                  color: controller.sessionNatureId.value ==
                          iCController.getData.data!.types![index].id!
                      ? ColorsManager.primaryColor
                      : ColorsManager.lightGreyColor,
                ),
                child: Center(
                  child: Text(
                    isArabic
                        ? iCController.getData.data!.types![index].title!.ar!
                        : iCController.getData.data!.types![index].title!.en!,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: controller.sessionNatureId.value ==
                                  iCController.getData.data!.types![index].id!
                              ? ColorsManager.whiteColor
                              : ColorsManager.fontColor,
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
