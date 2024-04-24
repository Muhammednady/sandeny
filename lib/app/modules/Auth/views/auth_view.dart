import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/Auth/views/login_view.dart';
import 'package:sandeny/app/modules/Auth/views/register_view.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/values_manager.dart';

import '../../../../constants/images_manager.dart';
import '../../../../widgets/Auth_screen_widgets/choose_login_or_register.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    int? number = Get.arguments;
    if (number == 0) {
      controller.selectLoginOrRegister = false;
    } else {
      controller.selectLoginOrRegister = true;
    }
    return Scaffold(
      backgroundColor: ColorsManager.greyColor,
      body: Builder(builder: (context) {
        return GetBuilder(
          init: controller,
          builder: (controller) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p50, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.offNamed('/home');
                      },
                      child: Text(
                        'skip'.tr,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Center(
                  child: Image.asset(
                    Images.logo,
                    height: controller.selectLoginOrRegister ? 121 : 183,
                    width: controller.selectLoginOrRegister ? 188 : 237,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppPadding.p20),
                      topRight: Radius.circular(AppPadding.p20),
                    ),
                  ),
                  child: Column(
                    children: [
                      loginOrRegister(context),
                      SizedBox(
                        height: controller.selectLoginOrRegister ? 0 : 20,
                      ),
                      Expanded(
                        child: Column(children: [
                          Obx(
                            () => controller.selectLoginOrRegister == true
                                ? const RegisterView()
                                : const LoginView(),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
