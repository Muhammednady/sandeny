import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../../../routes/app_pages.dart';
import '../models/get_tabby_model.dart';
import '../providers/pay_with_tabby_provider.dart';

class StcPayPaymentController extends GetxController {
  final NetworkInfo _info = NetworkInfo();

  static StcPayPaymentController get instance =>
      Get.put(StcPayPaymentController());

  RxBool isLoading = false.obs;

  RxString tabbySignature = ''.obs;

  PayWithTabbyModel payWithTabbyModel = PayWithTabbyModel();

  set setPayWithTabbyData(PayWithTabbyModel data) {
    payWithTabbyModel = data;
    update();
  }

  PayWithTabbyModel get getPayWithTabbyData => payWithTabbyModel;

  final payWithTabbyProvider = PayWithTabbyProvider();

  late final WebViewController webViewController;

  Future<void> paymentWithStcPay(String appointmentId) async {
    var generatedSignature = await payWithTabbyProvider.payWithTabby(
      appointmentId: appointmentId,
      type: 'STCPAY',
      urlType: '0',
    );
    setPayWithTabbyData = generatedSignature;
  }

  void initWebView(String appointmentId) async {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    await paymentWithStcPay(appointmentId);
    _loadUrl();
  }

  void _loadUrl() {
    _postFormData();
  }

  void _postFormData() async {
    String formData = getPayWithTabbyData.data!;
    await webViewController.loadHtmlString(
      formData,
    );

    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          EasyLoading.show(status: 'loading'.tr);
          if (progress == 100) {
            EasyLoading.dismiss();
          }
        },
        onPageFinished: (url) {
          EasyLoading.dismiss();
          if (url.contains('success')) {
            Future.delayed(
              const Duration(seconds: 4),
              () {
                Get.offAllNamed(Routes.HOME);
              },
            );
            Dialogs.successDialog(Get.context!, 'booking_success_des'.tr);
          }

          if (url.contains('confirm')) {
            Future.delayed(
              const Duration(seconds: 4),
              () {
                Get.offAllNamed(Routes.HOME);
              },
            );
            Dialogs.successDialog(Get.context!, 'booking_success_des'.tr);
          }

          if (url.contains('reject')) {
            Future.delayed(
              const Duration(seconds: 4),
              () {
                Get.back();
                Dialogs.errorDialog(
                    Get.context!, 'error_try_other_payment_method'.tr);
              },
            );
          }
        },
        onWebResourceError: (error) {
          EasyLoading.dismiss();
          log('this is the error: $error');
        },
      ),
    );
  }
}
