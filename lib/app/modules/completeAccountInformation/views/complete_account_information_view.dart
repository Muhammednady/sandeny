import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/text_form_fields.dart';
import '../../../routes/app_pages.dart';
import '../controllers/complete_account_information_controller.dart';

class CompleteAccountInformationView
    extends GetView<CompleteAccountInformationController> {
  const CompleteAccountInformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var isEnglish = Get.locale!.languageCode == 'en';
    var controller = CompleteAccountInformationController.instance;
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        elevation: 0,
        title: Text(
          'complete_information'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: body(context, isArabic, isEnglish),
        ),
      ),
    );
  }

  body(BuildContext context, isArabic, isEnglish) {
    return Column(
      children: [
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: 10, right: AppPadding.p50)
              : const EdgeInsets.only(top: 10, left: AppPadding.p65),
          child: Row(
            children: [
              Text(
                'complete_information_des'.tr,
                style: getRegularStyle(
                  color: ColorsManager.fontColor,
                  fontSize: FontSizeManager.s14,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 40,
          width: 155,
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              '1-from-4'.tr,
              style: getRegularStyle(
                color: ColorsManager.whiteColor,
                fontSize: FontSizeManager.s13,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: isEnglish
                  ? const EdgeInsets.only(
                      top: AppPadding.p20, left: AppPadding.p65)
                  : const EdgeInsets.only(
                      top: AppPadding.p20, right: AppPadding.p40),
              child: Text(
                'width'.tr,
                style: getRegularStyle(
                  color: ColorsManager.mainColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Padding(
              padding: isEnglish
                  ? const EdgeInsets.only(
                      top: AppPadding.p20, left: AppPadding.p65)
                  : const EdgeInsets.only(
                      top: AppPadding.p20, right: AppPadding.p40),
              child: Text(
                'height'.tr,
                style: getRegularStyle(
                  color: ColorsManager.mainColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: isEnglish
                  ? const EdgeInsets.only(
                      top: AppPadding.p12, left: AppPadding.p30)
                  : const EdgeInsets.only(
                      top: AppPadding.p12, right: AppPadding.p8),
              child: weightFormField(
                  context,
                  controller,
                  ColorsManager.greyColor,
                  '80'.tr,
                  ColorsManager.hintStyleColor),
            ),
            Padding(
              padding: isEnglish
                  ? const EdgeInsets.only(
                      top: AppPadding.p12, left: AppPadding.p8)
                  : const EdgeInsets.only(
                      top: AppPadding.p12, left: AppPadding.p8),
              child: heightFormField(
                  context,
                  controller,
                  ColorsManager.greyColor,
                  '180'.tr,
                  ColorsManager.hintStyleColor),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: isEnglish
                  ? const EdgeInsets.only(
                      top: AppPadding.p20, left: AppPadding.p65)
                  : const EdgeInsets.only(
                      top: AppPadding.p20, right: AppPadding.p40),
              child: Text(
                'birth_date'.tr,
                style: getRegularStyle(
                  color: ColorsManager.mainColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        // Birth date widget
        birthDateWidget(
          context,
          controller,
          ColorsManager.greyColor,
          'birth_date'.tr,
          ColorsManager.hintStyleColor,
        ),
        const SizedBox(
          height: 10,
        ),

        // // Email widget
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Padding(
        //       padding: isEnglish
        //           ? const EdgeInsets.only(
        //               top: AppPadding.p20, left: AppPadding.p65)
        //           : const EdgeInsets.only(
        //               top: AppPadding.p20, right: AppPadding.p40),
        //       child: Text(
        //         'email'.tr,
        //         style: getRegularStyle(
        //           color: ColorsManager.mainColor,
        //           fontSize: FontSizeManager.s14,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        //
        // emailWidget(
        //   context,
        //   controller,
        //   ColorsManager.greyColor,
        //   'email'.tr,
        //   ColorsManager.hintStyleColor,
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: isEnglish
                  ? const EdgeInsets.only(
                      top: AppPadding.p20, left: AppPadding.p65)
                  : const EdgeInsets.only(
                      top: AppPadding.p20, right: AppPadding.p40),
              child: Text(
                'sex'.tr,
                style: getRegularStyle(
                  color: ColorsManager.mainColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        // Types of sex male or female
        selectGender(context, controller),
        
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: isEnglish
                  ? const EdgeInsets.only(
                      top: AppPadding.p20, left: AppPadding.p65)
                  : const EdgeInsets.only(
                      top: AppPadding.p20, right: AppPadding.p40),
              child: Text(
                'social_status'.tr,
                style: getRegularStyle(
                  color: ColorsManager.mainColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        // Social status drop down widget
        selectSocialStatus(
          context,
          controller,
          ColorsManager.hintStyleColor,
          controller.maritalStatus.value.tr,
        ),

        const SizedBox(
          height: 5,
        ),

        // Family member phone number widget
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: isEnglish
                    ? const EdgeInsets.only(
                        top: AppPadding.p20, left: AppPadding.p65)
                    : const EdgeInsets.only(
                        top: AppPadding.p20, right: AppPadding.p40),
                child: Text(
                  'family_member_number'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.mainColor,
                    fontSize: FontSizeManager.s14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(
                      top: AppPadding.p20, left: AppPadding.p20)
                  : const EdgeInsets.only(
                      top: AppPadding.p20, right: AppPadding.p20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.addOtherNumber.value =
                          !controller.addOtherNumber.value;
                    },
                    child: SvgPicture.asset(
                      Images.addCouponIcon,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'add_another_number'.tr,
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
        const SizedBox(
          height: 10,
        ),
        familyMemberPhoneNumberFormField(
            context,
            controller,
            ColorsManager.greyColor,
            'phone_number'.tr,
            ColorsManager.hintStyleColor),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => controller.addOtherNumber.value == true
              ? otherPhoneNumberFormField(
                  context,
                  controller,
                  ColorsManager.greyColor,
                  'phone_number'.tr,
                  ColorsManager.hintStyleColor)
              : const SizedBox(),
        ),
        Padding(
          padding: isEnglish
              ? const EdgeInsets.only(top: AppPadding.p30, left: AppPadding.p20)
              : const EdgeInsets.only(
                  top: AppPadding.p30, right: AppPadding.p12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // controller.checkComplatePatientAccount();
                  controller.checkSubmit();
                },
                child: Container(
                  width: 174,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'next'.tr,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: ColorsManager.whiteColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.HOME);
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorsManager.greyColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'ignore'.tr,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
