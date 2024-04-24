import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';

Widget aboutDoctorWidget(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  return Padding(
    padding: isArabic
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 177,
              width: 315,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.whiteColor,
                border: Border.all(
                  color: ColorsManager.darkGreyColor,
                ),
              ),
              child: Column(children: [
                Container(
                  height: 50,
                  width: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorsManager.lightGreyColor,
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'about_me'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.mainColor,
                            fontSize: FontSizeManager.s15,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          isArabic
                              ? controller.getDoctor.description!.ar!
                              : controller.getDoctor.description!.en!,
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                            fontSize: FontSizeManager.s14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 315,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'years_of_experience'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s15,
                        ),
                      ),
                      Container(
                          height: 29,
                          width: 114,
                          decoration: BoxDecoration(
                            color: ColorsManager.greyColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              '${controller.getDoctor.yearsOfExperience} ${'years'.tr}',
                              style: getRegularStyle(
                                color: ColorsManager.fontColor,
                                fontSize: FontSizeManager.s14,
                              ),
                            ),
                          )),
                    ]),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 315,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.whiteColor,
                border: Border.all(
                  color: ColorsManager.darkGreyColor,
                ),
              ),
              child: Column(children: [
                Container(
                  height: 50,
                  width: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorsManager.lightGreyColor,
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'skills_and_experies'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.mainColor,
                            fontSize: FontSizeManager.s15,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 287,
                  height: 200,
                  child: ListView.builder(
                    itemCount: controller.getDoctor.experiences.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${controller.getDoctor.experiences[index].experience.from} - ${controller.getDoctor.experiences[index].experience.to}',
                                    style: getRegularStyle(
                                      color: ColorsManager.fontColor,
                                      fontSize: FontSizeManager.s12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
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
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: isArabic
                                            ? const EdgeInsets.only(right: 8.0)
                                            : const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          isArabic
                                              ? controller
                                                  .getDoctor
                                                  .experiences[index]
                                                  .experience
                                                  .ar!
                                              : controller
                                                  .getDoctor
                                                  .experiences[index]
                                                  .experience
                                                  .en!,
                                          style: getRegularStyle(
                                            color: ColorsManager.fontColor,
                                            fontSize: FontSizeManager.s14,
                                            height: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(
                          right: 8.0,
                        )
                      : const EdgeInsets.only(
                          left: 8.0,
                        ),
                  child: Row(
                    children: [
                      Text(
                        'skills'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // This is the skills
                SizedBox(
                  width: 287,
                  height: 200,
                  child: ListView.builder(
                    itemCount: controller.getDoctor.skills.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 287,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: ColorsManager.greyColor,
                              border: Border.all(
                                color: ColorsManager.darkGreyColor,
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: isArabic
                                            ? const EdgeInsets.only(right: 8.0)
                                            : const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          isArabic
                                              ? controller.getDoctor
                                                  .skills[index].name.ar!
                                              : controller.getDoctor
                                                  .skills[index].name.en!,
                                          style: getRegularStyle(
                                            color: ColorsManager.fontColor,
                                            fontSize: FontSizeManager.s14,
                                            height: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 315,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'my_languages'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s15,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 130,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.getDoctor.languages.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 5,
                                ),
                                itemBuilder: (context, index) => Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorsManager.greyColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: isArabic
                                            ? const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              )
                                            : const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                        child: Center(
                                          child: Text(
                                            isArabic
                                                ? controller
                                                    .getDoctor
                                                    .languages[index]
                                                    .language
                                                    .ar!
                                                : controller
                                                    .getDoctor
                                                    .languages[index]
                                                    .language
                                                    .en!,
                                            style: getRegularStyle(
                                              color: ColorsManager.fontColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
