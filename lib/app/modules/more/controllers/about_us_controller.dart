import 'package:get/get.dart';
import 'package:sandeny/constants/httpHelper.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../network/controllers/network_controller.dart';

class AboutUsController extends GetxController {
  static AboutUsController get instance => Get.put(AboutUsController());

  RxBool isLoading = false.obs;

  var networkController = NetworkController.instance;

  late final WebViewController webViewController;

  void initWebView() async {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('${HttpHelper.mainUrl}/about'));
  }

  @override
  void onInit() {
    super.onInit();
    initWebView();
  }
}
