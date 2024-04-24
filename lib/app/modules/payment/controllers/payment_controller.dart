import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../routes/app_pages.dart';
import '../../Immediate_consultation/controllers/immediate_consultation_controller.dart';
import '../../amazon_payment/controllers/amazon_pay_controller.dart';
import '../../amazon_payment/controllers/stcPay_payment_controller.dart';
import '../../amazon_payment/controllers/tabby_payment_controller.dart';
import '../../amazon_payment/providers/pay_appointment_provider.dart';
import '../../amazon_payment/views/stc_pay_view.dart';
import '../../amazon_payment/views/tabby_payment_view.dart';
import '../../immediate_consultation_details/controllers/immediate_consultation_details_controller.dart';
import '../../scheduled_session/models/add_scheduled_session_coupon_model.dart';
import '../../scheduled_session/providers/add_scheduled_session_coupon_provider.dart';
import '../models/add_copoun.dart';
import '../providers/add_coupon_provider.dart';

class PaymentController extends GetxController {
  static PaymentController get instance => Get.put(PaymentController());
  late TextEditingController cardHolderNameController,
      cardNumberController,
      expiryDateController,
      cvvController;

  dynamic appointment = Get.arguments;

  final iCDController = Get.put(ImmediateConsultationDetailsController());

  // for credit or debit card selected
  final storage = GetStorage();

  String appointmentId = '';

  var iCController = Get.find<ImmediateConsultationController>();

  String couponCode = '';

  final GlobalKey<FormState> couponFormKey = GlobalKey<FormState>();

  final amazonPay = Get.put(AmazonPayController());

  AddCoupon couponData = AddCoupon();

  set setCoupon(AddCoupon data) {
    couponData = data;
    update();
  }

  AddScheduledSessionCoupon paymentCouponData = AddScheduledSessionCoupon();

  AddCoupon get getCoupon => couponData;

  // set coupon data for payment screen
  set setPaymentCoupon(AddScheduledSessionCoupon data) {
    paymentCouponData = data;
    update();
  }

  AddScheduledSessionCoupon get getPaymentCoupon => paymentCouponData;

  RxBool creditOrDebitCard = false.obs;
  void changeCreditOrDebitCard() {
    creditOrDebitCard.value = !creditOrDebitCard.value;
    applePayCard.value = false;
    madaCard.value = false;
    tabbyOption.value = false;
    stcPayOption.value = false;
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
    update();
  }

  // for tabby option selected
  RxBool tabbyOption = false.obs;
  void changeTabbyOption() {
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

  var couponProvider = AddCouponProvider();

  applyCoupon() async {
    var data = await couponProvider.addCoupon(
      doctorId: iCController.getDoctorData[0].id!,
      slotId: iCController.getSessionPData.data!.slot!.id!,
      couponCode: couponCode,
    );
    setCoupon = data;
    showDiscount.value = true;
  }

  final paymentCouponProvider = AddScheduledSessionCouponProvider();

  applyPaymentCoupon() async {
    try {
      final data = await paymentCouponProvider.addCoupon(
        appointmentId: appointment.id!,
        couponCode: couponCode,
      );
      setPaymentCoupon = data;
      showDiscount.value = true;
      log('this is the coupon data: ${getPaymentCoupon.data!.toJson()}');
    } catch (e) {
      log('this is the error: $e');
    }
  }

  void appointmentPay(dynamic data) {
    if (data.code == 1) {
      appointmentId = data.data!.appointmentId.toString();
      if (creditOrDebitCard.value == true || madaCard.value == true) {
        amazonPay.paymentWithCreditOrDebitCard(
          onSucceeded: (result) async {
            Dialogs.successDialog(
                Get.context!, 'payment_done_begin_consultation'.tr);
            final payAppointmentProvider = PayAppointmentProvider();
            try {
              await payAppointmentProvider.sendAppointmentPay(
                appointmentId: appointmentId,
                paymentOption: 'Credit Card',
              );
              Get.offAllNamed(Routes.HOME);
            } catch (e) {
              log('this is the error: $e');
            }
          },
          onFailed: (error) {
            log('this is the error: $error');
            Dialogs.errorDialog(
                Get.context!, '${'transaction_failed'.tr} $error');
          },
          onCancelled: () {
            Dialogs.errorDialog(Get.context!, 'transaction_cancelled'.tr);
          },
          amount: showDiscount.value == true
              ? double.parse(getCoupon.data!.totalPrice!).toInt()
              : double.parse(iCDController.getICD.data!.totalPrice!).toInt(),
          doctorName: iCDController.getICD.data!.name!,
          customerEmail: storage.read('email'),
          customerName: '${storage.read('fname')} ${storage.read('lname')}',
          phoneNumber: '${storage.read('phone')}',
          merchantReference: appointmentId,
          sessionType: 'immediate'.tr,
        );
      } else if (applePayCard.value == true) {
        if (GetPlatform.isIOS) {
          amazonPay.paymentWithApplePay(
            onSucceeded: (result) async {
              Dialogs.successDialog(
                  Get.context!, 'payment_done_begin_consultation'.tr);
              final payAppointmentProvider = PayAppointmentProvider();
              await payAppointmentProvider.sendAppointmentPay(
                appointmentId: storage.read('appointmentId').toString(),
                paymentOption: 'Credit',
              );
            },
            onFailed: (error) {
              Dialogs.errorDialog(
                  Get.context!, '${'transaction_failed'.tr} $error');
            },
            amount: showDiscount.value == true
                ? double.parse(getCoupon.data!.totalPrice!).toInt()
                : double.parse(iCDController.getICD.data!.totalPrice!).toInt(),
            doctorName: iCDController.getICD.data!.name!,
            customerEmail: storage.read('email'),
            customerName: '${storage.read('fname')} ${storage.read('lname')}',
            phoneNumber: '${storage.read('phone')}',
            merchantReference: appointmentId,
            sessionType: 'immediate'.tr,
          );
        }
      } else if (tabbyOption.value == true) {
        Get.put(TabbyPaymentController());
        Get.to(
          () => const TabbyPaymentView(),
          arguments: appointmentId,
        );
      } else if (stcPayOption.value == true) {
        Get.put(StcPayPaymentController());
        Get.to(
          () => const StcPayPaymentView(),
          arguments: appointmentId,
        );
      } else {
        Dialogs.errorDialog(Get.context!, 'please_choose_payment_method'.tr);
      }
    }
  }

  sendImmediateConsultation() async {
    EasyLoading.show(status: 'loading'.tr);
    try {
      var data = await iCController.sendICProvider.sendImmediateConsultation(
        consultationType: iCController.sessionNatureId.value,
        doctorId: iCController.doctorId.value,
        slotId: iCController.getSessionPData.data!.slot!.id!,
        departmentId: iCController.filterController.specializationId.value,
        rate: iCController.filterController.ratingPercentage.value.toInt(),
        feelings: iCController.fellingsList,
        couponCode: couponCode,
      );
      EasyLoading.dismiss();
      update();

      appointmentPay(data);
    } catch (e) {
      EasyLoading.dismiss();
      log('this is the error: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    cardHolderNameController = TextEditingController();
    cardNumberController = TextEditingController();
    expiryDateController = TextEditingController();
    cvvController = TextEditingController();
  }

  RxBool rememberCard = false.obs;
  rememberCardDetails(bool value) {
    rememberCard.value = value;
    update();
  }
}
