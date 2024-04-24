import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../controllers/stcPay_payment_controller.dart';

class StcPayPaymentView extends GetView<StcPayPaymentController> {
  const StcPayPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    final String appointmentId = Get.arguments as String;
    controller.initWebView(appointmentId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.mainColor,
        elevation: 0,
        leading: Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: AppPadding.p30)
              : const EdgeInsets.only(left: AppPadding.p30),
          child: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsManager.whiteColor,
            ),
          ),
        ),
        title: Text(
          'stcpay_payment'.tr,
          style: getMediumStyle(
            color: ColorsManager.whiteColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: controller.webViewController,
      ),
    );
  }
}
