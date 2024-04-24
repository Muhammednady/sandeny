
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sandeny/app/modules/bilateral_session/controllers/bilateral_session_controller.dart';
import 'package:sandeny/app/modules/filter/controllers/filter_controller.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/bilateral_session_widgets/choose_spesialization_for_bilateral_session.dart';
import '../../../../widgets/bilateral_session_widgets/session_nature_bilateral_session.dart';
import '../../../../widgets/immediate_consultation_widgets/session_period_widget.dart';
import '../../../../widgets/search_widgets/rating_percentage.dart';
import '../../../../widgets/select_specialization_type/select_specialization_type.dart';

class BilateralSessionFilterView extends GetView<BilateralSessionController> {
  const BilateralSessionFilterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    final controller = Get.put(BilateralSessionController(), permanent: true);
    final filterController = Get.put(FilterController());
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        title: Text(
          'bilateralـsession'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        backgroundColor: ColorsManager.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: AppPadding.p30)
              : const EdgeInsets.only(left: AppPadding.p30),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => controller.bSList.isEmpty
                  ? SizedBox(
                      height: Get.height * 0.5,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainColor,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(
                                  top: 30,
                                  right: 40,
                                )
                              : const EdgeInsets.only(
                                  top: 30,
                                  left: 40,
                                ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Images.clinicIcon,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'specialization'.tr,
                                style: getMediumStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        chooseSpecializationFBS(context),
                        
                        // choose Specialization Type
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(
                                  top: 20,
                                  right: 40,
                                )
                              : const EdgeInsets.only(
                                  top: 20,
                                  left: 40,
                                ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Images.clinicIcon,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'specialization_type'.tr,
                                style: getMediumStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // choose Specialization Type widget
                        selectSpecializationType(context, controller),
                        const SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(top: 20, right: 40)
                              : const EdgeInsets.only(top: 20, left: 40),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Images.clockIcon,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'session_period'.tr,
                                style: getMediumStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: isArabic
                                  ? const EdgeInsets.only(top: 10, right: 45)
                                  : const EdgeInsets.only(top: 10, left: 60),
                              // choose Doctor Language widget
                              child: sessionPeriodWidget(context, controller),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // Select Session Type widget
                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(
                                  top: 30,
                                  right: 40,
                                )
                              : const EdgeInsets.only(
                                  top: 30,
                                  left: 40,
                                ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Images.videoIcon2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'session_nature'.tr,
                                style: getMediumStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: isArabic
                                  ? const EdgeInsets.only(top: 10, right: 45)
                                  : const EdgeInsets.only(top: 10, left: 60),
                              child: sessionNatureBilateralSession(
                                  context, controller),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: isArabic
                              ? const EdgeInsets.only(top: 30, right: 40)
                              : const EdgeInsets.only(top: 30, left: 40),

                          // choose rating percentage widget
                          child: ratingPercentage(context),
                        ),

                        const SizedBox(
                          height: 50,
                        ),
                        Obx(
                          () => controller.specializationTypeId.value != 0 &&
                                  filterController.specializationId.value !=
                                      0 &&
                                  controller.sessionId.value != 0
                              ? ButtonsManager.primaryButton(
                                  text: 'features_application'.tr,
                                  onPressed: () {
                                    controller.getAvailableDoctors();
                                  },
                                  context: context,
                                  minimumSize: const Size(287, 50),
                                  maximumSize: const Size(287, 50),
                                )
                              : ButtonsManager.primaryButton(
                                  text: 'features_application'.tr.tr,
                                  onPressed: () {},
                                  context: context,
                                  minimumSize: const Size(287, 50),
                                  maximumSize: const Size(287, 50),
                                  buttonColor: Colors.grey,
                                ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
