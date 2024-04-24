import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/profile/controllers/profile_controller.dart';
import '../../constants/colors_manager.dart';

Widget profileHeaderWidget(BuildContext context) {
  var controller = ProfileController.instance;
  return GetBuilder(
    init: controller,
    builder: (controller) => Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ],
    ),
  );
}
