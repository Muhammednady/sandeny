import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/home/controllers/home_controller.dart';
import '../../app/routes/app_pages.dart';
import '../../constants/buttons_manager.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Widget noFavoriteDoctors(BuildContext context, dynamic controller) {
  var arabic = Get.locale!.languageCode == 'ar';
  var homeController = Get.put(HomeController());
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: arabic
              ? EdgeInsets.only(
                  top: Get.height / 6,
                  left: Get.width * 0.13,
                  right: Get.width * 0.13,
                )
              : EdgeInsets.only(
                  top: Get.height / 6,
                  left: Get.width * 0.13,
                  right: Get.width * 0.13,
                ),
          child: Container(
            width: 315,
            decoration: const BoxDecoration(
              color: ColorsManager.greyColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Images.heartIcon,
                      height: 50,
                      width: 45,
                      color: ColorsManager.errorColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'no_favorite_doctors'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.fontColor,
                    fontSize: FontSizeManager.s16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'no_favorite_doctors_description'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                    fontSize: FontSizeManager.s13,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonsManager.primaryButton(
                  text: 'see_doctor_list'.tr,
                  onPressed: () {
                    homeController.setSpecificationData =
                        homeController.specializationList;
                    homeController.getDoctorSpecificationId(
                        id: homeController.specializationList[0].id!);
                    Get.toNamed(Routes.DOCTORS);
                  },
                  context: context,
                  minimumSize: const Size(188, 50),
                  maximumSize: const Size(188, 50),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
