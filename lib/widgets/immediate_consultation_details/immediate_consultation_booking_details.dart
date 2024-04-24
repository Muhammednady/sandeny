import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/payment/controllers/payment_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';
import '../payment_widgets/add_coupon.dart';

Widget iCBookingDetails(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  final paymentController = Get.put(PaymentController());
  return Container(
    width: 315,
    height: 230,
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
              Text(
                'payment_details'.tr,
                style: getMediumStyle(
                  color: ColorsManager.mainColor,
                  fontSize: FontSizeManager.s15,
                ),
              ),
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(left: AppPadding.p20)
                    : const EdgeInsets.only(right: AppPadding.p20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        addCoupon(context, paymentController);
                      },
                      child: SvgPicture.asset(
                        Images.addCouponIcon,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'add_coupon'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.primaryColor,
                        fontSize: FontSizeManager.s13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(
                  top: 5,
                )
              : const EdgeInsets.only(
                  top: 5,
                ),
          child: Divider(
            color: ColorsManager.primaryColor.withOpacity(0.3),
          ),
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: 10, right: AppPadding.p20)
              : const EdgeInsets.only(top: 10, left: AppPadding.p20),
          child: Row(
            children: [
              Text(
                'cost'.tr,
                style: getRegularStyle(color: ColorsManager.defaultGreyColor),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(left: AppPadding.p30)
                    : const EdgeInsets.only(right: AppPadding.p30),
                child: Text(
                  '${controller.getICD.data!.price} ${'SAR'.tr}',
                  style: getRegularStyle(color: ColorsManager.blackColor),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: 10, right: AppPadding.p20)
              : const EdgeInsets.only(top: 10, left: AppPadding.p20),
          child: Row(
            children: [
              Text(
                'tax'.tr,
                style: getRegularStyle(color: ColorsManager.defaultGreyColor),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(left: AppPadding.p30)
                    : const EdgeInsets.only(right: AppPadding.p30),
                child: Text(
                  '${controller.getICD.data!.tax} %',
                  style: getRegularStyle(color: ColorsManager.blackColor),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: 10, right: AppPadding.p20)
              : const EdgeInsets.only(top: 10, left: AppPadding.p20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'payment_discount'.tr,
                style: getRegularStyle(color: ColorsManager.defaultGreyColor),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(left: 160)
                    : const EdgeInsets.only(right: 159),
                child: Text(
                  paymentController.showDiscount.value == true
                      ? paymentController.getCoupon.data!.isRate! == true
                          ? '${paymentController.getCoupon.data!.discountRate!} %'
                          : '${paymentController.getCoupon.data!.discountRate!} ${'SAR'.tr}'
                      : '0 ${'SAR'.tr}',
                  style: getRegularStyle(color: ColorsManager.blackColor),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: 10, right: AppPadding.p20)
              : const EdgeInsets.only(top: 10, left: AppPadding.p20),
          child: Row(
            children: [
              Text(
                'total_amount_payment'.tr,
                style: getRegularStyle(color: ColorsManager.defaultGreyColor),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: isArabic
                    ? const EdgeInsets.only(left: AppPadding.p30)
                    : const EdgeInsets.only(right: AppPadding.p30),
                child: Obx(
                  () => Text(
                    paymentController.showDiscount.value == true
                        ? '${paymentController.getCoupon.data!.totalPrice!} ${'SAR'.tr}'
                        : '${controller.getICD.data!.totalPrice!} ${'SAR'.tr}',
                    style: getRegularStyle(color: ColorsManager.blackColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
