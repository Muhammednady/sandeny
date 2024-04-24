import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/appointment_booking/relative-relation-widget.dart';
import '../../../../widgets/text_form_fields.dart';
import '../controllers/bilateral_session_details_controller.dart';

class BilateralSessionDetailsView
    extends GetView<BilateralSessionDetailsController> {
  const BilateralSessionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    final controller = Get.put(BilateralSessionDetailsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.greyColor,
        elevation: 0,
        leading: Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: AppPadding.p30)
              : const EdgeInsets.only(left: AppPadding.p30),
          child: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsManager.blackColor,
            ),
          ),
        ),
        title: Text(
          'bilateralـsession_informations'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(right: AppPadding.p60)
                  : const EdgeInsets.only(left: AppPadding.p60),
              child: SizedBox(
                width: Get.width,
                height: Get.height * 0.75,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(left: AppPadding.p60)
                            : const EdgeInsets.only(right: AppPadding.p60),
                        child: Container(
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
                                        'other_person_information'.tr,
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: isArabic
                                          ? const EdgeInsets.only(
                                              right: AppPadding.p10,
                                              left: AppPadding.p10,
                                            )
                                          : const EdgeInsets.only(
                                              left: AppPadding.p10,
                                              right: AppPadding.p10,
                                            ),
                                      child: Text(
                                        'enter_other_person_information'.tr,
                                        style: getRegularStyle(
                                          color: ColorsManager.fontColor,
                                          fontSize: FontSizeManager.s14,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: isArabic
                                        ? const EdgeInsets.only(
                                            top: AppPadding.p20,
                                            right: AppPadding.p20)
                                        : const EdgeInsets.only(
                                            top: AppPadding.p20,
                                            left: AppPadding.p20),
                                    child: Text(
                                      'phone_number'.tr,
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

                              // Phone number text field widget
                              Form(
                                key: controller.formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: phoneNumberFormField(
                                  context,
                                  controller,
                                  ColorsManager.greyColor,
                                  'phone_number'.tr,
                                  ColorsManager.hintStyleColor,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: isArabic
                                        ? const EdgeInsets.only(
                                            top: AppPadding.p20,
                                            right: AppPadding.p20)
                                        : const EdgeInsets.only(
                                            top: AppPadding.p20,
                                            left: AppPadding.p20),
                                    child: Text(
                                      'relative-relation'.tr,
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
                              Padding(
                                padding: isArabic
                                    ? const EdgeInsets.only(
                                        right: AppPadding.p15,
                                        left: AppPadding.p15)
                                    : const EdgeInsets.only(
                                        top: AppPadding.p20,
                                        left: AppPadding.p20),
                                child: relativeRelationDropDown(context),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(left: AppPadding.p60)
                            : const EdgeInsets.only(right: AppPadding.p60),
                        child: Container(
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
                                    onChanged: (value) {
                                      controller.problem = value;
                                    },
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
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: ColorsManager.greyColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      Obx(
                                        () => controller.fileName.value == ''
                                            ? const SizedBox()
                                            : Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: isArabic
                                                          ? const EdgeInsets
                                                                  .only(
                                                              right: 20,
                                                              top: 10)
                                                          : const EdgeInsets
                                                                  .only(
                                                              left: 20,
                                                              top: 10),
                                                      child: Text(
                                                        controller.filesToDisplay
                                                            .toString(),
                                                        style: getRegularStyle(
                                                          color: ColorsManager
                                                              .errorColor,
                                                          fontSize:
                                                              FontSizeManager
                                                                  .s15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                      Padding(
                                        padding: isArabic
                                            ? const EdgeInsets.only(
                                                top: 30,
                                              )
                                            : const EdgeInsets.only(
                                                top: 30,
                                              ),
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.selectFiles(),
                                          child: SvgPicture.asset(
                                            Images.attachFileIcon,
                                          ),
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
                                      const SizedBox(
                                        height: 15,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(
                      top: AppPadding.p20, right: AppPadding.p60)
                  : const EdgeInsets.only(
                      top: AppPadding.p20, left: AppPadding.p60),
              child: Row(
                children: [
                  ButtonsManager.primaryButton(
                    text: 'booking_confirmation'.tr,
                    onPressed: () {
                      controller.sendBilateralSessionDetails();
                    },
                    context: context,
                    maximumSize: const Size(171, 50),
                    minimumSize: const Size(171, 50),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ButtonsManager.secondaryButton(
                    text: 'previous'.tr,
                    onPressed: () {},
                    buttonColor: ColorsManager.greyColor,
                    textColor: ColorsManager.fontColor,
                    context: context,
                    maximumSize: const Size(134, 50),
                    minimumSize: const Size(134, 50),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
