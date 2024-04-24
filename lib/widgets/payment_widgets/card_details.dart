import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/widgets/immediate_consultation_widgets/views/problem_details_view.dart';

import '../../app/modules/payment/controllers/payment_controller.dart';
import '../../constants/buttons_manager.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../text_form_fields.dart';
import 'confirmation_booking.dart';

cardDetails(BuildContext context, int number) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(PaymentController());
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
    builder: (BuildContext context) => Container(
      width: Get.width,
      height: Get.height * 0.60,
      decoration: const BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
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
                  color: ColorsManager.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                'card_details'.tr,
                style: getMediumStyle(
                  color: ColorsManager.fontColor,
                  fontSize: FontSizeManager.s16,
                ),
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 40, right: 90)
                  : const EdgeInsets.only(top: 40, left: 90),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Images.masterCardIcon,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SvgPicture.asset(
                    Images.madaIcon,
                    width: 51,
                    height: 60,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SvgPicture.asset(
                    Images.visaIcon,
                  ),
                ],
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 20)
                  : const EdgeInsets.only(top: 20),
              child: cardHolderNameFormField(
                context,
                controller,
                ColorsManager.greyColor,
                'card_holder_name'.tr,
                ColorsManager.fontColor,
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 15)
                  : const EdgeInsets.only(top: 15),
              child: cardNumberFormField(
                context,
                controller,
                ColorsManager.greyColor,
                'card_number'.tr,
                ColorsManager.fontColor,
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 15, right: 60)
                  : const EdgeInsets.only(top: 15, left: 40),
              child: Row(
                children: [
                  SizedBox(
                    width: 153,
                    child: cardNumberFormField(
                      context,
                      controller,
                      ColorsManager.greyColor,
                      'cvv'.tr,
                      ColorsManager.fontColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 153,
                    child: cardNumberFormField(
                      context,
                      controller,
                      ColorsManager.greyColor,
                      'expiry_date'.tr,
                      ColorsManager.fontColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 10, right: 60)
                  : const EdgeInsets.only(top: 10, left: 60),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.rememberCard.value,
                      onChanged: (value) {
                        controller.rememberCardDetails(value!);
                      },
                    ),
                  ),
                  Text(
                    'save_card'.tr,
                    style: getRegularStyle(
                      color: ColorsManager.fontColor,
                      fontSize: FontSizeManager.s14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(top: 10)
                  : const EdgeInsets.only(top: 10),
              child: ButtonsManager.primaryButton(
                text: 'pay'.tr,
                onPressed: () {
                  if (number == 0) {
                    Get.offAll(() => const ProblemDetailsView());
                  } else {
                    confirmationBooking(context);
                  }
                },
                context: context,
                minimumSize: const Size(315, 50),
                maximumSize: const Size(315, 50),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
