import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/doctors/controllers/doctors_controller.dart';
import 'package:sandeny/app/modules/home/controllers/home_controller.dart';
import 'package:sandeny/app/modules/scheduled_session/views/scheduled_session_view.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';

class AllDoctorView extends GetView {
  const AllDoctorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var doctorController = Get.put(DoctorsController());
    var isArabic = Get.locale!.languageCode == 'ar';
    return Scaffold(
      body: Padding(
        padding: Get.locale!.languageCode == 'ar'
            ? EdgeInsets.only(left: Get.width * 0.13, right: Get.width * 0.1)
            : const EdgeInsets.only(left: AppPadding.p40),
        child: Obx(
          (() {
            if (controller.isLoading.value == true) {
              return SizedBox(
                height: Get.height * 0.3,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainColor,
                  ),
                ),
              );
            }
            return SizedBox(
              height: Get.height,
              width: Get.width * 0.8,
              child: controller.getDoctorData.isEmpty
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
                              await controller.getDoctorSpecificationId(
                                  id: controller.getDoctor.id!);
                            },
                            context: context,
                            minimumSize: const Size(150, 40),
                            maximumSize: const Size(150, 40),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      height: Get.height,
                      width: 315,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.getDoctorData.length,
                        itemBuilder: (context, index) {
                          return Container(
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
                                                  right: AppPadding.p5,
                                                  top: AppPadding.p20,
                                                )
                                              : const EdgeInsets.only(
                                                  left: AppPadding.p5,
                                                  top: AppPadding.p20,
                                                ),
                                          child: GestureDetector(
                                            onTap: () {
                                              doctorController.getDoctorDetails(
                                                  doctorId: controller
                                                      .getDoctorData[index]
                                                      .id!);
                                              EasyLoading.show(
                                                status: 'loading'.tr,
                                              );
                                            },
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                controller.getDoctorData[index]
                                                    .profileImage!,
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
                                              padding: isArabic
                                                  ? const EdgeInsets.only(
                                                      top: 45,
                                                      left: AppPadding.p20,
                                                    )
                                                  : const EdgeInsets.only(
                                                      top: 45,
                                                      right: AppPadding.p20,
                                                    ),
                                              child: Text(
                                                controller
                                                    .getDoctorData[index].name!,
                                                style: getRegularStyle(
                                                  color:
                                                      ColorsManager.blackColor,
                                                  fontSize: FontSizeManager.s14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                              child: SizedBox(
                                                height: 40,
                                                width: 150,
                                                child: ListView.separated(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: controller
                                                      .getDoctorData[index]
                                                      .specializations!
                                                      .length,
                                                  itemBuilder: (context, i) {
                                                    return Row(
                                                      children: [
                                                        Text(
                                                          isArabic
                                                              ? controller
                                                                  .getDoctorData[
                                                                      index]
                                                                  .specializations![
                                                                      i]
                                                                  .name!
                                                                  .ar!
                                                              : controller
                                                                  .getDoctorData[
                                                                      index]
                                                                  .specializations![
                                                                      i]
                                                                  .name!
                                                                  .en!,
                                                          style:
                                                              getRegularStyle(
                                                            color: Colors.grey,
                                                            fontSize:
                                                                FontSizeManager
                                                                    .s10,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        controller
                                                                    .getDoctorData[
                                                                        index]
                                                                    .specializations!
                                                                    .last !=
                                                                controller
                                                                    .getDoctorData[
                                                                        index]
                                                                    .specializations![i]
                                                            ? const Text(
                                                                ' | ',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              )
                                                            : const SizedBox(),
                                                      ],
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: Get.locale!.languageCode == 'ar'
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
                                          '${'5/'.tr}${controller.getDoctorData[index].rateAvg!}',
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
                                          isArabic
                                              ? controller.getDoctorData[index]
                                                  .description!.ar!
                                              : controller.getDoctorData[index]
                                                  .description!.en!,
                                          style: getRegularStyle(
                                            color: Colors.grey,
                                            fontSize: FontSizeManager.s10,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          doctorController.getDoctorDetails(
                                            doctorId: controller
                                                .getDoctorData[index].id!,
                                          );
                                          EasyLoading.show(
                                            status: 'loading'.tr,
                                          );
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: Get.locale!.languageCode == 'ar'
                                          ? const EdgeInsets.only(
                                              right: AppPadding.p5,
                                              top: AppPadding.p20,
                                            )
                                          : const EdgeInsets.only(
                                              left: AppPadding.p15,
                                              top: AppPadding.p20,
                                            ),
                                      child: ButtonsManager.primaryButton(
                                        text: 'book_a_later_appointment'.tr,
                                        fontSize: FontSizeManager.s11,
                                        onPressed: () {
                                          Get.to(
                                            const ScheduledSessionView(),
                                          );
                                        },
                                        context: context,
                                        maximumSize: const Size(130, 40),
                                        minimumSize: const Size(130, 40),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: Get.locale!.languageCode == 'ar'
                                          ? const EdgeInsets.only(
                                              top: AppPadding.p20,
                                            )
                                          : const EdgeInsets.only(
                                              top: AppPadding.p20,
                                            ),
                                      child: ButtonsManager.secondaryButton(
                                        text:
                                            'begin_immidiately_consultation'.tr,
                                        fontSize: FontSizeManager.s12,
                                        onPressed: () {
                                          Get.toNamed(
                                              Routes.IMMEDIATE_CONSULTATION);
                                        },
                                        context: context,
                                        maximumSize: const Size(130, 40),
                                        minimumSize: const Size(130, 40),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
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
            );
          }),
        ),
      ),
    );
  }
}
