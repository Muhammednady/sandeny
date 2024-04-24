import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/values_manager.dart';

Widget scheduledSTabbyPayment(
    BuildContext context, dynamic paymentController, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  final price = double.parse(controller.getSSD.data!.totalPrice!).toInt() / 4;
  return Obx(
    () => GestureDetector(
      onTap: () {
        paymentController.changeTabbyOption();
      },
      child: Container(
        width: 315,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsManager.whiteColor,
          border: Border.all(
            color: paymentController.tabbyOption.value == false
                ? ColorsManager.greyColor
                : ColorsManager.primaryColor,
            width: 2,
          ),
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
                  ? const EdgeInsets.only(top: 5, right: AppPadding.p20)
                  : const EdgeInsets.only(top: 5, left: AppPadding.p20),
              child: Row(
                children: [
                  Expanded(
                    child: isArabic
                        ? Obx(
                            () => RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${'tabby_des1'.tr} ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 15), // Normal font style
                                  ),
                                  TextSpan(
                                    text: paymentController
                                                .showDiscount.value ==
                                            true
                                        ? '${double.parse(paymentController.getCoupon.data!.totalPrice!).toInt() / 4} SAR '
                                        : '${price.toString()} SAR ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        height: 1.5), // Bold font style
                                  ),
                                  TextSpan(
                                    text: 'tabby_des2'.tr,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize: 15), // Normal font style
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Obx(
                            () => RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${'tabby_des1'.tr} ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        height: 1.5), // Normal font style
                                  ),
                                  TextSpan(
                                    text: paymentController
                                                .showDiscount.value ==
                                            true
                                        ? '${double.parse(paymentController.getCoupon.data!.totalPrice!).toInt() / 4} SAR '
                                        : '${price.toString()} SAR.',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        height: 1.5), // Bold font style
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 5, left: AppPadding.p15)
                        : const EdgeInsets.only(top: 5, right: AppPadding.p15),
                    child: Image.asset(
                      Images.tabbyIcon,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
