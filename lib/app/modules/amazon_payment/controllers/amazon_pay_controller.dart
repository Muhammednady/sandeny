import 'dart:collection';
import 'dart:developer';
import 'package:flutter/services.dart';
// import 'package:flutter_amazonpaymentservices/environment_type.dart';
// import 'package:flutter_amazonpaymentservices/flutter_amazonpaymentservices.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:amazon_payfort/amazon_payfort.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:sandeny/app/modules/amazon_payment/models/sdk_token_response.dart';
import 'package:sandeny/app/modules/amazon_payment/providers/pay_appointment_provider.dart';
import 'package:sandeny/app/modules/amazon_payment/views/utils.dart';

import '../../../../constants/amazon_payment_configurations.dart';
import '../../../../constants/dialogs.dart';
import '../../../routes/app_pages.dart';
import '../providers/amazon_pay_api.dart';

class AmazonPayController extends GetxController {
  final AmazonPayfort _payfort = AmazonPayfort.instance;
  final NetworkInfo _info = NetworkInfo();

  RxBool isLoading = false.obs;

  SdkTokenResponse sdkTokenResponse = SdkTokenResponse();

  @override
  void onInit() {
    super.onInit();
    _initPayfort();
  }

  void _initPayfort() async {
    await AmazonPayfort.initialize(
      const PayFortOptions(environment: AmazonPayConfigue.testEnviroment),
      // const PayFortOptions(environment: AmazonPayConfigue.productionEnviroment),
    );
  }

  // Production Payment With Credit Or Debit Card
  Future<void> paymentWithCreditOrDebitCard({
    required SucceededCallback onSucceeded,
    required FailedCallback onFailed,
    required CancelledCallback onCancelled,
    required String doctorName,
    required String customerName,
    required String customerEmail,
    required String phoneNumber,
    required int amount,
    required String merchantReference,
    required String sessionType,
  }) async {
    try {
      EasyLoading.show(status: 'loading'.tr);

      var sdkTokenResponse =
          await generateSandboxSdkToken(appointmentId: merchantReference);

      FortRequest request = FortRequest(
        amount: amount * 100,
        customerName: customerName,
        customerEmail: customerEmail,
        orderDescription: '${'session'.tr} $sessionType ${'with_doctor'.tr}',
        sdkToken: sdkTokenResponse?.sdkToken ?? '',
        merchantReference: merchantReference,
        currency: 'SAR',
        customerIp: (await _info.getWifiIP() ?? ''),
        phoneNumber: phoneNumber,
        eci: 'ECOMMERCE',
        language: Get.locale?.languageCode ?? 'en',
      );

      EasyLoading.dismiss();

      _payfort.callPayFort(
        request: request,
        callBack: PayFortResultCallback(
          onSucceeded: onSucceeded,
          onFailed: onFailed,
          onCancelled: onCancelled,
        ),
      );
    } catch (e) {
      EasyLoading.dismiss();
      onFailed(e.toString());
    }
  }

  Future<void> paymentWithApplePay({
    required SucceededCallback onSucceeded,
    required FailedCallback onFailed,
    required String doctorName,
    required String customerName,
    required String customerEmail,
    required String phoneNumber,
    required int amount,
    required String merchantReference,
    required String sessionType,
  }) async {
    try {
      EasyLoading.show(status: 'loading'.tr);
      var sdkToken = await generateProductionSdkToken(
          isApplePay: true, appointmentId: merchantReference);

      FortRequest request = FortRequest(
        amount: amount,
        customerName: customerName,
        customerEmail: customerEmail,
        orderDescription: 'Sanedny',
        sdkToken: sdkToken?.sdkToken ?? '',
        merchantReference: merchantReference,
        currency: 'SAR',
        customerIp: (await _info.getWifiIP() ?? ''),
        eci: 'ECOMMERCE',
        language: Get.locale?.languageCode ?? 'en',
      );

      _payfort.callPayFortForApplePay(
        request: request,
        countryIsoCode: 'SA',
        applePayMerchantId: AmazonPayConfigue.applePayMerchantId,
        callback: ApplePayResultCallback(
          onSucceeded: onSucceeded,
          onFailed: onFailed,
        ),
      );

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      onFailed(e.toString());
    }
  }

  // Create Sdk Token for Sandbox Environment
  Future<SdkTokenResponse?> generateSandboxSdkToken(
      {bool isApplePay = false, String? appointmentId}) async {
    try {
      isLoading.value;

      var accessCode = isApplePay
          ? AmazonPayConfigue.applePayAccessCode
          : AmazonPayConfigue.accessCode;

      var shaRequestPhrase = isApplePay
          ? AmazonPayConfigue.applePayShaRequestPhrase
          : AmazonPayConfigue.shaRequestPhrase;

      String? deviceId = await _payfort.getDeviceId();

      /// Step 2:  Generate the Signature
      SdkTokenRequest tokenRequest = SdkTokenRequest(
        accessCode: accessCode,
        deviceId: deviceId ?? '',
        merchantIdentifier: AmazonPayConfigue.merchantIdentifier,
      );

      String? signature = await _payfort.generateSignature(
        shaType: AmazonPayConfigue.shaType,
        concatenatedString: tokenRequest.toConcatenatedString(shaRequestPhrase),
      );

      tokenRequest = tokenRequest.copyWith(signature: signature);

      /// Step 3: Generate the SDK Token
      return await AmazonPayApi.generateSdkToken(
        // deviceId: deviceId,
        // accessCode: accessCode,
        // lang: 'en',
        // signature: signature,
        // merchantId: AmazonPayConfigue.merchantIdentifier,
        // urlType: 0,
        tokenRequest,
      );
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  // Create Sdk Token for Production Environment
  Future<SdkTokenResponse?> generateProductionSdkToken(
      {bool isApplePay = false, String? appointmentId}) async {
    try {
      isLoading.value;

      var accessCode = isApplePay
          ? AmazonPayConfigue.applePayAccessCodeProduction
          : AmazonPayConfigue.accessCodeProduction;

      var shaRequestPhrase = isApplePay
          ? AmazonPayConfigue.applePayShaRequestPhraseProduction
          : AmazonPayConfigue.shaRequestPhraseProduction;

      String? deviceId = await _payfort.getDeviceId();

      /// Step 2:  Generate the Signature
      SdkTokenRequest tokenRequest = SdkTokenRequest(
        accessCode: accessCode,
        deviceId: deviceId ?? '',
        merchantIdentifier: AmazonPayConfigue.merchantIdentifierProduction,
      );

      String? signature = await _payfort.generateSignature(
        shaType: AmazonPayConfigue.shaType,
        concatenatedString: tokenRequest.toConcatenatedString(shaRequestPhrase),
      );

      tokenRequest = tokenRequest.copyWith(signature: signature);

      log('this is the signature: $signature');

      /// Step 3: Generate the SDK Token
      return await AmazonPayApi.generateSdkToken(
        // deviceId: deviceId,
        // accessCode: accessCode,
        // lang: 'en',
        // signature: signature,
        // merchantId: AmazonPayConfigue.merchantIdentifierProduction,
        // urlType: 1,
        tokenRequest,
      );
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }
}
