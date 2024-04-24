import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/Auth/controllers/splash_screen_controller.dart';
import 'package:sandeny/constants/images_manager.dart';

class SplashScreenView extends GetView<SplachScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplachScreenController());
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.logo,
          height: Get.height / 2,
          width: Get.width / 2,
        ),
      ),
    );
  }
}
