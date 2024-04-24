import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/search_widgets/doctor_filter_widget.dart';
import '../../../../widgets/search_widgets/search_widget.dart';
import '../../doctors/controllers/doctors_controller.dart';
import '../controllers/immediate_consultation_controller.dart';

class GetAvailableICDoctorView
    extends GetView<ImmediateConsultationController> {
  const GetAvailableICDoctorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var doctorController = Get.put(DoctorsController());
    var isArabic = Get.locale!.languageCode == 'ar';
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
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
              Get.back();
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
                doctorFilter(context);
              },
              icon: SvgPicture.asset(
                Images.filterIcon,
              ),
            ),
          ),
        ],
        title: Text(
          'doctors'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
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
                  if (controller.isLoading.value == false) {
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
                                    // await controller.getDoctorSpecificationId(
                                    //     id: controller.getDoctor.id!);
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
                                                    doctorController
                                                        .getDoctorDetails(
                                                            doctorId: controller
                                                                .getDoctorData[
                                                                    index]
                                                                .id!);
                                                    EasyLoading.show(
                                                      status: 'loading'.tr,
                                                    );
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                      controller
                                                          .getDoctorData[index]
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 20,
                                                    ),
                                                    child: Text(
                                                      controller
                                                          .getDoctorData[index]
                                                          .name!,
                                                      style: getRegularStyle(
                                                        color: ColorsManager
                                                            .blackColor,
                                                        fontSize:
                                                            FontSizeManager.s14,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                            .getDoctorData[
                                                                index]
                                                            .specializations!
                                                            .length,
                                                        itemBuilder:
                                                            (context, i) {
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
                                                                  color: Colors
                                                                      .grey,
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
                                                          height: 10,
                                                        ),
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
                                                    ? controller
                                                        .getDoctorData[index]
                                                        .description!
                                                        .ar!
                                                    : controller
                                                        .getDoctorData[index]
                                                        .description!
                                                        .en!,
                                                style: getRegularStyle(
                                                  color: Colors.grey,
                                                  fontSize: FontSizeManager.s10,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.getDoctorDetails(
                                                    doctorId: controller
                                                        .getDoctorData[index]
                                                        .id!);
                                                EasyLoading.show(
                                                    status: 'loading'.tr);
                                              },
                                              child: Text(
                                                'more'.tr,
                                                style: getRegularStyle(
                                                  color: ColorsManager
                                                      .primaryColor,
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
                                      Padding(
                                        padding: isArabic
                                            ? const EdgeInsets.only(
                                                top: AppPadding.p20,
                                              )
                                            : const EdgeInsets.only(
                                                top: AppPadding.p20,
                                              ),
                                        child: ButtonsManager.primaryButton(
                                          text: 'b_immidiately_consultation'.tr,
                                          buttonColor: ColorsManager.mainColor,
                                          fontSize: FontSizeManager.s12,
                                          onPressed: () {
                                            controller.doctorId.value =
                                                controller
                                                    .getDoctorData[index].id!;
                                            controller
                                                .getImmediateConsultationDetails(
                                                    controller
                                                        .getDoctorData[index]
                                                        .id!);
                                          },
                                          context: context,
                                          maximumSize: const Size(284, 40),
                                          minimumSize: const Size(284, 40),
                                        ),
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
          ],
        ),
      ),
    );
  }
}
