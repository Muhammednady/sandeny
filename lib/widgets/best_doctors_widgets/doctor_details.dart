import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';
import 'package:sandeny/widgets/best_doctors_widgets/about_doctor_widget.dart';
import 'package:sandeny/widgets/best_doctors_widgets/choose_about_doctor_or_ratings.dart';
import 'package:sandeny/widgets/best_doctors_widgets/doctor_ratings.dart';
import '../../app/routes/app_pages.dart';
import '../../constants/buttons_manager.dart';

import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/values_manager.dart';
import '../no_rating_for_doctor.dart';

doctorDetailsWidget(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var storage = GetStorage();
  return showModalBottomSheet(
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: Get.height * 0.90,
        width: Get.width,
        decoration: const BoxDecoration(
          color: ColorsManager.greyColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  width: 44,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: ColorsManager.lightGreyColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Obx(
                    () => Visibility(
                      visible: storage.read('token') != null,
                      child: Padding(
                        padding: isArabic
                            ? const EdgeInsets.only(
                                left: 30,
                                right: 50,
                              )
                            : const EdgeInsets.only(
                                left: 50,
                                right: 30,
                              ),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: ColorsManager.whiteColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Center(
                            child: IconButton(
                              splashColor: Colors.transparent,
                              onPressed: () {
                                controller.setFavorite(
                                  !controller.isFavorite.value,
                                );
                                if (controller.isFavorite.value == false) {
                                  controller.removeDoctorFromFavorite(
                                    doctorId: controller.getDoctor.id!,
                                  );
                                } else {
                                  controller.addDoctorToFavorite(
                                    doctorId: controller.getDoctor.id!,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 18,
                                color: controller.isFavorite.value
                                    ? ColorsManager.errorColor
                                    : ColorsManager.defaultGreyColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      controller.getDoctor.profileImage == null ||
                              controller.getDoctor.profileImage == ''
                          ? CircleAvatar(
                              child: Image.asset(
                                Images.manDoctor,
                                height: 50,
                                width: 50,
                              ),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                controller.getDoctor.profileImage!,
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${controller.getDoctor.name}',
                        style: getRegularStyle(
                          color: ColorsManager.blackColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                          left: 10,
                        ),
                        child: SizedBox(
                          height: 20,
                          width: 150,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.getDoctor.specializations!.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: isArabic
                                    ? const EdgeInsets.only(right: 40)
                                    : const EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    Text(
                                      isArabic
                                          ? controller.getDoctor
                                              .specializations![i].name!.ar!
                                          : controller.getDoctor
                                              .specializations![i].name!.en!,
                                      style: getRegularStyle(
                                        color: Colors.grey,
                                        fontSize: FontSizeManager.s10,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    controller.getDoctor.specializations!
                                                .last !=
                                            controller
                                                .getDoctor.specializations![i]
                                        ? const Text(
                                            ' | ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: isArabic
                            ? EdgeInsets.only(
                                right: Get.width * 0.4,
                              )
                            : EdgeInsets.only(
                                left: Get.width * 0.45,
                              ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Images.starIcon,
                              color: ColorsManager.yelowColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Center(
                              child: Text(
                                '${'5/'.tr}${controller.getDoctor.rateAvg!}',
                                style: getRegularStyle(
                                  color: Colors.grey,
                                  fontSize: FontSizeManager.s10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(
                            right: 300,
                          )
                        : const EdgeInsets.only(
                            left: 300,
                          ),
                    child: Container(
                      height: 29,
                      width: 78,
                      decoration: BoxDecoration(
                        color: ColorsManager.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          '${controller.getDoctor.consultationPrice!} ${'currency'.tr}',
                          style: getRegularStyle(
                            color: ColorsManager.fontColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  aboutDoctorOrRatings(context, controller),
                  Obx(
                    () => controller.selectAboutDoctorOrRatings == false
                        ? aboutDoctorWidget(context, controller)
                        : controller.getDoctor.rates!.isEmpty
                            ? noRatingForDoctor(context)
                            : doctorRaringsWidget(context, controller),
                  ),
                ],
              ),
              Obx(
                () => controller.selectValue.value == true
                    ? Container()
                    : Row(
                        children: [
                          Padding(
                            padding: Get.locale!.languageCode == 'ar'
                                ? const EdgeInsets.only(
                                    right: AppPadding.p40,
                                  )
                                : const EdgeInsets.only(
                                    left: AppPadding.p40,
                                  ),
                            child: ButtonsManager.primaryButton(
                              text: 'book_a_later_appointment'.tr,
                              fontSize: FontSizeManager.s12,
                              onPressed: () {
                                Get.toNamed(Routes.SCHEDULED_SESSION);
                              },
                              context: context,
                              maximumSize: const Size(153, 50),
                              minimumSize: const Size(153, 50),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ButtonsManager.primaryButton(
                            text: 'begin_immidiately_consultation'.tr,
                            buttonColor: ColorsManager.mainColor,
                            fontSize: FontSizeManager.s12,
                            onPressed: () {
                              Get.toNamed(Routes.IMMEDIATE_CONSULTATION);
                            },
                            context: context,
                            maximumSize: const Size(153, 50),
                            minimumSize: const Size(153, 50),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
