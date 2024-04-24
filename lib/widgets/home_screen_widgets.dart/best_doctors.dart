import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/images_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../app/modules/home/controllers/home_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/values_manager.dart';
import '../best_doctors_widgets/doctor_details.dart';

Widget bestDoctorsWidget(BuildContext context) {
  var controller = HomeController.instance;
  var storage = GetStorage();
  var isArabic = Get.locale!.languageCode == 'ar';
  return Padding(
    padding: isArabic
        ? const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p40)
        : const EdgeInsets.only(left: AppPadding.p40, right: AppPadding.p20),
    child: Obx((() {
      if (controller.isLoading.value == true) {
        EasyLoading.show(status: 'loading'.tr);
      }
      return SizedBox(
        height: 200,
        child: controller.bestDoctorsList.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 50,
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
                        // await controller.getBestDoctor();
                      },
                      context: context,
                      minimumSize: const Size(150, 40),
                      maximumSize: const Size(150, 40),
                    )
                  ],
                ),
              )
            : ListView.separated(
                itemCount: controller.bestDoctorsList.length,
                itemBuilder: ((context, index) => Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setDoctor =
                                controller.bestDoctorsList[index];
                            doctorDetailsWidget(context, controller);
                          },
                          child: Container(
                            width: 153,
                            height: 196,
                            decoration: BoxDecoration(
                              color: ColorsManager.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Obx(
                                        () => Visibility(
                                          visible:
                                              storage.read('token') != null,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: ColorsManager.greyColor,
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                splashColor: Colors.transparent,
                                                onPressed: () {
                                                  controller.setFavorite(
                                                      controller
                                                          .bestDoctorsList[
                                                              index]
                                                          .isFavorite!);
                                                  // controller
                                                  //     .selectFavoriteDoctor(
                                                  //         doctorId: controller
                                                  //             .bestDoctorsList[
                                                  //                 index]
                                                  //             .id!);
                                                  controller.setDoctor =
                                                      controller
                                                              .bestDoctorsList[
                                                          index];
                                                },
                                                icon: Icon(
                                                  Icons.favorite,
                                                  size: 18,
                                                  color: controller
                                                              .bestDoctorsList[
                                                                  index]
                                                              .isFavorite ==
                                                          true
                                                      ? ColorsManager.errorColor
                                                      : ColorsManager
                                                          .whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: isArabic
                                      ? const EdgeInsets.only(
                                          right: 50, top: AppPadding.p20)
                                      : const EdgeInsets.only(
                                          left: 50, top: AppPadding.p20),
                                  child:
                                      controller.bestDoctorsList[index].image ==
                                              null
                                          ? CircleAvatar(
                                              child: Image.asset(
                                                Images.womenDoctor,
                                                height: 50,
                                                width: 50,
                                              ),
                                            )
                                          : CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                controller
                                                    .bestDoctorsList[index]
                                                    .image!,
                                              ),
                                            ),
                                ),
                                Padding(
                                  padding: isArabic
                                      ? const EdgeInsets.only(
                                          top: AppSize.s80, right: 35)
                                      : const EdgeInsets.only(
                                          top: AppSize.s80, left: 35),
                                  child: Text(
                                    '${controller.bestDoctorsList[index].doctor!.fname!} ${controller.bestDoctorsList[index].doctor!.lname!}',
                                    style: getRegularStyle(
                                        color: ColorsManager.blackColor,
                                        fontSize: FontSizeManager.s14,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Padding(
                                  padding: isArabic
                                      ? const EdgeInsets.only(
                                          top: AppSize.s100, right: 40)
                                      : const EdgeInsets.only(
                                          top: 105, left: 40),
                                  child: Text(
                                    'personal_Medicine'.tr,
                                    style: getRegularStyle(
                                        color: ColorsManager.hintStyleColor,
                                        fontSize: FontSizeManager.s10),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: AppSize.s125),
                                  child: Divider(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Padding(
                                  padding: isArabic
                                      ? const EdgeInsets.only(
                                          top: AppSize.s140, right: AppSize.s20)
                                      : const EdgeInsets.only(
                                          top: AppSize.s140, left: AppSize.s20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller.bestDoctorsList[index]
                                              .aboutTheDoctor!,
                                          style: getRegularStyle(
                                              color: ColorsManager.blackColor,
                                              fontSize: FontSizeManager.s10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
              ),
      );
    })),
  );
}
