import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget sessionPeriodWidget(BuildContext context, dynamic controller) {
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
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.getData.data!.periods!.length,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.selectSessionById(
                        controller.getData.data!.periods![index].id!);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s50),
                      color: controller.sessionId.value ==
                              controller.getData.data!.periods![index].id!
                          ? ColorsManager.primaryColor
                          : ColorsManager.lightGreyColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isArabic
                              ? controller
                                  .getData.data!.periods![index].title!.ar!
                              : controller
                                  .getData.data!.periods![index].title!.en!,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: controller.sessionId.value ==
                                        controller
                                            .getData.data!.periods![index].id
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
    ],
  );
}
