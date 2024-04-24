
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../../app/modules/Immediate_consultation/controllers/problem_details_controller.dart';
import '../../../constants/colors_manager.dart';
import '../../../constants/fonts_manager.dart';
import '../../../constants/images_manager.dart';
import '../../../constants/styles_manager.dart';

class ProblemDetailsView extends GetView {
  const ProblemDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var controller = Get.put(ProblemDetailsController());
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        elevation: 0,
        title: Text(
          'problem_details'.tr,
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
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(right: 25)
                        : const EdgeInsets.only(left: 25),
                    child: Text(
                      'descripe_your_problem'.tr,
                      style: getMediumStyle(
                        color: ColorsManager.primaryColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
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
                        height: 2,
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
                // height: 103,
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
                                        ? const EdgeInsets.only(
                                            right: 20, top: 10)
                                        : const EdgeInsets.only(
                                            left: 20, top: 10),
                                    child: Text(
                                      controller.filesToDisplay[0].toString(),
                                      style: getRegularStyle(
                                        color: ColorsManager.errorColor,
                                        fontSize: FontSizeManager.s15,
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
                        onTap: () async {
                          controller.selectFiles();
                        },
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
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonsManager.primaryButton(
              text: 'immediate_consultation'.tr,
              onPressed: () {
                controller.addProblemReason();
              },
              context: context,
              minimumSize: const Size(287, 50),
              maximumSize: const Size(287, 50),
            )
          ],
        ),
      ),
    );
  }
}
