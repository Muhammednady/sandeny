import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/images_manager.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/best_doctors_widgets/doctor_details.dart';
import '../../../../widgets/search_widgets/doctor_filter_widget.dart';
import '../../../../widgets/search_widgets/search_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/personal_clinc_controller.dart';

class SanednyClincView extends GetView<PersonalClincController> {
  const SanednyClincView({Key? key}) : super(key: key);
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
          'personal_Medicine'.tr,
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
                : const EdgeInsets.only(right: AppPadding.p40),
            child: searchWidget(context),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: 315,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: controller.doctorList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 315,
                    height: 179,
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
                                  padding: Get.locale!.languageCode == 'ar'
                                      ? const EdgeInsets.only(
                                          right: AppPadding.p20,
                                          top: AppPadding.p20,
                                        )
                                      : const EdgeInsets.only(
                                          left: AppPadding.p20,
                                          top: AppPadding.p20,
                                        ),
                                  child: GestureDetector(
                                    onTap: () {
                                      doctorDetailsWidget(context, controller);
                                    },
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: ColorsManager.greyColor,
                                      child: Image.asset(
                                        Images.manDoctor,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 10,
                                      ),
                                      child: Text(
                                        controller.doctorList[index],
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
                                      child: Text(
                                        controller.doctorSpeciality[index],
                                        style: getRegularStyle(
                                          color: Colors.grey,
                                          fontSize: FontSizeManager.s10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(children: [
                                SvgPicture.asset(
                                  Images.starIcon,
                                  color: ColorsManager.yelowColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.doctorRate[index],
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
                                  controller.doctorDescription[index],
                                  style: getRegularStyle(
                                    color: Colors.grey,
                                    fontSize: FontSizeManager.s10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GestureDetector(
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
                          height: 10,
                        ),
                        ButtonsManager.primaryButton(
                          text: 'appointment_booking'.tr,
                          onPressed: () {
                            Get.toNamed(Routes.APPOINTMENT_BOOKING);
                          },
                          context: context,
                          maximumSize: const Size(287, 40),
                          minimumSize: const Size(287, 40),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
