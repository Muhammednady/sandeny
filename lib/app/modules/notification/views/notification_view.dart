import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.arguments;
    final isArabic = Get.locale!.languageCode == 'ar';
    return Scaffold(
        backgroundColor: ColorsManager.greyColor,
        appBar: AppBar(
          backgroundColor: ColorsManager.greyColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsManager.blackColor,
            ),
          ),
          title: Text(
            'notifications'.tr,
            style: getMediumStyle(
              color: ColorsManager.mainColor,
              fontSize: FontSizeManager.s16,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoading.value == false) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.getNotificationData.length,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.p20,
                    left: AppPadding.p20,
                    right: AppPadding.p20,
                  ),
                  child: Container(
                    width: 315,
                    decoration: BoxDecoration(
                      color: ColorsManager.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  isArabic
                                      ? controller
                                          .getNotificationData[index].title!.ar!
                                      : controller.getNotificationData[index]
                                          .title!.en!,
                                  style: getMediumStyle(
                                    color: ColorsManager.mainColor,
                                    fontSize: FontSizeManager.s14,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppPadding.p20,
                                right: AppPadding.p20,
                              ),
                              child: Text(
                                controller.getNotificationData[index].createdAt!
                                    .split('.')[0]
                                    .toString(),
                                style: getMediumStyle(
                                  color: ColorsManager.fontColor,
                                  fontSize: FontSizeManager.s10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppPadding.p20,
                            right: AppPadding.p20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  isArabic
                                      ? controller.getNotificationData[index]
                                          .description!.ar!
                                      : controller.getNotificationData[index]
                                          .description!.en!,
                                  style: getRegularStyle(
                                    color: ColorsManager.fontColor,
                                    fontSize: FontSizeManager.s12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }
        }));
  }
}
