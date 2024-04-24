import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/images_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../app/modules/profile/controllers/profile_controller.dart';
import '../../constants/fonts_manager.dart';

Widget medicalFileWidget(BuildContext context) {
  var controller = ProfileController.instance;
  var isArabic = Get.locale!.languageCode == 'ar';
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? const EdgeInsets.only(
            top: 10,
          )
        : const EdgeInsets.only(
            top: 10,
          ),
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: 315,
      decoration: const BoxDecoration(
        color: ColorsManager.greyColor,
      ),
      child: ListView.separated(
        itemCount: controller.medicalAnswersList.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsManager.whiteColor,
                  // put the border color to dark grey
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
                          Expanded(
                            child: Text(
                              isArabic
                                  ? controller
                                      .medicalAnswersList[index].question!.ar
                                      .toString()
                                  : controller
                                      .medicalAnswersList[index].question!.en
                                      .toString(),
                              style: getRegularStyle(
                                color: ColorsManager.mainColor,
                                fontSize: FontSizeManager.s15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller
                          .medicalAnswersList[index].answersList!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Obx(
                            () => Row(
                              children: [
                                SvgPicture.asset(
                                  Images.selectIcon,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  isArabic
                                      ? controller.medicalAnswersList[index]
                                              .answersList![i].answers!.ar
                                              ?.toString() ??
                                          ''
                                      : controller.medicalAnswersList[index]
                                              .answersList![i].answers!.en
                                              ?.toString() ??
                                          '',
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                          child: Divider(
                            color: ColorsManager.primaryColor.withOpacity(0.2),
                          ),
                        );
                      },
                    ),
                    // Text(
                    //   isArabic
                    //       ? controller.medicalAnswersList[index]
                    //           .answersList![index].answers!.ar
                    //           .toString()
                    //       : controller.medicalAnswersList[index]
                    //           .answersList![index].answers!.en
                    //           .toString(),
                    //   style: getRegularStyle(
                    //     color: ColorsManager.fontColor,
                    //     fontSize: FontSizeManager.s14,
                    //   ),
                    // )
                  ),
                ]),
              ),
            ],
          );
        }),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    ),
  );
}
