import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../controllers/scales_controller.dart';

class ScalesView extends GetView<ScalesController> {
  const ScalesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var controller = Get.put(ScalesController());
    return Scaffold(
      backgroundColor: ColorsManager.lightGreyColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.lightGreyColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'scales'.tr,
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
              () => controller.scalesList.isEmpty
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
                            mainAxisSpacing: 1,
                          ),
                          itemCount: controller.scalesList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: Get.locale!.languageCode == 'ar'
                                  ? const EdgeInsets.only(
                                      right: AppPadding.p5,
                                      top: AppPadding.p10,
                                      left: AppPadding.p5)
                                  : const EdgeInsets.only(
                                      right: AppPadding.p5,
                                      top: AppPadding.p10,
                                      left: AppPadding.p5),
                              child: GestureDetector(
                                onTap: () {
                                  controller.getScaleDetails(
                                      controller.scalesList[index].id!);
                                },
                                child: Container(
                                  width: 153,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        controller.scalesList[index].image!,
                                      ),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        ColorsManager.blackColor
                                            .withOpacity(0.1),
                                        BlendMode.darken,
                                      ),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              Get.locale!.languageCode == 'ar'
                                                  ? const EdgeInsets.only(
                                                      left: AppPadding.p30,
                                                      top: AppPadding.p20)
                                                  : const EdgeInsets.only(
                                                      right: AppPadding.p30,
                                                      top: AppPadding.p20),
                                          child: isArabic
                                              ? Text(
                                                  controller.scalesList[index]
                                                      .name!.ar!,
                                                  style: getMediumStyle(
                                                    color: ColorsManager
                                                        .whiteColor,
                                                    fontSize: AppSize.s14,
                                                  ),
                                                )
                                              : Text(
                                                  controller.scalesList[index]
                                                      .name!.en!,
                                                  style: getMediumStyle(
                                                    color: ColorsManager
                                                        .whiteColor,
                                                    fontSize: AppSize.s14,
                                                  ),
                                                ),
                                        ),
                                        Padding(
                                          padding:
                                              Get.locale!.languageCode == 'ar'
                                                  ? const EdgeInsets.only(
                                                      left: AppPadding.p70,
                                                      top: AppPadding.p15)
                                                  : const EdgeInsets.only(
                                                      right: AppPadding.p70,
                                                      top: AppPadding.p15),
                                          child: Text(
                                            '${controller.scalesList[index].questionCount!} ${'questions'.tr}'
                                                .toString(),
                                            style: getRegularStyle(
                                              color: ColorsManager.whiteColor,
                                              fontSize: AppSize.s12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
