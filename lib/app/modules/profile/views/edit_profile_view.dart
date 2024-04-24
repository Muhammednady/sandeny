import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/selectImage/select_image.dart';
import '../../../../widgets/text_form_fields.dart';
import '../../../controller/language_controller.dart';
import '../controllers/edit_profile_controller.dart';
import '../controllers/profile_controller.dart';

class EditProfileView extends GetView {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EditProfileController());
    var profileController = ProfileController.instance;
    var isEnglish = LanguageController.instance.getLocale == 'en';
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsManager.fontColor,
            size: 25,
          ),
        ),
        backgroundColor: ColorsManager.whiteColor,
        elevation: 0,
        title: Text(
          'edit_profile'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s16,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: profileController.profileList.length,
        itemBuilder: (context, index) {
          return Form(
            key: controller.formKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Stack(
                  children: [
                    Obx(
                      () => controller.imagePath.value == ''
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                profileController
                                    .profileList[index].data.profileImage,
                              ),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: Image.file(
                                controller.image,
                              ).image,
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectImage(context);
                      },
                      child: Padding(
                        padding: LanguageController.instance.getLocale == 'ar'
                            ? const EdgeInsets.only(
                                top: AppPadding.p65, left: AppPadding.p50)
                            : const EdgeInsets.only(
                                top: AppPadding.p65, right: AppPadding.p50),
                        child: SvgPicture.asset(
                          "assets/images/camera-Filled.svg",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p65)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'first_name'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: isEnglish
                      ? const EdgeInsets.only(left: AppPadding.p40)
                      : const EdgeInsets.only(right: AppPadding.p8),
                  child: Row(
                    children: [
                      editFirstNameFormField(
                          context,
                          controller,
                          ColorsManager.greyColor,
                          profileController.profileList[index].data.firstName,
                          ColorsManager.fontColor),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: isEnglish
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p65)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'last_name'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: isEnglish
                      ? const EdgeInsets.only(left: AppPadding.p40)
                      : const EdgeInsets.only(right: AppPadding.p8),
                  child: Row(
                    children: [
                      editLastNameFormField(
                          context,
                          controller,
                          ColorsManager.greyColor,
                          profileController.profileList[index].data.lastName,
                          ColorsManager.fontColor),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: LanguageController.instance.getLocale == 'en'
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p65)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'phone_number'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                editPhoneNumberFormField(
                    context,
                    controller,
                    ColorsManager.greyColor,
                    profileController.profileList[index].data.phone,
                    ColorsManager.fontColor),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: LanguageController.instance.getLocale == 'en'
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p65)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'birth_date'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                // Birth date widget
                editBirthDateWidget(
                  context,
                  controller,
                  ColorsManager.greyColor,
                  profileController.profileList[index].data.dOB,
                  ColorsManager.fontColor,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: LanguageController.instance.getLocale == 'en'
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p65)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'identity_number'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // identity number text field widget
                editIdentityFormField(
                    context,
                    controller,
                    ColorsManager.greyColor,
                    profileController.profileList[index].data.iqamaNumber,
                    ColorsManager.fontColor),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: LanguageController.instance.getLocale == 'en'
                          ? const EdgeInsets.only(
                          top: AppPadding.p20, left: AppPadding.p65)
                          : const EdgeInsets.only(
                          top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'email'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),

                editEmailWidget(
                  context,
                  controller,
                  ColorsManager.greyColor,
                  profileController.profileList[index].data.email,
                  ColorsManager.fontColor,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: LanguageController.instance.getLocale == 'en'
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p65)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'social_status'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                // Social status drop down widget
                selectSocialStatus(
                    context,
                    controller,
                    ColorsManager.lightGreyColor,
                    profileController.profileList[index].data.maritalStatus),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: LanguageController.instance.getLocale == 'en'
                          ? const EdgeInsets.only(
                              top: AppPadding.p20, left: AppPadding.p65)
                          : const EdgeInsets.only(
                              top: AppPadding.p20, right: AppPadding.p40),
                      child: Text(
                        'sex'.tr,
                        style: getRegularStyle(
                          color: ColorsManager.mainColor,
                          fontSize: FontSizeManager.s14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                // Types of sex male or female
                selectGender(context, controller),
                const SizedBox(
                  height: 30,
                ),

                // Button to save the change
                ButtonsManager.secondaryButton(
                  text: 'save_changes'.tr,
                  minimumSize: const Size(315, 50),
                  maximumSize: const Size(315, 50),
                  onPressed: () {
                    controller.checkUpdateProfile();
                  },
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
