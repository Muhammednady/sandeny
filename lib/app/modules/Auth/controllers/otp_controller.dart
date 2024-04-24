import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../network/controllers/network_controller.dart';
import '../providers/send_otp_provider.dart';
import '../providers/verfiy_otp_provider.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.put(OtpController());

  // form key
  final GlobalKey<FormState> otpCodeFormKey = GlobalKey<FormState>();
  var networkController = NetworkController.instance;

  RxString otp = ''.obs;
  // change otp value
  void changeOtp(String value) => otp.value = value;

  TextEditingController otpController = TextEditingController();

  // get the sing_up provider here
  final verifyOtpProvider = VerifyOtpProvider.instance;

  // storage insialisations
  final storage =  FlutterSecureStorage();
  // text field values
  String code = '';
  var sendOtpProvider = SendOtpProvider.instance;

  final RxBool isResendEnabled = true.obs;
  final RxInt secondsRemaining = 0.obs;
  Timer? _timer;

  void _startTimer() {
    secondsRemaining.value = 60; // 30 seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsRemaining.value--;
      isResendEnabled.value = false;
      if (secondsRemaining.value <= 0) {
        _timer?.cancel();
        isResendEnabled.value = true;
      }
    });
  }

  void resendOTP() async {
    // Logic for resending OTP goes here
    String phone = await storage.read(key: 'phone') ?? '';
    log('phone: $phone');
    sendOtpProvider.sendOtp(phone: phone);
    _startTimer();
  }

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
  }
}
