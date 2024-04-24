import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/more_screen_widgets/account_settings.dart';
import '../../../../widgets/more_screen_widgets/add_new_ticket.dart';
import '../../../../widgets/more_screen_widgets/changeLanguage.dart';
import '../../../routes/app_pages.dart';
import '../controllers/about_us_controller.dart';
import '../controllers/blog_controller.dart';
import '../controllers/more_controller.dart';
import 'package:in_app_review/in_app_review.dart';

import '../controllers/terms_and_conditions_controller.dart';
import 'about_us_view.dart';
import 'blogs_views.dart';
import 'terms_and_conditions_view.dart';

class MoreView extends GetView<MoreController> {
  const MoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var controller = MoreController.instance;
    var isArabic = Get.locale!.languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        elevation: 0,
        title: Text(
          'more'.tr,
          style: getMediumStyle(
            color: ColorsManager.whiteColor,
            fontSize: FontSizeManager.s16,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        backgroundColor: ColorsManager.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _sanednyLicense(isArabic),
              _moreScreenBody(context, isArabic),
            ],
          ),
        ),
      ),
    );
  }

  _sanednyLicense(isArabic) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(
                    right: 10,
                  )
                : const EdgeInsets.only(
                    left: 10,
                  ),
            child: Row(
              children: [
                Text(
                  "sanedny_license".tr,
                  style: getRegularStyle(
                    color: ColorsManager.whiteColor,
                    fontSize: FontSizeManager.s14,
                    height: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _moreScreenBody(BuildContext context, isArabic) {
    return Padding(
      padding: isArabic
          ? const EdgeInsets.only(
              top: AppPadding.p30,
              left: AppPadding.p20,
              right: AppPadding.p20,
            )
          : const EdgeInsets.only(
              top: AppPadding.p30,
              left: AppPadding.p20,
              right: AppPadding.p20,
            ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Change language field
              _changeLanguage(context, isArabic),
              _divider(isArabic),

              // Account Settings field
              _accountSetting(context, isArabic),
              _divider(isArabic),

              // Favorite Doctors field
              _favoriteDoctors(context, isArabic),
              _divider(isArabic),

              // Contact Support field
              _contactSupport(context, isArabic),
              _divider(isArabic),

              // Terms and Privacy field
              _termsAndPrivacy(context, isArabic),
              _divider(isArabic),

              // Blog field
              _blog(context, isArabic),
              _divider(isArabic),

              // Rate App field
              _rateApp(context, isArabic),
              _divider(isArabic),

              // About Us field
              _aboutSanedny(context, isArabic),
              _divider(isArabic),

              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  _accountSetting(BuildContext context, isArabic) {
    return GestureDetector(
      onTap: () {
        accountSettings(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 10, right: 20)
                : const EdgeInsets.only(top: 10, left: 15),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.settingIcon,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'account_settings'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20)
                : const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 5, left: 30)
                      : const EdgeInsets.only(top: 5, right: 30),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: ColorsManager.primaryColor,
                    size: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _changeLanguage(BuildContext context, isArabic) {
    return GestureDetector(
      onTap: () {
        changeLanguage(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 10, right: 20)
                : const EdgeInsets.only(top: 10, left: 15),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.languageIcon,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'language'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20)
                : const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 5, left: 30)
                      : const EdgeInsets.only(top: 5, right: 30),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: ColorsManager.primaryColor,
                    size: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _favoriteDoctors(BuildContext context, isArabic) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FAVORITE_DOCTOR);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 10, right: 20)
                : const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.heartIcon,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'favorite_doctors'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20)
                : const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 5, left: 30)
                      : const EdgeInsets.only(top: 5, right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.FAVORITE_DOCTOR);
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorsManager.primaryColor,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _contactSupport(BuildContext context, isArabic) {
    return GestureDetector(
      onTap: () {
        addNewTicketWidget(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 10, right: 15)
                : const EdgeInsets.only(top: 10, left: 15),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.callcenterIcon,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'connect_with_support'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20)
                : const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 5, left: 30)
                      : const EdgeInsets.only(top: 5, right: 30),
                  child: GestureDetector(
                    onTap: () {
                      addNewTicketWidget(context);
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorsManager.primaryColor,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _termsAndPrivacy(BuildContext context, isArabic) {
    return GestureDetector(
      onTap: () {
        TermsAndConditionsController.instance;
        Get.to(const TermsAndConditionsView());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 10, right: 20)
                : const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.fileIcon,
                  color: ColorsManager.primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'conditions_and_terms'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20)
                : const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 5, left: 30)
                      : const EdgeInsets.only(top: 5, right: 30),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorsManager.primaryColor,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _blog(BuildContext context, isArabic) {
    return GestureDetector(
      onTap: () {
        Get.put(BlogsController());
        Get.to(const BlogViews());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 10, right: 20)
                : const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.fileIcon,
                  color: ColorsManager.primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'blog'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20)
                : const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 5, left: 30)
                      : const EdgeInsets.only(top: 5, right: 30),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorsManager.primaryColor,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _aboutSanedny(BuildContext context, isArabic) {
    return GestureDetector(
      onTap: () {
        Get.put(AboutUsController());
        Get.to(const AboutUsView());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 10, right: 20)
                : const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.fileIcon,
                  color: ColorsManager.primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'about_sanedny'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20)
                : const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 5, left: 30)
                      : const EdgeInsets.only(top: 5, right: 30),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorsManager.primaryColor,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _rateApp(BuildContext context, isArabic) {
    return GestureDetector(
      onTap: () async {
        final InAppReview inAppReview = InAppReview.instance;

        if (GetPlatform.isIOS) {
          inAppReview.openStoreListing(
            appStoreId: '6464280865',
          );
        } else if (GetPlatform.isAndroid) {
          inAppReview.openStoreListing(
            appStoreId: 'com.sanedny.app',
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 10, right: 20)
                : const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.starIcon,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'rate_app'.tr,
                  style: getRegularStyle(
                    color: ColorsManager.fontColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 20)
                : const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: isArabic
                      ? const EdgeInsets.only(top: 5, left: 30)
                      : const EdgeInsets.only(top: 5, right: 30),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorsManager.primaryColor,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // _loginOrRegister(BuildContext context, isArabic) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Padding(
  //         padding: isArabic
  //             ? const EdgeInsets.only(top: 10, right: 20)
  //             : const EdgeInsets.only(top: 10, left: 20),
  //         child: GestureDetector(
  //           onTap: () {
  //             Get.offAllNamed(Routes.AUTH, arguments: 0);
  //           },
  //           child: Row(
  //             children: [
  //               Image.asset(
  //                 Images.login,
  //                 width: 20,
  //                 height: 20,
  //                 color: ColorsManager.primaryColor,
  //               ),
  //               const SizedBox(
  //                 width: 15,
  //               ),
  //               Text(
  //                 "login/register".tr,
  //                 style: getRegularStyle(
  //                   color: ColorsManager.fontColor,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: isArabic
  //             ? const EdgeInsets.only(top: 20)
  //             : const EdgeInsets.only(top: 20),
  //         child: Row(
  //           children: [
  //             Padding(
  //               padding: isArabic
  //                   ? const EdgeInsets.only(top: 5, left: 30)
  //                   : const EdgeInsets.only(top: 5, right: 30),
  //               child: GestureDetector(
  //                 onTap: () {
  //                   Get.offAllNamed(Routes.AUTH, arguments: 0);
  //                 },
  //                 child: const Icon(
  //                   Icons.arrow_forward_ios,
  //                   color: ColorsManager.primaryColor,
  //                   size: 10,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  _divider(isArabic) {
    return Padding(
      padding: isArabic
          ? const EdgeInsets.only(top: 5, left: 20, right: 20)
          : const EdgeInsets.only(top: 5, left: 20, right: 20),
      child: const Divider(
        color: ColorsManager.primaryColor,
        thickness: 0.1,
      ),
    );
  }
}
