import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/chat/controllers/chat_controller.dart';
import 'package:sandeny/constants/images_manager.dart';

import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';

deleteChat(BuildContext context, String patientId) {
  var isArabic = Get.locale!.languageCode == 'ar';
  final deleteChatController = ChatController();
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        width: Get.width,
        height: Get.height * 0.4,
        decoration: const BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Container(
                width: 44,
                height: 6,
                decoration: const BoxDecoration(
                  color: ColorsManager.lightGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SvgPicture.asset(
                Images.trash2Icon,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'delete_chat'.tr,
              style: getMediumStyle(
                color: ColorsManager.errorColor,
                fontSize: FontSizeManager.s16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(right: 30)
                  : const EdgeInsets.only(
                      left: 30,
                    ),
              child: Text(
                'delete_chat_messages'.tr,
                style: getRegularStyle(
                  color: ColorsManager.fontColor,
                  fontSize: FontSizeManager.s14,
                  height: 2,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: Get.locale!.languageCode == 'ar'
                    ? const EdgeInsets.only(
                        right: 60,
                      )
                    : const EdgeInsets.only(
                        left: 60,
                      ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: Get.locale!.languageCode == 'ar'
                              ? const EdgeInsets.only(
                                  right: 10,
                                )
                              : const EdgeInsets.only(
                                  left: 50,
                                ),
                          child: Center(
                            child: Text(
                              'cancel'.tr,
                              style: getRegularStyle(
                                color: ColorsManager.whiteColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteChatController.deleteChatMessages(patientId);
                      },
                      child: Container(
                        height: 50,
                        width: Get.locale!.languageCode == 'ar' ? 124 : 155,
                        decoration: BoxDecoration(
                          color: ColorsManager.whiteColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: ColorsManager.defaultGreyColor,
                          ),
                        ),
                        child: Padding(
                          padding: Get.locale!.languageCode == 'ar'
                              ? const EdgeInsets.only(
                                  right: 20,
                                )
                              : const EdgeInsets.only(
                                  left: 30,
                                ),
                          child: Row(
                            children: [
                              Text(
                                'delete_chat'.tr,
                                style: getMediumStyle(
                                  color: ColorsManager.defaultGreyColor,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}