import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../controllers/my_appointments_controller.dart';

Widget prescriptionWidget(BuildContext context) {
  var controller = Get.put(MyAppointmentsController());
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? const EdgeInsets.only(top: 20, left: 30, right: 20)
        : const EdgeInsets.only(top: 20, left: 50),
    child: SizedBox(
      width: 315,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text(
                          'Doctor_instructions'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.mainColor,
                            fontSize: FontSizeManager.s15,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'doctor_instructions_description'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                            fontSize: FontSizeManager.s14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
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
              child: Column(
                children: [
                  Container(
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
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text(
                            'medicines'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.mainColor,
                              fontSize: FontSizeManager.s15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: Get.locale!.languageCode == 'ar'
                        ? const EdgeInsets.only(top: 10, right: 25)
                        : const EdgeInsets.only(top: 10, left: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'medicament_name'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
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
                                  padding: Get.locale!.languageCode == 'ar'
                                      ? const EdgeInsets.only(
                                          top: 10, right: 15)
                                      : const EdgeInsets.only(
                                          top: 10, left: 15),
                                  child: Text(
                                    'problem_description'.tr,
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
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: Get.locale!.languageCode == 'ar'
                        ? const EdgeInsets.only(top: 10, right: 25)
                        : const EdgeInsets.only(top: 10, left: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'medicament_name'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
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
                                  padding: Get.locale!.languageCode == 'ar'
                                      ? const EdgeInsets.only(
                                          top: 10, right: 15)
                                      : const EdgeInsets.only(
                                          top: 10, left: 15),
                                  child: Text(
                                    'problem_description'.tr,
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
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
                  width: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.yelowColor.withOpacity(0.4),
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
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'validity'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.blackColor,
                              fontSize: FontSizeManager.s14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 97,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorsManager.whiteColor,
                            border: Border.all(
                              color: ColorsManager.darkGreyColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '22/11/2023'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.blackColor,
                                fontSize: FontSizeManager.s14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: ColorsManager.yelowColor.withOpacity(0.10),
                    border: Border.all(
                      color: ColorsManager.darkGreyColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'doctor_instructions_description'.tr,
                            style: getRegularStyle(
                              color: ColorsManager.fontColor,
                              fontSize: FontSizeManager.s14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    ),
  );
}
