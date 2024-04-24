import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../../app/modules/doctors/controllers/doctors_controller.dart';
import '../../app/modules/favorite_doctor/controllers/favorite_doctor_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';
import '../best_doctors_widgets/doctor_details.dart';

Widget favoriteDoctorWidget(BuildContext context, int index) {
  var controller = Get.put(FavoriteDoctorController());
  var doctorController = Get.put(DoctorsController());
  var isArabic = Get.locale!.languageCode == 'ar';
  return Container(
    width: 150,
    decoration: BoxDecoration(
      color: ColorsManager.whiteColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorsManager.greyColor,
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
                          doctorController.removeDoctorFromFavorite(
                            doctorId: controller.getDoctorsList[index].id!,
                          );
                          Get.offAllNamed(Routes.FAVORITE_DOCTOR);
                        } else {
                          doctorController.addDoctorToFavorite(
                            doctorId: controller.getDoctorsList[index].id!,
                          );
                          Get.offAllNamed(Routes.FAVORITE_DOCTOR);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 18,
                        color: controller.isFavorite.value
                            ? ColorsManager.errorColor
                            : ColorsManager.whiteColor,
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
                  left: AppPadding.p20,
                  right: AppPadding.p60,
                  top: AppPadding.p20)
              : const EdgeInsets.only(
                  left: AppPadding.p60, top: AppPadding.p20),
          child: GestureDetector(
            onTap: () {
              controller.setDoctor = controller.getDoctorsList[index];
              doctorDetailsWidget(context, controller);
            },
            child: controller.getDoctorsList[index].profileImage == null
                ? CircleAvatar(
                    child: Image.asset(
                      Images.womenDoctor,
                      height: 50,
                      width: 50,
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(
                      controller.getDoctorsList[index].profileImage!,
                    ),
                  ),
          ),
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: AppSize.s80, right: 30)
              : const EdgeInsets.only(top: AppSize.s80, left: 10),
          child: Text(
            '${controller.getDoctorsList[index].name}',
            style: getRegularStyle(
                color: ColorsManager.blackColor,
                fontSize: FontSizeManager.s14,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: AppSize.s100, right: 20)
              : const EdgeInsets.only(top: 105, left: 20),
          child: SizedBox(
            height: 20,
            width: 150,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount:
                  controller.getDoctorsList[index].specializations!.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Text(
                      isArabic
                          ? controller.getDoctorsList[index].specializations![i]
                              .name!.ar!
                          : controller.getDoctorsList[index].specializations![i]
                              .name!.en!,
                      style: getRegularStyle(
                        color: Colors.grey,
                        fontSize: FontSizeManager.s10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    controller.getDoctorsList[index].specializations!.last !=
                            controller.getDoctorsList[index].specializations![i]
                        ? const Text(
                            ' | ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        : const SizedBox(),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 3,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSize.s125),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
        Padding(
          padding: isArabic
              ? const EdgeInsets.only(top: AppSize.s140, right: AppSize.s20)
              : const EdgeInsets.only(top: AppSize.s140, left: AppSize.s20),
          child: isArabic
              ? Text(
                  controller.getDoctorsList[index].description!.ar!,
                  style: getRegularStyle(
                      color: ColorsManager.blackColor,
                      fontSize: FontSizeManager.s10),
                )
              : Text(
                  controller.getDoctorsList[index].description!.en!,
                  style: getRegularStyle(
                      color: ColorsManager.blackColor,
                      fontSize: FontSizeManager.s10),
                ),
        ),
      ],
    ),
  );
}
