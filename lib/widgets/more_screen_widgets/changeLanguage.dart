import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/controller/language_controller.dart';
import 'package:sandeny/app/modules/more/controllers/more_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

changeLanguage(BuildContext context) {
  var controller = Get.put(MoreController());
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
    builder: (BuildContext context) => Container(
      width: Get.width,
      height: 200,
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
          const SizedBox(
            height: 20,
          ),
          Text(
            'language'.tr,
            style: getMediumStyle(
              color: ColorsManager.primaryColor,
              fontSize: FontSizeManager.s16,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: Get.height,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Obx(() => ListTile(
                          title: Row(
                            children: [
                              Text(
                                LanguageController.instance.lang[index],
                                style: getRegularStyle(
                                  color: ColorsManager.fontColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          trailing: LanguageController.instance.getLocale
                                      .startsWith('ar') ==
                                  LanguageController.instance.lang[index]
                                      .startsWith('ar')
                              ? SvgPicture.asset(
                                  Images.selectIcon,
                                  width: 20,
                                  height: 20,
                                )
                              : const SizedBox(),
                          onTap: () {
                            LanguageController.instance.changeLocale(
                              LanguageController.instance.lang[index],
                            );
                            Get.back();
                          },
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                    child: Divider(
                      color: ColorsManager.primaryColor,
                      thickness: 0.1,
                    ),
                  );
                },
                itemCount: LanguageController.instance.lang.length,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
