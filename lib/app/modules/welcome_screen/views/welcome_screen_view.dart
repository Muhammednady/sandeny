import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/buttons_manager.dart';
import 'package:sandeny/constants/images_manager.dart';

import '../../../routes/app_pages.dart';
import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            Center(
              child: Image.asset(
                Images.logo,
                height: 250,
                width: 250,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'join'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'best'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'year'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'get_your_consultation'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(
              height: Get.height / 4,
            ),
            ButtonsManager.primaryButton(
              text: 'login'.tr,
              onPressed: () {
                Get.toNamed(Routes.AUTH, arguments: 0);
              },
              context: context,
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonsManager.secondaryButton(
              text: 'register'.tr,
              onPressed: () {
                Get.toNamed(Routes.AUTH, arguments: 1);
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
