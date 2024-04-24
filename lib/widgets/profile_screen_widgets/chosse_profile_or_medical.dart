import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/profile/controllers/profile_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget profileOrMedical(BuildContext context) {
  var profileController = ProfileController.instance;
  return Padding(
    padding: Get.locale!.languageCode == 'ar'
        ? const EdgeInsets.only(
            top: 10,
          )
        : const EdgeInsets.only(
            top: 10,
          ),
    child: Obx(
      () => GestureDetector(
        onTap: () {
          profileController.selectProfileOrMedical = false;
        },
        child: Container(
          width: 315,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppSize.s50,
            ),
            color: ColorsManager.whiteColor,
            // color: Colors.grey
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 157,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s50),
                  color: profileController.selectValue.value == false
                      ? ColorsManager.primaryColor
                      : ColorsManager.whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'my_profile'.tr,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: profileController.selectValue.value == false
                                ? ColorsManager.whiteColor
                                : ColorsManager.fontColor,
                          ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                  ],
                ),
              ),
              Obx(
                (() => GestureDetector(
                      onTap: () {
                        profileController.selectProfileOrMedical = true;
                      },
                      child: Container(
                        width: 157,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s50),
                          color: profileController.selectValue.value == true
                              ? ColorsManager.primaryColor
                              : ColorsManager.whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'medical_profile'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color:
                                        profileController.selectValue.value ==
                                                true
                                            ? ColorsManager.whiteColor
                                            : ColorsManager.fontColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
