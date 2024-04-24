import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/widgets/search_widgets/search_widget.dart';

import '../../constants/values_manager.dart';
import 'favorite_doctor.dart';

Widget favoriteDoctorExist(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var storage = GetStorage();
  return Visibility(
    visible: storage.read('token') != null,
    child: Column(
      children: [
        searchWidget(context),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: isArabic
                ? const EdgeInsets.only(
                    right: AppPadding.p40,
                    left: AppPadding.p40,
                  )
                : const EdgeInsets.only(
                    left: AppPadding.p40, right: AppPadding.p40),
            child: SizedBox(
              height: Get.height,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemCount: controller.getDoctorsList.length,
                itemBuilder: (context, index) {
                  return favoriteDoctorWidget(context, index);
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
