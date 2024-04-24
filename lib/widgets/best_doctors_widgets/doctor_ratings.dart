import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Widget doctorRaringsWidget(BuildContext context, controller) {
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? EdgeInsets.only(
            top: 250,
            left: Get.width * 0.12,
            right: Get.width * 0.12,
          )
        : EdgeInsets.only(
            top: 250,
            left: Get.width * 0.12,
            right: Get.width * 0.12,
          ),
    child: Container(
      width: 315,
      height: Get.height * 0.5,
      color: ColorsManager.greyColor,
      child: ListView.builder(
        itemCount: controller.getDoctor.rates.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 315,
                decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorsManager.darkGreyColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.getDoctor.rates[index].userName!
                                .toString(),
                            style: getRegularStyle(
                              color: ColorsManager.mainColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          ),
                          Row(children: [
                            SvgPicture.asset(
                              Images.starIcon,
                              color: ColorsManager.yelowColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${'5/'.tr}${controller.getDoctor.rates[index].rate!}',
                              style: getRegularStyle(
                                color: Colors.grey,
                                fontSize: FontSizeManager.s10,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.getDoctor.rates[index].createdAtEn!
                                  .toString(),
                              style: getRegularStyle(
                                color: Colors.grey,
                                fontSize: FontSizeManager.s10,
                              ),
                            ),
                          ]),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 287,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: ColorsManager.greyColor,
                          border: Border.all(
                            color: ColorsManager.darkGreyColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.getDoctor.rates[index].comment!,
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        },
      ),
    ),
  );
}
