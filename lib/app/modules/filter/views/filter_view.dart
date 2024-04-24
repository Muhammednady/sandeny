import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/filter_doctor_widgets/filter_result.dart';
import '../../../../widgets/search_widgets/doctor_filter_widget.dart';
import '../../../../widgets/filter_doctor_widgets/no_filter_result_found.dart';
import '../controllers/filter_controller.dart';

class FilterView extends GetView<FilterController> {
  const FilterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.greyColor,
        elevation: 0,
        leading: Padding(
          padding: Get.locale!.languageCode == 'ar'
              ? const EdgeInsets.only(right: AppPadding.p30)
              : const EdgeInsets.only(left: AppPadding.p30),
          child: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              // back to previous page and delete the memory of the search result
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
            padding: Get.locale!.languageCode == 'ar'
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
          'search_details'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.getSearchResultList.isEmpty) {
            return noFilterResult(context, controller);
          }
          return filterResult(context, controller);
        },
      ),
    );
  }
}
