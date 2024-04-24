import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../../../constants/values_manager.dart';
import '../../../../widgets/program_details_widgets/about_programs.dart';
import '../../../../widgets/program_details_widgets/program_details_header.dart';
import '../../../../widgets/program_details_widgets/program_objectives.dart';
import '../../../../widgets/program_details_widgets/stages_and_sessions_widget.dart';
import '../../../../widgets/program_details_widgets/stages_list.dart';

class ProgramDetailsView extends GetView {
  const ProgramDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      body: Column(
        children: [
          // Program Details Header Widget
          programDetailsHeader(context),

          const SizedBox(
            height: 20,
          ),

          SizedBox(
            width: Get.width,
            height: Get.height * 0.6,
            child: SingleChildScrollView(
              child: Column(children: [
                // Stages and Sessions Widget
                stagesAndSessions(context),

                const SizedBox(
                  height: 15,
                ),

                // About Program Widget
                aboutProgram(context),

                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: AppPadding.p40, top: AppPadding.p10)
                          : const EdgeInsets.only(
                              left: AppPadding.p40, top: AppPadding.p10),
                      child: Text(
                        'program_stages'.tr,
                        style: getMediumStyle(
                          color: ColorsManager.blackColor,
                          fontSize: AppSize.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                // Stages List Widget
                stagesList(context),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(
                              right: AppPadding.p40, top: AppPadding.p10)
                          : const EdgeInsets.only(
                              left: AppPadding.p40, top: AppPadding.p10),
                      child: Text(
                        'program_objectives'.tr,
                        style: getMediumStyle(
                          color: ColorsManager.blackColor,
                          fontSize: AppSize.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                programObjectives(context),
              ]),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Button Widget
          ButtonsManager.primaryButton(
            text: 'join_program'.tr,
            minimumSize: const Size(315, 50),
            maximumSize: const Size(315, 50),
            onPressed: () {
              // Get.toNamed(Routes.PAYMENT, arguments: 1);
            },
            context: context,
          )
        ],
      ),
    );
  }
}
