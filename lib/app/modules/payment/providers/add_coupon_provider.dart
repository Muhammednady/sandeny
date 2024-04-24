import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/payment/controllers/payment_controller.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/httpHelper.dart';
import 'package:http/http.dart' as http;
import '../../network/controllers/network_controller.dart';
import '../models/add_copoun.dart';

class AddCouponProvider extends GetConnect {
  static AddCouponProvider get instance => Get.put(AddCouponProvider());

  final NetworkController networkController = NetworkController.instance;
  final GetStorage storage = GetStorage();
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

  Future<AddCoupon> addCoupon({
    required int doctorId,
    required int slotId,
    required String couponCode,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    const url = HttpHelper.baseUrl + HttpHelper.addCouponIC;
    final headers = {
      "authorization": "Bearer ${storage.read('token')}",
    };

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);

    request.fields['doctor_id'] = doctorId.toString();
    request.fields['slot_id'] = slotId.toString();
    request.fields['coupon_code'] = couponCode;

    final response = await request.send();
    final responseData = await response.stream.toBytes();
    final responseString = String.fromCharCodes(responseData);
    final data = json.decode(responseString);
    final statusCode = response.statusCode;
    log('this is the status code: $statusCode');
    log(data.toString());
    var paymentController = Get.put(PaymentController());

    if (data['code'] == 1) {
      EasyLoading.dismiss();
      Dialogs.successDialog(
        Get.context!,
        'coupon_applied_successfully'.tr,
      );
      paymentController.showDiscountWidget();
      return AddCoupon.fromJson(data);

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
    return AddCoupon.fromJson(data);
  }
}
