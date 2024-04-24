import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/appointment_booking/controllers/appointment_booking_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Widget appointmentBookingBody(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.find<AppointmentBookingController>();
  return SizedBox(
    height: Get.height * 0.6,
    width: 315,
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
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorsManager.shadowColor,
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(right: 20)
                        : const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'good_time'.tr,
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
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.listOfTime.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(top: 10, right: 15)
                              : const EdgeInsets.only(top: 10, left: 15),
                          child: Obx(
                            () => GestureDetector(
                              onTap: () {
                                // controller.changeSelected();
                              },
                              child: Row(
                                children: [
                                  controller.selected.value == index
                                      ? SvgPicture.asset(Images.selectIcon)
                                      : SvgPicture.asset(Images.unSelectIcon),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    controller.listOfTime[index].toString(),
                                    style: getRegularStyle(
                                      color: ColorsManager.fontColor,
                                      fontSize: FontSizeManager.s14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                      child: Divider(
                        color: ColorsManager.primaryColor.withOpacity(0.3),
                      ),
                    );
                  },
                )
              ],
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
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorsManager.shadowColor,
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(right: 20)
                        : const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'descripe_your_problem'.tr,
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
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 10, right: 25)
                      : const EdgeInsets.only(top: 10, left: 25),
                  child: Row(
                    children: [
                      Text(
                        'problem'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                          fontSize: FontSizeManager.s15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                  child: Container(
                    height: 103,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: ColorsManager.greyColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      // maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: getRegularStyle(
                          color: const Color(0xFF646464),
                          fontSize: FontSizeManager.s13,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 10, right: 25)
                      : const EdgeInsets.only(top: 10, left: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'attach_file'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                            fontSize: FontSizeManager.s15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                  child: Container(
                    height: 103,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: ColorsManager.greyColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(
                                  top: 30,
                                )
                              : const EdgeInsets.only(
                                  top: 30,
                                ),
                          child: SvgPicture.asset(
                            Images.attachFileIcon,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'attach'.tr,
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: FontSizeManager.s13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
