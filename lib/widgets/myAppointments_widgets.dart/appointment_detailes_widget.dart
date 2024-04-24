import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../doctor_rating.dart';

Widget appointmentDetailsWidget(BuildContext context, dynamic controller) {
  final isArabic = Get.locale!.languageCode == 'ar';
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: Get.locale!.languageCode == 'ar'
              ? EdgeInsets.only(
                  top: 20,
                  left: Get.width * 0.13,
                  right: Get.width * 0.13,
                )
              : EdgeInsets.only(
                  top: 20,
                  left: Get.width * 0.13,
                  right: Get.width * 0.13,
                ),
          child: Container(
            width: 315,
            height: 226,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: ColorsManager.borderColor,
                  offset: Offset(0, 0),
                  blurRadius: 7,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              onTap: () {
                                doctorRating(context, controller);
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: ColorsManager.greyColor,
                                child: Image.network(
                                  controller.getAD[0].profileImage,
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Get.locale!.languageCode == 'ar'
                                ? const EdgeInsets.only(top: 10, left: 0)
                                : const EdgeInsets.only(top: 10, right: 0),
                            child: Column(
                              children: [
                                Text(
                                  controller.getAD[0].doctorName,
                                  style: getRegularStyle(
                                    color: ColorsManager.blackColor,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  isArabic
                                      ? controller.getAD[0].specializations!.ar!
                                      : controller
                                          .getAD[0].specializations!.en!,
                                  style: getRegularStyle(
                                    color: ColorsManager.defaultGreyColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: Get.locale!.languageCode == 'ar'
                            ? const EdgeInsets.only(left: 20)
                            : const EdgeInsets.only(right: 20),
                        child: Container(
                          height: 22,
                          width: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: controller.getAD[0].status == 'pending' ||
                                    controller.getAD[0].status == 'accepted' ||
                                    controller.getAD[0].status == 'completed'
                                ? ColorsManager.primaryColor.withOpacity(0.1)
                                : ColorsManager.errorColor.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller.getAD[0].status ==
                                    'pending') ...[
                                  Text(
                                    'wait'.tr,
                                    style: getRegularStyle(
                                      color: ColorsManager.primaryColor,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ] else if (controller.getAD[0].status ==
                                    'accepted') ...[
                                  Text(
                                    'accepted'.tr,
                                    style: getRegularStyle(
                                      color: ColorsManager.primaryColor,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ] else if (controller.getAD[0].status ==
                                    'completed') ...[
                                  Text(
                                    'completed'.tr,
                                    style: getRegularStyle(
                                      color: ColorsManager.primaryColor,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ] else if (controller.getAD[0].status ==
                                    'rejected') ...[
                                  Text(
                                    'rejected'.tr,
                                    style: getRegularStyle(
                                      color: ColorsManager.errorColor,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ] else if (controller.getAD[0].status ==
                                    'canceled') ...[
                                  Text(
                                    'canceled'.tr,
                                    style: getRegularStyle(
                                      color: ColorsManager.errorColor,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  Padding(
                    padding: Get.locale!.languageCode == 'ar'
                        ? const EdgeInsets.only(
                            right: 25,
                          )
                        : const EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Images.alarmIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'period'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.defaultGreyColor,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${controller.getAD[0].duration} ${'Minute'.tr}',
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: Get.locale!.languageCode == 'ar'
                        ? const EdgeInsets.only(
                            left: 50,
                            right: 25,
                          )
                        : const EdgeInsets.only(
                            left: 25,
                            right: 50,
                          ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          Images.appointmentIcon2,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'appointment'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.defaultGreyColor,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            '${controller.getAD[0].date}',
                            style: getRegularStyle(
                              color: ColorsManager.blackColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: Get.locale!.languageCode == 'ar'
                        ? const EdgeInsets.only(
                            left: 50,
                            right: 23,
                          )
                        : const EdgeInsets.only(
                            left: 25,
                            right: 50,
                          ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Images.videoIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'natural'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.defaultGreyColor,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${controller.getAD[0].type}',
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: Get.locale!.languageCode == 'ar'
                        ? const EdgeInsets.only(
                            left: 50,
                            right: 23,
                          )
                        : const EdgeInsets.only(
                            left: 25,
                            right: 50,
                          ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Images.priceIcon2,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'price'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.defaultGreyColor,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${controller.getAD[0].price} ${'SAR'.tr}',
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: Get.locale!.languageCode == 'ar'
              ? const EdgeInsets.only(top: 20, left: 40, right: 25)
              : const EdgeInsets.only(top: 20, left: 40),
          child: Container(
            width: 315,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: ColorsManager.borderColor,
                  offset: Offset(0, 0),
                  blurRadius: 7,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: Get.locale!.languageCode == 'ar'
                          ? const EdgeInsets.only(top: 20, right: 20)
                          : const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'patient_data'.tr,
                        style: getMediumStyle(
                          color: ColorsManager.mainColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: Get.locale!.languageCode == 'ar'
                          ? const EdgeInsets.only(top: 20, right: 5)
                          : const EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        "(${controller.getAD[0].patientName})",
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: ColorsManager.primaryColor.withOpacity(0.3),
                ),
                Row(
                  children: [
                    Padding(
                      padding: Get.locale!.languageCode == 'ar'
                          ? const EdgeInsets.only(top: 10, right: 20)
                          : const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        'problem'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                controller.getAD[0].problem ?? '',
                                style: getRegularStyle(
                                  color: ColorsManager.fontColor,
                                  fontSize: FontSizeManager.s12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'attachments'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 97,
                        width: 285,
                        child: ListView.separated(
                          itemCount: controller.getAD[0].attachments!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                final file = controller
                                    .getAD[0].attachments![index].file;
                                log('this is the file $file');
                                final fileName = file.split('/').last;
                                controller.downloadFile(file, fileName);
                              },
                              child: Container(
                                height: 97,
                                width: 97,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorsManager.primaryColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.download,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'download_file'.tr,
                                      style: getRegularStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
