import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/best_doctors_widgets/doctor_details.dart';
import '../../../../widgets/search_widgets/search_widget.dart';
import '../../../routes/app_pages.dart';
import '../../doctors/controllers/doctors_controller.dart';
import '../controllers/bilateral_session_controller.dart';
import 'bilateral_session_filter_view.dart';

class BilateralSessionView extends GetView {
  const BilateralSessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DoctorsController());
    var bSController = Get.put(BilateralSessionController());
    var isArabic = Get.locale!.languageCode == 'ar';
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
                Get.offAllNamed(Routes.HOME);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ColorsManager.blackColor,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(left: AppPadding.p30)
                  : const EdgeInsets.only(right: AppPadding.p30),
              child: IconButton(
                onPressed: () {
                  // doctorFilter(context);
                  Get.to(const BilateralSessionFilterView());
                },
                icon: SvgPicture.asset(
                  Images.filterIcon,
                ),
              ),
            ),
          ],
          title: Text(
            'bilateralـsession'.tr,
            style: getMediumStyle(
              color: ColorsManager.mainColor,
              fontSize: FontSizeManager.s15,
            ),
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(left: AppPadding.p20)
                  : const EdgeInsets.only(left: 10),
              child: searchWidget(context),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: isArabic
                  ? EdgeInsets.only(
                      left: Get.width * 0.13, right: Get.width * 0.1)
                  : const EdgeInsets.only(left: AppPadding.p40),
              child: Obx(
                (() {
                  if (bSController.isLoading.value == true) {
                    EasyLoading.show(status: 'loading'.tr);
                  }
                  return SizedBox(
                    height: Get.height,
                    width: Get.width * 0.8,
                    child: bSController.bSList.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.2,
                            ),
                            child: Column(
                              children: [
                                Text("error_occured".tr),
                                const SizedBox(
                                  height: 10,
                                ),
                                ButtonsManager.primaryButton(
                                  text: 'try_again'.tr,
                                  onPressed: () async {
                                    await controller.getAllDoctors();
                                  },
                                  context: context,
                                  minimumSize: const Size(150, 40),
                                  maximumSize: const Size(150, 40),
                                )
                              ],
                            ),
                          )
                        : LayoutBuilder(
                            builder: (context, constraints) => SizedBox(
                              height: constraints.maxHeight,
                              width: 315,
                              child: LazyLoadScrollView(
                                onEndOfPage: controller.loadNextPage,
                                isLoading: controller.lastPage,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: controller.allDoctorsList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 315,
                                      height: 179,
                                      decoration: BoxDecoration(
                                        color: ColorsManager.whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: isArabic
                                                        ? const EdgeInsets.only(
                                                            right:
                                                                AppPadding.p5,
                                                            top: AppPadding.p20,
                                                          )
                                                        : const EdgeInsets.only(
                                                            left: AppPadding.p5,
                                                            top: AppPadding.p20,
                                                          ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          bottom: 8,
                                                          left: 10,
                                                        ),
                                                        child: Text(
                                                          'psychiatry'.tr,
                                                          style:
                                                              getRegularStyle(
                                                            color: Colors.grey,
                                                            fontSize:
                                                                FontSizeManager
                                                                    .s10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: isArabic
                                                    ? const EdgeInsets.only(
                                                        left: AppPadding.p10,
                                                      )
                                                    : const EdgeInsets.only(
                                                        right: AppPadding.p10,
                                                      ),
                                                child: Row(children: [
                                                  SvgPicture.asset(
                                                    Images.starIcon,
                                                    color: ColorsManager
                                                        .yelowColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  // Text(
                                                  //   '${'5/'.tr}${controller.allDoctorsList[index].ratingPercentage!.toStringAsFixed(2)}',
                                                  //   style: getRegularStyle(
                                                  //     color: Colors.grey,
                                                  //     fontSize:
                                                  //         FontSizeManager.s10,
                                                  //   ),
                                                  // ),
                                                ]),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                            ),
                                            child: Row(
                                              children: [
                                                // Expanded(
                                                //   child: Text(
                                                //     controller
                                                //         .allDoctorsList[index]
                                                //         .aboutTheDoctor!,
                                                //     style: getRegularStyle(
                                                //       color: Colors.grey,
                                                //       fontSize:
                                                //           FontSizeManager.s10,
                                                //       overflow:
                                                //           TextOverflow.ellipsis,
                                                //     ),
                                                //   ),
                                                // ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // controller.setDoctor =
                                                    //     controller
                                                    //             .allDoctorsList[
                                                    //         index];
                                                    doctorDetailsWidget(
                                                        context, controller);
                                                  },
                                                  child: Text(
                                                    'more'.tr,
                                                    style: getRegularStyle(
                                                      color: ColorsManager
                                                          .primaryColor,
                                                      fontSize:
                                                          FontSizeManager.s10,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: Get.locale!
                                                            .languageCode ==
                                                        'ar'
                                                    ? const EdgeInsets.only(
                                                        top: AppPadding.p20,
                                                        right: AppPadding.p20)
                                                    : const EdgeInsets.only(
                                                        top: AppPadding.p20,
                                                        left: AppPadding.p20),
                                                child: ButtonsManager
                                                    .primaryButton(
                                                  text:
                                                      'booking_bilateralـsession'
                                                          .tr,
                                                  buttonColor:
                                                      ColorsManager.mainColor,
                                                  fontSize: FontSizeManager.s10,
                                                  onPressed: () {
                                                    // Get.to(
                                                    //     const BookingBilateralSessionView());
                                                    // bSController
                                                    //     .getAvailableDoctors();
                                                  },
                                                  context: context,
                                                  maximumSize:
                                                      const Size(284, 40),
                                                  minimumSize:
                                                      const Size(284, 40),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 20,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
