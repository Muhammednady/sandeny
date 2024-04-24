import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/favorite_doctor_widget/favorite_doctor_exist.dart';
import '../../../../widgets/favorite_doctor_widget/no_favorite_doctor.dart';
import '../../../../widgets/search_widgets/doctor_filter_widget.dart';
import '../controllers/favorite_doctor_controller.dart';

class FavoriteDoctorView extends GetView<FavoriteDoctorController> {
  const FavoriteDoctorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          'favorite_doctor'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value == true) {
            EasyLoading.show(status: 'loading'.tr);
          }
          if (controller.getDoctorsList.isNotEmpty) {
            return favoriteDoctorExist(context, controller);
          }
          return noFavoriteDoctors(context, controller);
        },
      ),
    );
  }
}
