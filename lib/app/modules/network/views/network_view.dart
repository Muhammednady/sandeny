import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sandeny/constants/fonts_manager.dart';

import '../controllers/network_controller.dart';

// ignore: must_be_immutable
class NetworkView extends GetView<NetworkController> {
  var networkController = NetworkController.instance;

  NetworkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'network_status'.tr,
          style: const TextStyle(
            fontSize: FontSizeManager.s18,
            fontFamily: FontsManager.fontFamily,
            fontWeight: FontWeightManager.medium,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: _getStatusColor(),
                child: Icon(
                  _getStatusIcon(),
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _getStatusText(),
                style: const TextStyle(
                  fontSize: FontSizeManager.s16,
                  fontFamily: FontsManager.fontFamily,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Retry checking internet connectivity
                  controller.checkInternetConnectivity();
                },
                child: Text(
                  'retry_connection'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSizeManager.s16,
                    fontFamily: FontsManager.fontFamily,
                    fontWeight: FontWeightManager.regular,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (networkController.connectionStatus.value) {
      case 1:
        return Colors.green; // Connected to WiFi (Green)
      case 2:
        return Colors.blue; // Connected to Mobile Data (Blue)
      default:
        return Colors.red; // No Internet Connection (Red)
    }
  }

  IconData _getStatusIcon() {
    switch (networkController.connectionStatus.value) {
      case 1:
        return Icons.wifi; // WiFi icon
      case 2:
        return Icons.mobile_friendly; // Mobile data icon
      default:
        return Icons.signal_wifi_off; // No internet icon
    }
  }

  String _getStatusText() {
    switch (networkController.connectionStatus.value) {
      case 1:
        return 'connected_to_wifi'.tr;
      case 2:
        return 'connected_mobile_data'.tr;
      default:
        return 'no_internet'.tr;
    }
  }
}
