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
import '../../../routes/app_pages.dart';
import '../controllers/doctors_controller.dart';

class PersonalDoctorView extends GetView {
  const PersonalDoctorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DoctorsController());
    return Scaffold(
      body: Padding(
        padding: Get.locale!.languageCode == 'ar'
            ? EdgeInsets.only(left: Get.width * 0.13, right: Get.width * 0.1)
            : const EdgeInsets.only(left: AppPadding.p40),
        child: Obx(() {
          if (controller.isLoading.value == true) {
            EasyLoading.show(status: 'loading'.tr);
          }
          return SizedBox(
            height: Get.height,
            width: Get.width * 0.8,
            child: controller.personalDoctorsList.isEmpty
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
                            await controller.getPersonalDoctors();
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
                          itemCount: controller.personalDoctorsList.length,
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
                                            padding:
                                                Get.locale!.languageCode == 'ar'
                                                    ? const EdgeInsets.only(
                                                        right: AppPadding.p5,
                                                        top: AppPadding.p20,
                                                      )
                                                    : const EdgeInsets.only(
                                                        left: AppPadding.p5,
                                                        top: AppPadding.p20,
                                                      ),
                                            child: GestureDetector(
                                              onTap: () {
                                                // controller.setDoctor = controller
                                                //     .personalDoctorsList[index];
                                                doctorDetailsWidget( 
                                                    context, controller);
                                              },
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  controller
                                                      .personalDoctorsList[
                                                          index]
                                                      .image!,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 20,
                                                  left: 10,
                                                ),
                                                child: Text(
                                                  "${controller.personalDoctorsList[index].doctor!.fname!} ${controller.personalDoctorsList[index].doctor!.lname!}",
                                                  style: getRegularStyle(
                                                    color: ColorsManager
                                                        .blackColor,
                                                    fontSize:
                                                        FontSizeManager.s14,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 8,
                                                  left: 10,
                                                ),
                                                child: Text(
                                                  'psychiatry'.tr,
                                                  style: getRegularStyle(
                                                    color: Colors.grey,
                                                    fontSize:
                                                        FontSizeManager.s10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            Get.locale!.languageCode == 'ar'
                                                ? const EdgeInsets.only(
                                                    left: AppPadding.p10,
                                                  )
                                                : const EdgeInsets.only(
                                                    right: AppPadding.p10,
                                                  ),
                                        child: Row(children: [
                                          SvgPicture.asset(
                                            Images.starIcon,
                                            color: ColorsManager.yelowColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${'5/'.tr}${controller.personalDoctorsList[index].ratingPercentage!.toStringAsFixed(2)}',
                                            style: getRegularStyle(
                                              color: Colors.grey,
                                              fontSize: FontSizeManager.s10,
                                            ),
                                          ),
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
                                        Expanded(
                                          child: Text(
                                            controller
                                                .personalDoctorsList[index]
                                                .aboutTheDoctor!,
                                            style: getRegularStyle(
                                              color: Colors.grey,
                                              fontSize: FontSizeManager.s10,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // controller.setDoctor = controller
                                            //     .personalDoctorsList[index];
                                            doctorDetailsWidget(
                                                context, controller);
                                          },
                                          child: Text(
                                            'more'.tr,
                                            style: getRegularStyle(
                                              color: ColorsManager.primaryColor,
                                              fontSize: FontSizeManager.s10,
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
                                        padding:
                                            Get.locale!.languageCode == 'ar'
                                                ? const EdgeInsets.only(
                                                    right: AppPadding.p20,
                                                    top: AppPadding.p20,
                                                  )
                                                : const EdgeInsets.only(
                                                    left: AppPadding.p20,
                                                    top: AppPadding.p20,
                                                  ),
                                        child: ButtonsManager.primaryButton(
                                          text: 'book_a_later_appointment'.tr,
                                          fontSize: FontSizeManager.s10,
                                          onPressed: () {
                                            Get.toNamed(
                                                Routes.APPOINTMENT_BOOKING);
                                          },
                                          context: context,
                                          maximumSize: const Size(138, 40),
                                          minimumSize: const Size(138, 40),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding:
                                            Get.locale!.languageCode == 'ar'
                                                ? const EdgeInsets.only(
                                                    top: AppPadding.p20,
                                                  )
                                                : const EdgeInsets.only(
                                                    top: AppPadding.p20,
                                                  ),
                                        child: ButtonsManager.primaryButton(
                                          text: 'begin_immidiately_consultation'
                                              .tr,
                                          buttonColor: ColorsManager.mainColor,
                                          fontSize: FontSizeManager.s10,
                                          onPressed: () {
                                            Get.toNamed(
                                                Routes.APPOINTMENT_BOOKING);
                                          },
                                          context: context,
                                          maximumSize: const Size(138, 40),
                                          minimumSize: const Size(138, 40),
                                        ),
                                      ),
                                    ],
                                  ),
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
    );
  }
}
