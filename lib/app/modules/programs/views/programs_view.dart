import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../controllers/programs_controller.dart';

class ProgramsView extends GetView<ProgramsController> {
  const ProgramsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var controller = Get.put(ProgramsController());
    return Scaffold(
      backgroundColor: ColorsManager.lightGreyColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.lightGreyColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'therapeutic_programmes'.tr,
          style: getMediumStyle(
            color: ColorsManager.blackColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(
                    left: AppPadding.p20,
                    right: AppPadding.p20,
                    top: AppPadding.p20,
                  )
                : const EdgeInsets.only(
                    left: AppPadding.p20,
                    right: AppPadding.p20,
                    top: AppPadding.p20,
                  ),
            child: Obx(
              () => controller.programsList.isEmpty
                  ? SizedBox(
                      height: 40,
                      width: Get.width * 0.6,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainColor,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: controller.programsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(
                                    right: AppPadding.p5,
                                    top: AppPadding.p10,
                                    left: AppPadding.p5,
                                  )
                                : const EdgeInsets.only(
                                    right: AppPadding.p5,
                                    top: AppPadding.p10,
                                    left: AppPadding.p5,
                                  ),
                            child: Container(
                              width: 153,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                    ColorsManager.blackColor.withOpacity(0.4),
                                    BlendMode.darken,
                                  ),
                                  image: NetworkImage(
                                    controller.programsList[index].image!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: isArabic
                                          ? const EdgeInsets.only(
                                              top: AppPadding.p10,
                                              left: AppPadding.p10,
                                              right: AppPadding.p10,
                                            )
                                          : const EdgeInsets.only(
                                              top: AppPadding.p10,
                                              left: AppPadding.p10,
                                              right: AppPadding.p10,
                                            ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              isArabic
                                                  ? controller
                                                      .programsList[index]
                                                      .title!
                                                      .ar!
                                                  : controller
                                                      .programsList[index]
                                                      .title!
                                                      .en!,
                                              style: getMediumStyle(
                                                color: ColorsManager.whiteColor,
                                                fontSize: AppSize.s12,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: isArabic
                                          ? const EdgeInsets.only(
                                              left: AppPadding.p70,
                                              top: AppPadding.p15,
                                            )
                                          : const EdgeInsets.only(
                                              right: AppPadding.p70,
                                              top: AppPadding.p15,
                                            ),
                                      child: Text(
                                        '${controller.programsList[index].stagesCount!} ${'stages'.tr}',
                                        style: getRegularStyle(
                                          color: ColorsManager.whiteColor,
                                          fontSize: AppSize.s12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.05,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.getProgramDetails(
                                            controller.programsList[index].id!);
                                      },
                                      child: Container(
                                        width: 135,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: ColorsManager.whiteColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'join_now'.tr,
                                            style: getRegularStyle(
                                              color: ColorsManager.primaryColor,
                                              fontSize: AppSize.s12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
