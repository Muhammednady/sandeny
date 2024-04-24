import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';
import '../../constants/buttons_manager.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';
import '../best_doctors_widgets/doctor_details.dart';
import '../search_widgets/search_widget.dart';

Widget filterResult(BuildContext context, dynamic controller) {
  // var controller = Get.put(SearchController());
  var isArabic = Get.locale!.languageCode == 'ar';
  return Column(
    children: [
      Padding(
        padding: isArabic
            ? EdgeInsets.only(top: 20, left: Get.width * 0.13, right: 29)
            : EdgeInsets.only(top: 20, left: Get.width * 0.13, right: 29),
        child: searchWidget(context),
      ),
      const SizedBox(
        height: 20,
      ),
      Expanded(
        child: Padding(
          padding: isArabic
              ? EdgeInsets.only(left: Get.width * 0.13, right: Get.width * 0.1)
              : EdgeInsets.only(left: Get.width * 0.13, right: Get.width * 0.1),
          child: SizedBox(
            width: 315,
            child: Obx(
              () {
                if (controller.isLoading.value == true) {
                  EasyLoading.show(status: 'loading'.tr);
                }
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.searchResultList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 315,
                        // height: 179,
                        decoration: BoxDecoration(
                          color: ColorsManager.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          doctorDetailsWidget(
                                              context, controller);
                                          controller.setDoctor = controller
                                              .searchResultList[index];
                                        },
                                        child: controller
                                                    .searchResultList[index]
                                                    .profileImage ==
                                                null
                                            ? CircleAvatar(
                                                child: Image.asset(
                                                  Images.manDoctor,
                                                  height: 50,
                                                  width: 50,
                                                ),
                                              )
                                            : CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    controller
                                                        .searchResultList[index]
                                                        .profileImage!),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 10,
                                          ),
                                          child: Text(
                                            '${controller.searchResultList[index].name}',
                                            style: getRegularStyle(
                                              color: ColorsManager.blackColor,
                                              fontSize: FontSizeManager.s14,
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
                                            height: 20,
                                            width: 150,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller
                                                  .searchResultList[index]
                                                  .specializations!
                                                  .length,
                                              itemBuilder: (context, i) {
                                                return Row(
                                                  children: [
                                                    Text(
                                                      isArabic
                                                          ? controller
                                                              .searchResultList[
                                                                  index]
                                                              .specializations![
                                                                  i]
                                                              .name!
                                                              .ar!
                                                          : controller
                                                              .searchResultList[
                                                                  index]
                                                              .specializations![
                                                                  i]
                                                              .name!
                                                              .en!,
                                                      style: getRegularStyle(
                                                        color: Colors.grey,
                                                        fontSize:
                                                            FontSizeManager.s10,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    controller
                                                                .searchResultList[
                                                                    index]
                                                                .specializations!
                                                                .last !=
                                                            controller
                                                                .searchResultList[
                                                                    index]
                                                                .specializations![i]
                                                        ? const Text(
                                                            ' | ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(
                                                width: 3,
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
                                      "${'5/'.tr}${controller.searchResultList[index].rateAvg}",
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
                                          ? controller.searchResultList[index]
                                              .description!.ar!
                                          : controller.searchResultList[index]
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
                                      controller.setDoctor =
                                          controller.searchResultList[index];
                                      doctorDetailsWidget(context, controller);
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
                              height: 15,
                            ),
                            ButtonsManager.primaryButton(
                              text: 'appointment_booking'.tr,
                              onPressed: () {
                                Get.toNamed(Routes.APPOINTMENT_BOOKING);
                              },
                              context: context,
                              minimumSize: const Size(287, 40),
                              maximumSize: const Size(287, 40),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    });
              },
            ),
          ),
          // child: SizedBox(
          //   width: 315,
          //   child: ListView.separated(
          //       shrinkWrap: true,
          //       itemCount: controller.searchResultList.length,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           width: 315,
          //           // height: 179,
          //           decoration: BoxDecoration(
          //             color: ColorsManager.whiteColor,
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Column(
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Row(
          //                     children: [
          //                       Padding(
          //                         padding: Get.locale!.languageCode == 'ar'
          //                             ? const EdgeInsets.only(
          //                                 right: AppPadding.p5,
          //                                 top: AppPadding.p20,
          //                               )
          //                             : const EdgeInsets.only(
          //                                 left: AppPadding.p5,
          //                                 top: AppPadding.p20,
          //                               ),
          //                         child: GestureDetector(
          //                           onTap: () {
          //                             doctorDetailsWidget(
          //                                 context, controller);
          //                             controller.setDoctor =
          //                                 controller.searchResultList[index];
          //                           },
          //                           child: controller.searchResultList[index]
          //                                       .profileImage! ==
          //                                   null
          //                               ? CircleAvatar(
          //                                   child: Image.asset(
          //                                     Images.manDoctor,
          //                                     height: 50,
          //                                     width: 50,
          //                                   ),
          //                                 )
          //                               : CircleAvatar(
          //                                   radius: 30,
          //                                   backgroundImage: NetworkImage(
          //                                       controller
          //                                           .searchResultList[index]
          //                                           .profileImage!),
          //                                 ),
          //                         ),
          //                       ),
          //                       const SizedBox(
          //                         width: 10,
          //                       ),
          //                       Column(
          //                         children: [
          //                           Padding(
          //                             padding: const EdgeInsets.only(
          //                               top: 20,
          //                               left: 10,
          //                             ),
          //                             child: Text(
          //                               '${controller.searchResultList[index].name}',
          //                               style: getRegularStyle(
          //                                 color: ColorsManager.blackColor,
          //                                 fontSize: FontSizeManager.s14,
          //                               ),
          //                             ),
          //                           ),
          //                           const SizedBox(
          //                             height: 5,
          //                           ),
          //                           Padding(
          //                             padding: const EdgeInsets.only(
          //                               bottom: 8,
          //                               left: 10,
          //                             ),
          //                             child: Text(
          //                               'psychiatry'.tr,
          //                               style: getRegularStyle(
          //                                 color: Colors.grey,
          //                                 fontSize: FontSizeManager.s10,
          //                               ),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                   Padding(
          //                     padding: Get.locale!.languageCode == 'ar'
          //                         ? const EdgeInsets.only(
          //                             left: AppPadding.p10,
          //                           )
          //                         : const EdgeInsets.only(
          //                             right: AppPadding.p10,
          //                           ),
          //                     child: Row(children: [
          //                       SvgPicture.asset(
          //                         Images.starIcon,
          //                         color: ColorsManager.yelowColor,
          //                       ),
          //                       const SizedBox(
          //                         width: 5,
          //                       ),
          //                       Text(
          //                         "${'5/'.tr}${controller.searchResultList[index].ratingPercentage!.toStringAsFixed(2)}",
          //                         style: getRegularStyle(
          //                           color: Colors.grey,
          //                           fontSize: FontSizeManager.s10,
          //                         ),
          //                       ),
          //                     ]),
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(
          //                   left: 20,
          //                   right: 20,
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     Expanded(
          //                       child: Text(
          //                         controller
          //                             .searchResultList[index].aboutTheDoctor!,
          //                         style: getRegularStyle(
          //                           color: Colors.grey,
          //                           fontSize: FontSizeManager.s10,
          //                           overflow: TextOverflow.ellipsis,
          //                         ),
          //                       ),
          //                     ),
          //                     GestureDetector(
          //                       onTap: () {
          //                         controller.setDoctor =
          //                             controller.searchResultList[index];
          //                       },
          //                       child: Text(
          //                         'more'.tr,
          //                         style: getRegularStyle(
          //                           color: ColorsManager.primaryColor,
          //                           fontSize: FontSizeManager.s10,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 15,
          //               ),
          //               ButtonsManager.primaryButton(
          //                 text: 'appointment_booking'.tr,
          //                 onPressed: () {
          //                   Get.toNamed(Routes.APPOINTMENT_BOOKING);
          //                 },
          //                 context: context,
          //                 minimumSize: const Size(287, 40),
          //                 maximumSize: const Size(287, 40),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //             ],
          //           ),
          //         );
          //       },
          //       separatorBuilder: (context, index) {
          //         return const SizedBox(
          //           height: 20,
          //         );
          //       }),
          // ),
        ),
      ),
    ],
  );
}
