import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../constants/httpHelper.dart';
import '../../network/controllers/network_controller.dart';

class TermsAndConditionsController extends GetxController {
  static TermsAndConditionsController get instance =>
      Get.put(TermsAndConditionsController());

  var networkController = NetworkController.instance;

  RxBool isLoading = false.obs;

  late final WebViewController webViewController;

  void initWebView() async {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('${HttpHelper.baseUrl}/termsAndCondition/register'),
      );
  }

  @override
  void onInit() {
    super.onInit();
    initWebView();
  }
}
