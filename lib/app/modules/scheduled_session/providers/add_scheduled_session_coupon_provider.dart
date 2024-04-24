import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import 'package:http/http.dart' as http;
import '../../network/controllers/network_controller.dart';
import '../models/add_scheduled_session_coupon_model.dart';

class AddScheduledSessionCouponProvider extends GetConnect {
  static AddScheduledSessionCouponProvider get instance =>
      Get.put(AddScheduledSessionCouponProvider());

  final NetworkController networkController = NetworkController.instance;
  final GetStorage storage = GetStorage();
  // final bilateralSPController = Get.put(BilateralSessionPaymentController());
  Timer? timer;
  var isArabic = Get.locale!.languageCode == 'ar';

  @override
  void onInit() {
    httpClient.baseUrl = HttpHelper.baseUrl;
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
  }

  Future<AddScheduledSessionCoupon> addCoupon({
    required int appointmentId,
    required String couponCode,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      const url = HttpHelper.baseUrl + HttpHelper.addScheduledSessionCoupon;
      final headers = {
        "authorization": "Bearer ${storage.read('token')}",
      };

      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);

      request.fields['appointment_id'] = appointmentId.toString();
      request.fields['coupon_code'] = couponCode;

      final response = await request.send();
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final data = json.decode(responseString);
      final statusCode = response.statusCode;
      log('this is the status code: $statusCode');
      log(data.toString());

      if (data['code'] == 1) {
        EasyLoading.dismiss();
        Dialogs.successDialog(
          Get.context!,
          'coupon_applied_successfully'.tr,
        );
        // bilateralSPController.showDiscountWidget();
        return AddScheduledSessionCoupon.fromJson(data);
      } else if (data['code'] == 0) {
        EasyLoading.dismiss();
        var arabicMsg = data['msg']['ar'];
        var englishMsg = data['msg']['en'];
        if (isArabic) {
          Dialogs.errorDialog(Get.context!, arabicMsg.toString());
        } else {
          Dialogs.errorDialog(Get.context!, englishMsg.toString());
        }
      }
      return AddScheduledSessionCoupon.fromJson(data);
    } on TimeoutException catch (e) {
      Dialogs.errorDialog(Get.context!, 'timeout'.tr);
      log('Timeout Error: ${e.message}');
      return Future.error(e.toString());
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }
}
