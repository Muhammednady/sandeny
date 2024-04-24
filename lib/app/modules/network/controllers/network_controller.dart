import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../../constants/dialogs.dart';
import '../views/network_view.dart';

class NetworkController extends GetxController {
  static NetworkController get instance => Get.put(NetworkController());

  var connectionStatus = 0.obs;

  RxBool isConnected = true.obs;

  static NetworkController get to => Get.find();

  final connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult>? subscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectionStatus(result);
    });
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await (connectivity.checkConnectivity());
    } on Exception catch (e) {
      log(e.toString());
    }
    return _updateConnectionStatus(result);
  }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   if (result == ConnectivityResult.wifi) {
  //     connectionStatus.value = 1;
  //     isConnected.value = true;
  //     log('Connected to WiFi');
  //   } else if (result == ConnectivityResult.mobile) {
  //     connectionStatus.value = 2;
  //     isConnected.value = true;
  //     log('Connected to Mobile');
  //   } else if (result == ConnectivityResult.none) {
  //     connectionStatus.value = 0;
  //     isConnected.value = false;
  //     Get.to(NetworkView());
  //   } else {
  //     isConnected.value = false;
  //   }
  // }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.wifi) {
      connectionStatus.value = 1;
      isConnected.value = true;
      log('Connected to WiFi');
    } else if (result == ConnectivityResult.mobile) {
      connectionStatus.value = 2;
      isConnected.value = true;
      log('Connected to Mobile');
    } else if (result == ConnectivityResult.none) {
      connectionStatus.value = 0;
      isConnected.value = false;
      if (Get.currentRoute != '/network') {
        Get.to(NetworkView());
      }
    } else {
      isConnected.value = false;
    }
  }

  Future<void> checkInternetConnectivity() async {
    try {
      final result = await connectivity.checkConnectivity();
      _updateConnectionStatus(result);

      if (result == ConnectivityResult.none) {
        Dialogs.connectionErrorDialog(Get.context!);
      }

      if (result == ConnectivityResult.mobile) {
        Get.back();
      }

      if (result == ConnectivityResult.wifi) {
        Get.back();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    subscription!.cancel();
  }
}
