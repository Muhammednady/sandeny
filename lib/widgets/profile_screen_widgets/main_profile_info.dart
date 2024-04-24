import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/profile/controllers/profile_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Widget mainProfileInfo(BuildContext context) {
  var profileController = ProfileController.instance;
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? const EdgeInsets.only(top: 5, right: 10)
        : const EdgeInsets.only(top: 5, left: 10),
    child: Container(
      height: 310,
      width: 315,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsManager.whiteColor,
        border: Border.all(
          color: ColorsManager.borderColor,
        ),
      ),
      child: ListView.builder(
        itemCount: profileController.profileList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, right: 20)
                    : const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Text(
                      'main_info'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.mainColor,
                        fontSize: FontSizeManager.s15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // phone number row
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, right: 20)
                    : const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.mobileIcon,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'phone_number'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.hintStyleColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        profileController.profileList[index].data.phone,
                        style: getRegularStyle(
                          color: ColorsManager.fontColor,
                          fontSize: FontSizeManager.s15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: ColorsManager.primaryColor,
                  thickness: 0.1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // identity number row
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, right: 20)
                    : const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.identityIcon,
                      height: 15,
                      width: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'id'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.hintStyleColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      profileController.profileList[index].data.iqamaNumber,
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: FontSizeManager.s15,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: ColorsManager.primaryColor,
                  thickness: 0.1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // birth date row
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, right: 20)
                    : const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.calenderIcon,
                      color: ColorsManager.primaryColor,
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'birth_date'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.hintStyleColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      profileController.profileList[index].data.dOB,
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: FontSizeManager.s15,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: ColorsManager.primaryColor,
                  thickness: 0.1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(top: 10, right: 20)
                    : const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.twoPersonIcon,
                      color: ColorsManager.primaryColor,
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'social_status'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.hintStyleColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      profileController.profileList[index].data.maritalStatus
                          .toString(),
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: FontSizeManager.s15,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: ColorsManager.primaryColor,
                  thickness: 0.1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(right: 22)
                    : const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.personIcon,
                      color: ColorsManager.primaryColor,
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'gender'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.hintStyleColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      profileController.profileList[index].data.gender,
                      style: getRegularStyle(
                        color: ColorsManager.fontColor,
                        fontSize: FontSizeManager.s15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    ),
  );
}
