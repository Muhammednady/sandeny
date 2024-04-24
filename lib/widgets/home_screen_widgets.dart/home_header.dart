import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import '../../constants/images_manager.dart';
import '../../constants/values_manager.dart';

Widget homeHeaderWidget(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var storage = GetStorage();
  return Expanded(
    flex: 0,
    child: Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p50,
        left: AppPadding.p10,
        right: AppPadding.p10,
      ),
      child: Directionality(
        textDirection: isArabic ? TextDirection.ltr : TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.NOTIFICATION);
                  },
                  icon: SvgPicture.asset(
                    Images.notificationIcon,
                    height: 30,
                    width: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SEARCH);
                  },
                  child: SvgPicture.asset(
                    Images.search2,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: AppPadding.p20, top: AppPadding.p20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: storage.read('token') != null
                            ? Text(
                                storage.read('fname') != ''
                                    ? "${'hello'.tr} "
                                        "${storage.read('fname')} ${storage.read('lname')}"
                                    : '',
                                style: Theme.of(context).textTheme.displayMedium,
                              )
                            : Text(
                                '${'hello'.tr} ${'guest'.tr}',
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PROFILE);
                      },
                      child: SvgPicture.asset(
                        Images.personalIcon,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
