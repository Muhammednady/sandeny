import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/profile/views/edit_profile_view.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/images_manager.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../widgets/profile_screen_widgets/chosse_profile_or_medical.dart';
import '../../../../widgets/profile_screen_widgets/main_profile_info.dart';
import '../../../../widgets/profile_screen_widgets/medical_file.dart';
import '../../../../widgets/profile_screen_widgets/profile_header.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var profileController = Get.put(ProfileController());
    var storage = GetStorage();
    EasyLoading.addStatusCallback(
      (status) {
        if (status == EasyLoadingStatus.dismiss) {}
      },
    );
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: ColorsManager.primaryColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: Get.locale!.languageCode == 'ar'
                  ? const EdgeInsets.only(
                      left: 10,
                      top: 10,
                    )
                  : const EdgeInsets.only(
                      right: 20,
                      top: 10,
                    ),
              child: IconButton(
                onPressed: () {
                  Get.to(const EditProfileView());
                },
                icon: Image.asset(
                  Images.editIcon,
                  color: ColorsManager.whiteColor,
                ),
              ),
            ),
          ],
          title: Obx(
            () => Text(
              controller.selectProfileOrMedical == true
                  ? 'medical_profile'.tr
                  : 'profile'.tr,
              style: getMediumStyle(
                color: ColorsManager.whiteColor,
                fontSize: FontSizeManager.s14,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          EasyLoading.show(status: 'loading'.tr);
        }
        return Visibility(
          visible: storage.read('token') != null,
          child: controller.profileList.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                    top: Get.height * 0.2,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text("error_occured".tr),
                        const SizedBox(
                          height: 10,
                        ),
                        ButtonsManager.primaryButton(
                          text: 'try_again'.tr,
                          onPressed: () {
                            controller.loadProfile();
                          },
                          context: context,
                          minimumSize: const Size(150, 40),
                          maximumSize: const Size(150, 40),
                        )
                      ],
                    ),
                  ),
                )
              : Obx(
                  (() {
                    if (controller.isLoading.value == true) {
                      EasyLoading.show(status: 'loading'.tr);
                    }
                    return ListView.builder(
                      itemCount: controller.profileList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Stack(
                          children: [
                            // profile header widget
                            profileHeaderWidget(context),

                            Padding(
                              padding: const EdgeInsets.only(top: 175),
                              child: Container(
                                height: 80,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: ColorsManager.greyColor,
                                ),
                              ),
                            ),

                            Positioned(
                              top: 50,
                              left: 0,
                              right: 0,
                              child: controller.profileList[index].data
                                          .profileImage ==
                                      ''
                                  ? const Center(
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            AssetImage(Images.manDoctor),
                                      ),
                                    )
                                  : Center(
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          controller.profileList[index].data
                                              .profileImage
                                              .toString(),
                                        ),
                                      ),
                                    ),
                            ),

                            Padding(
                              padding: Get.locale!.languageCode == 'ar'
                                  ? const EdgeInsets.only(
                                      top: 160,
                                    )
                                  : const EdgeInsets.only(
                                      top: 160,
                                    ),
                              child: Center(
                                child: Text(
                                  '${controller.profileList[index].data.firstName} ${controller.profileList[index].data.lastName}',
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s15,
                                  ),
                                ),
                              ),
                            ),

                            // widget to switch between profile and medical
                            Padding(
                              padding: Get.locale!.languageCode == 'ar'
                                  ? const EdgeInsets.only(top: 190)
                                  : const EdgeInsets.only(
                                      top: 190,
                                    ),
                              child: Container(
                                height: Get.height,
                                width: Get.width,
                                color: ColorsManager.greyColor,
                                child: LayoutBuilder(
                                  builder: (context, constraints) => SizedBox(
                                    height: constraints.maxHeight,
                                    width: 315,
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        profileOrMedical(context),
                                        Obx(
                                          () => profileController
                                                      .selectProfileOrMedical ==
                                                  true
                                              ? medicalFileWidget(context)
                                              : Column(
                                                  children: [
                                                    // booking profile info widget
                                                    // bokkingProfileDataWidget(
                                                    //     context),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    // main profile info widget
                                                    mainProfileInfo(context),
                                                  ],
                                                ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    );
                  }),
                ),
        );
      }),
    );
  }
}
