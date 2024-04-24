import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/payment/controllers/payment_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Widget appointmentInfo(BuildContext context, dynamic appointment) {
  var isArabic = Get.locale!.languageCode == 'ar';
  final paymentController = Get.put(PaymentController());
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(
                          top: 10,
                        )
                      : const EdgeInsets.only(
                          top: 10,
                        ),
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorsManager.greyColor,
                      child: Image.network(
                        appointment.profileImage!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 20, left: 0)
                      : const EdgeInsets.only(top: 20, right: 0),
                  child: Column(
                    children: [
                      Text(
                        appointment.doctorName!,
                        style: getRegularStyle(
                          color: ColorsManager.blackColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: SizedBox(
                          height: 20,
                          child: Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(right: 5)
                                : const EdgeInsets.only(left: 5),
                            child: Text(
                              isArabic
                                  ? appointment.specializations!.ar!
                                  : appointment.specializations!.en!,
                              style: getRegularStyle(
                                color: Colors.grey,
                                fontSize: FontSizeManager.s10,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Obx(
                        () => paymentController.showDiscount.value == true
                        ? Container(
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorsManager.primaryColor
                            .withOpacity(0.1),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(right: 10)
                                : const EdgeInsets.only(left: 10),
                            child: Text(
                              paymentController.getPaymentCoupon.data!
                                  .isRate! ==
                                  true
                                  ? '${'discount'.tr} ${paymentController.getPaymentCoupon.data!.discountRate!} %'
                                  : '${'discount'.tr} ${paymentController.getPaymentCoupon.data!.discountRate!} ${'SAR'.tr}',
                              style: getRegularStyle(
                                color: ColorsManager.primaryColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    )
                        : const SizedBox(),
                  ),
                ),
              ],
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
          padding: isArabic
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
                '${appointment.duration!} ${'minute'.tr}',
                style: getRegularStyle(
                  color: ColorsManager.blackColor,
                  fontSize: 12,
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
              SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Text(
                      appointment.type!,
                      style: getRegularStyle(
                        color: ColorsManager.blackColor,
                        fontSize: FontSizeManager.s12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
