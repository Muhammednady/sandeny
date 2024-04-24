import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/colors_manager.dart';

import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/Scale_widgets/scales_header_widget.dart';
import '../controllers/scales_controller.dart';

class ScalesDescriptionView extends GetView {
  const ScalesDescriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var controller = Get.put(ScalesController());
    return Scaffold(
      body: Column(
        children: [
          scaleHeader(context, controller),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: AppPadding.p30,
                              left: AppPadding.p30,
                              top: AppPadding.p20,
                            )
                          : const EdgeInsets.only(
                              right: AppPadding.p30,
                              left: AppPadding.p30,
                              top: AppPadding.p20,
                            ),
                      child: Text(
                        isArabic
                            ? controller.getScale.description!.ar!
                            : controller.getScale.description!.en!,
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                          fontSize: FontSizeManager.s12,
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              ButtonsManager.primaryButton(
                text: 'start_the_scale'.tr,
                minimumSize: const Size(315, 50),
                maximumSize: const Size(315, 50),
                onPressed: () {
                  Get.toNamed(Routes.SCALE_QUESTIONS);
                },
                context: context,
              )
            ],
          )
        ],
      ),
    );
  }
}
