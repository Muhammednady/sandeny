import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/Doctors_screen_widgets/choose_doctor_type.dart';
import '../../../../widgets/search_widgets/doctor_filter_widget.dart';
import '../../../../widgets/search_widgets/search_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/doctors_controller.dart';
import 'all_doctor_view.dart';

class DoctorsView extends GetView<DoctorsController> {
  const DoctorsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int? selectedIndex = Get.arguments;
    if (selectedIndex != null) {
      controller.changeTabIndex(selectedIndex);
    }
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
              Get.offAllNamed(Routes.HOME);
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
          'doctors'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(left: AppPadding.p20)
                : const EdgeInsets.only(left: 10),
            child: searchWidget(context),
          ),

          // Choose Doctor Type Widget
          chooseDoctorType(context),

          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: _body(context),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return const AllDoctorView();
  }
}
