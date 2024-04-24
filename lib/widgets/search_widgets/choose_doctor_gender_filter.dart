import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_manager.dart';
import '../../constants/values_manager.dart';

Widget chooseDoctorGenderFilter(BuildContext context, dynamic controller) {
  return Row(
    children: [
      Obx(
        () => GestureDetector(
          onTap: () {
            controller.gender1.value = !controller.gender1.value;
            controller.gender2.value = false;
            controller.selectGender1(controller.gender1.value);
          },
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: controller.gender1.value == true
                  ? ColorsManager.primaryColor
                  : ColorsManager.lightGreyColor,
            ),
            child: Center(
              child: Text(
                'male'.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: controller.gender1.value == true
                          ? ColorsManager.whiteColor
                          : ColorsManager.fontColor,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Obx(
        () => GestureDetector(
          onTap: () {
            controller.gender2.value = !controller.gender2.value;
            controller.gender1.value = false;
            controller.selectGender2(controller.gender2.value);
          },
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: controller.gender2.value == true
                  ? ColorsManager.primaryColor
                  : ColorsManager.lightGreyColor,
            ),
            child: Center(
              child: Text(
                'female'.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: controller.gender2.value == true
                          ? ColorsManager.whiteColor
                          : ColorsManager.fontColor,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
      ),
    ],
  );

  // return Padding(
  //   padding: isArabic
  //       ? const EdgeInsets.only(top: 10)
  //       : const EdgeInsets.only(top: 10),
  //   child: Container(
  //     width: 330,
  //     height: 40,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(
  //         AppSize.s50,
  //       ),
  //     ),
  //     child: ListView.separated(
  //       separatorBuilder: (context, index) => const SizedBox(
  //         width: 10,
  //       ),
  //       scrollDirection: Axis.horizontal,
  //       itemCount: controller.getSpecializationData.data!.length,
  //       itemBuilder: (context, index) => Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           Obx(
  //             () => GestureDetector(
  //               onTap: () {
  //                 controller.selectDoctorGender(
  //                     controller.getSpecializationData.data![index].id!);
  //               },
  //               child: Container(
  //                 width: 157,
  //                 height: 40,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(AppSize.s50),
  //                   color: controller.genderId.value ==
  //                           controller.getSpecializationData.data![index].id!
  //                       ? ColorsManager.primaryColor
  //                       : ColorsManager.lightGreyColor,
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       isArabic
  //                           ? controller
  //                               .getSpecializationData.data![index].name!.ar!
  //                           : controller
  //                               .getSpecializationData.data![index].name!.en!,
  //                       style:
  //                           Theme.of(context).textTheme.displayMedium!.copyWith(
  //                                 color: controller.genderId.value ==
  //                                         controller.getSpecializationData
  //                                             .data![index].id!
  //                                     ? ColorsManager.whiteColor
  //                                     : ColorsManager.fontColor,
  //                                 fontSize: 14,
  //                               ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // );
}
