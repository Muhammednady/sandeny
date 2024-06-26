import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/scheduled_session/controllers/scheduled_session_payment_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

Widget scheduledSessionPaymentMethod(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(ScheduledSessionPaymentController());
  return Container(
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
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(
                  top: AppPadding.p20, right: AppPadding.p20)
              : const EdgeInsets.only(
                  top: AppPadding.p20, left: AppPadding.p20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'choose_payment_method'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.mainColor,
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
        Divider(
          color: ColorsManager.primaryColor.withOpacity(0.3),
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: 5, right: AppPadding.p16)
              : const EdgeInsets.only(top: 5, left: AppPadding.p16),
          child: Row(
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.changeCreditOrDebitCard();
                  },
                  child: Container(
                    width: 287,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsManager.greyColor,
                      border: Border.all(
                        color: controller.creditOrDebitCard.value == false
                            ? ColorsManager.greyColor
                            : ColorsManager.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 10)
                          : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.cardIcon),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'credit_card'.tr,
                            style: getRegularStyle(
                                color: ColorsManager.blackColor,
                                fontSize: FontSizeManager.s14),
                          )
                        ],
                      ),
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
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: 5, right: AppPadding.p16)
              : const EdgeInsets.only(top: 5, left: AppPadding.p16),
          child: Row(
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.changeMadaCard();
                  },
                  child: Container(
                    width: 287,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsManager.greyColor,
                      border: Border.all(
                        color: controller.madaCard.value == false
                            ? ColorsManager.greyColor
                            : ColorsManager.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 0)
                          : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.madaIcon,
                              width: 60, height: 60),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'mada_card'.tr,
                            style: getRegularStyle(
                                color: ColorsManager.blackColor,
                                fontSize: FontSizeManager.s14),
                          )
                        ],
                      ),
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

        // Apple Pay Payment Method
        Visibility(
          visible: GetPlatform.isIOS,
          child: Padding(
            padding: isArabic
                ? const EdgeInsets.only(right: AppPadding.p16)
                : const EdgeInsets.only(left: AppPadding.p16),
            child: Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.changeApplePayCard();
                    },
                    child: Container(
                      width: 287,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorsManager.greyColor,
                        border: Border.all(
                          color: controller.applePayCard.value == false
                              ? ColorsManager.greyColor
                              : ColorsManager.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(right: 10)
                            : const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Images.appleIcon,
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'apple_pay'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.blackColor,
                                fontSize: FontSizeManager.s15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Visibility(
        //   visible: GetPlatform.isIOS,
        //   child: Padding(
        //     padding: isArabic
        //         ? const EdgeInsets.only(right: AppPadding.p16)
        //         : const EdgeInsets.only(left: AppPadding.p16),
        //     child: Row(
        //       children: [
        //         Obx(
        //           () => GestureDetector(
        //             onTap: () {
        //               controller.changeApplePayCard();
        //             },
        //             child: Container(
        //               width: 287,
        //               height: 47,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: ColorsManager.greyColor,
        //                 border: Border.all(
        //                     color: controller.applePayCard.value == false
        //                         ? ColorsManager.greyColor
        //                         : ColorsManager.primaryColor,
        //                     width: 2),
        //               ),
        //               child: Padding(
        //                 padding: isArabic
        //                     ? const EdgeInsets.only(right: 10)
        //                     : const EdgeInsets.only(left: 10),
        //                 child: Row(
        //                   children: [
        //                     SvgPicture.asset(Images.appleIcon),
        //                     const SizedBox(
        //                       width: 15,
        //                     ),
        //                     Text(
        //                       'apple_pay'.tr,
        //                       style: getRegularStyle(
        //                           color: ColorsManager.blackColor,
        //                           fontSize: FontSizeManager.s14),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        const SizedBox(
          height: 10,
        ),
        // Stc Pay Payment Method
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: AppPadding.p16)
              : const EdgeInsets.only(left: AppPadding.p16),
          child: Row(
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.changeStcPayOption();
                  },
                  child: Container(
                    width: 287,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsManager.greyColor,
                      border: Border.all(
                        color: controller.stcPayOption.value == false
                            ? ColorsManager.greyColor
                            : ColorsManager.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 10)
                          : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Image.asset(Images.stcPay, width: 30, height: 30),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'stcPay_card'.tr,
                            style: getRegularStyle(
                                color: ColorsManager.blackColor,
                                fontSize: FontSizeManager.s14),
                          )
                        ],
                      ),
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
  );
}
