import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:sandeny/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../constants/dialogs.dart';
import '../models/get_tabby_model.dart';
import '../providers/pay_with_tabby_provider.dart';

class TabbyPaymentController extends GetxController {
  final NetworkInfo _info = NetworkInfo();

  static TabbyPaymentController get instance =>
      Get.put(TabbyPaymentController());

  RxBool isLoading = false.obs;

  RxString tabbySignature = ''.obs;

  PayWithTabbyModel getTabbyData = PayWithTabbyModel();

  set setTabbyData(PayWithTabbyModel data) {
    getTabbyData = data;
    update();
  }

  PayWithTabbyModel get getSignatureData => getTabbyData;

  final payWithTabbyProvider = PayWithTabbyProvider();

  late final WebViewController webViewController;

  Future<void> paymentWithTabby(String appointmentId) async {
    log('this is the appointmentId in tabby: $appointmentId');
    var generatedSignature = await payWithTabbyProvider.payWithTabby(
        appointmentId: appointmentId, type: 'TABBY', urlType: '0');
    setTabbyData = generatedSignature;
  }

  void initWebView(String appointmentId) async {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    await paymentWithTabby(appointmentId);

    _loadUrl();
  }

  void _loadUrl() {
    _postFormData();
  }

  void _postFormData() async {
    String formData = getSignatureData.data!;
    await webViewController.loadHtmlString(
      formData,
    );

    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          EasyLoading.show(status: 'loading'.tr);
          log('this is the progress: $progress');
          if (progress == 100) {
            EasyLoading.dismiss();
          }
        },
        onPageFinished: (url) {
          EasyLoading.dismiss();
          log('this is the url: $url');

          if (url.contains('success')) {
            Future.delayed(
              const Duration(seconds: 3),
              () {
                Get.offAllNamed(Routes.HOME);
              },
            );
            Dialogs.successDialog(Get.context!, 'booking_success_des'.tr);
          }

          if (url.contains('confirm')) {
            Future.delayed(
              const Duration(seconds: 3),
              () {
                Get.offAllNamed(Routes.HOME);
              },
            );
            Dialogs.successDialog(Get.context!, 'booking_success_des'.tr);
          }

          if (url.contains('reject')) {
            Future.delayed(
              const Duration(seconds: 3),
              () {
                Get.back();
                Dialogs.errorDialog(
                    Get.context!, 'error_try_other_payment_method'.tr);
              },
            );
          }
          //  else {
          //   Future.delayed(
          //     const Duration(seconds: 3),
          //     () {
          //       Get.back();
          //       Dialogs.errorDialog(
          //           Get.context!, 'error_try_other_payment_method'.tr);
          //     },
          //   );
          // }
        },
        onWebResourceError: (error) {
          EasyLoading.dismiss();
          log('this is the error: $error');
        },
      ),
    );
  }
}
