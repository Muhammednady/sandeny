import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';

doctorRating(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  return showModalBottomSheet(
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 580,
        width: Get.width,
        decoration: const BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    width: 44,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: ColorsManager.hintStyleColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              top: 40,
                            )
                          : const EdgeInsets.only(
                              top: 40,
                            ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: ColorsManager.greyColor,
                            child: Image.network(
                              controller.getAD[0].profileImage,
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.getAD[0].doctorName,
                            style: getRegularStyle(
                              color: ColorsManager.blackColor,
                              fontSize: FontSizeManager.s15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              left: 10,
                            ),
                            child: Text(
                              isArabic
                                  ? controller.getAD[0].specializations!.ar!
                                  : controller.getAD[0].specializations!.en!,
                              style: getRegularStyle(
                                color: Colors.grey,
                                fontSize: FontSizeManager.s14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: 30,
                            )
                          : const EdgeInsets.only(
                              left: 30,
                            ),
                      child: Row(
                        children: [
                          Text(
                            '${'rating_question'.tr} ${controller.getAD[0].doctorName}',
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: 15,
                            )
                          : const EdgeInsets.only(
                              left: 30,
                            ),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            unratedColor: ColorsManager.greyColor,
                            itemBuilder: (context, _) => SvgPicture.asset(
                              Images.starIcon2,
                            ),
                            onRatingUpdate: (rating) {
                              log(rating);
                              controller.rate = rating.toInt();
                              log(controller.rate);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: 30,
                            )
                          : const EdgeInsets.only(
                              left: 30,
                            ),
                      child: Row(
                        children: [
                          Text(
                            'write_review'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.mainColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            )
                          : const EdgeInsets.only(
                              left: 20,
                              right: 30,
                            ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 103,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: ColorsManager.greyColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextFormField(
                            maxLines: 5,
                            onChanged: (value) {
                              controller.comment = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'your_review'.tr,
                              hintStyle: getRegularStyle(
                                color: const Color(0xFF646464),
                                fontSize: FontSizeManager.s13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonsManager.primaryButton(
                      text: 'add_rating'.tr,
                      minimumSize: const Size(287, 50),
                      maximumSize: const Size(287, 50),
                      onPressed: () {
                        controller.addRating(
                          doctorId: controller.getAD[0].doctorId,
                        );
                      },
                      context: context,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
