import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/more/controllers/terms_and_conditions_controller.dart';
import '../../app/modules/more/views/terms_and_conditions_view.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';

Widget termsAndConditions(BuildContext context, dynamic controller) {
  final isArabic = Get.locale!.languageCode == 'ar';
  return Padding(
    padding: isArabic
        ? const EdgeInsets.only(top: 10, right: 60)
        : const EdgeInsets.only(top: 10, left: 60),
    child: controller.readTerms.value == false
        ? Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.readTerms.value,
                  onChanged: (value) {
                    log(value.toString());
                    controller.changeReadTerms(value!);
                  },
                ),
              ),
              Text(
                'i_accpted_terms_and_conditions'.tr,
                style: getRegularStyle(
                  color: ColorsManager.fontColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
              TextButton(
                onPressed: () {
                  TermsAndConditionsController.instance;
                  Get.to(const TermsAndConditionsView());
                },
                child: Text(
                  'conditions_and_terms'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                    fontSize: FontSizeManager.s14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          )
        : const SizedBox(),
  );
}
