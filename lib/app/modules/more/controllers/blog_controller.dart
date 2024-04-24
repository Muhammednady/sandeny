import 'package:get/get.dart';
import 'package:sandeny/constants/httpHelper.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../network/controllers/network_controller.dart';

class BlogsController extends GetxController {
  static BlogsController get instance => Get.put(BlogsController());

  var networkController = NetworkController.instance;

  RxBool isLoading = false.obs;

  late final WebViewController webViewController;

  void initWebView() async {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('${HttpHelper.mainUrl}/articles'),
      );
  }

  @override
  void onInit() {
    super.onInit();
    initWebView();
  }
}
