import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/programs/controllers/programs_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';

programDetailsHeader(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(ProgramsController());
  return Container(
    height: 194,
    width: Get.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(
          ColorsManager.blackColor.withOpacity(0.4),
          BlendMode.darken,
        ),
        image: NetworkImage(
          controller.getProgram.image!,
        ),
        fit: BoxFit.cover,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 40,
          left: isArabic ? null : 25,
          right: isArabic ? 25 : null,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: Get.width * 0.2,
              ),
              Text(
                'program_details'.tr,
                style: getMediumStyle(
                  color: ColorsManager.whiteColor,
                  fontSize: FontSizeManager.s14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: isArabic ? null : 25,
          right: isArabic ? 25 : null,
          child: Column(
            children: [
              SizedBox(
                width: 170,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        isArabic
                            ? controller.getProgram.name!.ar!
                            : controller.getProgram.name!.en!,
                        style: getSemiBoldStyle(
                          color: ColorsManager.whiteColor,
                          fontSize: FontSizeManager.s14,
                          height: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 140,
          left: isArabic ? null : 100,
          right: isArabic ? Get.width * 0.7 : null,
          child: Container(
            width: 78,
            height: 29,
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                '${controller.getProgram.price!} ${'SAR'.tr}',
                style: getRegularStyle(
                  color: ColorsManager.mainColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
