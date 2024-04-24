import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/programs/controllers/programs_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';

stagesAndSessions(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(ProgramsController());
  return Row(
    children: [
      Padding(
        padding: isArabic
            ? const EdgeInsets.only(right: AppPadding.p40, top: AppPadding.p10)
            : const EdgeInsets.only(left: AppPadding.p40, top: AppPadding.p10),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: 153,
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: ColorsManager.borderColor,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(right: AppPadding.p15)
                      : const EdgeInsets.only(left: AppPadding.p15),
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Images.fileIcon,
                        color: ColorsManager.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${controller.getProgram.stagesCount} ${'stages'.tr}',
                  style: getMediumStyle(
                    color: ColorsManager.primaryColor,
                    fontSize: AppSize.s14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Padding(
        padding: isArabic
            ? const EdgeInsets.only(top: AppPadding.p10)
            : const EdgeInsets.only(top: AppPadding.p10),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: 153,
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: ColorsManager.borderColor,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(right: AppPadding.p15)
                      : const EdgeInsets.only(left: AppPadding.p15),
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Images.calenderIcon,
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${controller.getProgram.totalSessions} ${'sessions'.tr}',
                  style: getMediumStyle(
                    color: ColorsManager.primaryColor,
                    fontSize: AppSize.s14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
