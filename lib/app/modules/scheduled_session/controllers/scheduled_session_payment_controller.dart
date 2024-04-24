import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/add_scheduled_session_coupon_model.dart';
import '../models/get_scheduled_session_details_model.dart';
import '../providers/add_scheduled_session_coupon_provider.dart';
import 'booking_scheduled_session_controller.dart';

class ScheduledSessionPaymentController extends GetxController {
  GetScheduledSessionDetailsModel scheduledData =
      GetScheduledSessionDetailsModel();

  late TextEditingController cardHolderNameController,
      cardNumberController,
      expiryDateController,
      cvvController;

  set setSSD(GetScheduledSessionDetailsModel data) {
    scheduledData = data;
    update();
  }

  GetScheduledSessionDetailsModel get getSSD => scheduledData;

  final scheduledSC = Get.put(BookingScheduledSessionController());

  String couponCode = '';

  final GlobalKey<FormState> couponFormKey = GlobalKey<FormState>();

  AddScheduledSessionCoupon couponData = AddScheduledSessionCoupon();

  set setCoupon(AddScheduledSessionCoupon data) {
    couponData = data;
    update();
  }

  AddScheduledSessionCoupon get getCoupon => couponData;

  RxBool creditOrDebitCard = false.obs;
  void changeCreditOrDebitCard() {
    creditOrDebitCard.value = !creditOrDebitCard.value;
    applePayCard.value = false;
    madaCard.value = false;
    tabbyOption.value = false;
    stcPayOption.value = false;
    log('creditOrDebitCard value : ${creditOrDebitCard.value}');
    log('applePayCard value : ${applePayCard.value}');
    update();
  }

  // for apple pay card selected
  RxBool applePayCard = false.obs;
  void changeApplePayCard() {
    applePayCard.value = !applePayCard.value;
    creditOrDebitCard.value = false;
    madaCard.value = false;
    tabbyOption.value = false;
    stcPayOption.value = false;
    log('applePayCard value : ${applePayCard.value}');
    log('creditOrDebitCard value : ${creditOrDebitCard.value}');
    update();
  }

  // for mada card selected
  RxBool madaCard = false.obs;
  void changeMadaCard() {
    madaCard.value = !madaCard.value;
    creditOrDebitCard.value = false;
    applePayCard.value = false;
    tabbyOption.value = false;
    stcPayOption.value = false;
    log('creditOrDebitCard value : ${creditOrDebitCard.value}');
    log('applePayCard value : ${applePayCard.value}');
    update();
  }

  // for tabby option selected
  RxBool tabbyOption = false.obs;
  void changeTabbyOption() {
    log('###############');
    tabbyOption.value = !tabbyOption.value;
    applePayCard.value = false;
    madaCard.value = false;
    creditOrDebitCard.value = false;
    stcPayOption.value = false;
    update();
  }

    // for STCPAY option selected
  RxBool stcPayOption = false.obs;
  void changeStcPayOption() {
    stcPayOption.value = !stcPayOption.value;
    applePayCard.value = false;
    madaCard.value = false;
    creditOrDebitCard.value = false;
    tabbyOption.value = false;
    update();
  }

  RxBool firstCard = true.obs;
  void changeCard1() {
    firstCard.value = !firstCard.value;
    update();
  }

  // for second card selected
  RxBool secondCard = true.obs;
  void changeCard2() {
    secondCard.value = !secondCard.value;
    update();
  }

  // for third card selected
  RxBool thirdCard = true.obs;
  void changeCard3() {
    thirdCard.value = !thirdCard.value;
    update();
  }

  RxBool showDiscount = false.obs;
  void showDiscountWidget() {
    showDiscount.value = !showDiscount.value;
    log(showDiscount.value.toString());
    update();
  }

  RxBool showCouponWidgetValue = false.obs;
  void showCouponWidgetFun() {
    showCouponWidgetValue.value = !showCouponWidgetValue.value;
    update();
  }

  var couponProvider = AddScheduledSessionCouponProvider();

  applyCoupon() async {
    try {
      var data = await couponProvider.addCoupon(
        couponCode: couponCode,
        appointmentId: scheduledSC.getSD.data!.appointmentId!,
      );
      setCoupon = data;
      showDiscount.value = true;
      log('this is the discount amount : ${getCoupon.data!.discountRate}');
      log('this is the total discount amount : ${getCoupon.data!.totalPrice}');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    cardHolderNameController = TextEditingController();
    cardNumberController = TextEditingController();
    expiryDateController = TextEditingController();
    cvvController = TextEditingController();
    super.onInit();
  }

}
