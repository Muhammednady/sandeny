import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/Immediate_consultation/controllers/immediate_consultation_controller.dart';
import 'package:sandeny/app/modules/amazon_payment/controllers/tabby_payment_controller.dart';
import 'package:sandeny/app/modules/amazon_payment/views/tabby_payment_view.dart';
import 'package:sandeny/constants/buttons_manager.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/payment_widgets/appointment_info_widget.dart';
import '../../../../widgets/payment_widgets/booking_details.dart';
import '../../../../widgets/payment_widgets/payment_method.dart';
import '../../../../widgets/payment_widgets/tabby_payment_method.dart';
import '../../../../widgets/payment_widgets/terms_and_conditions.dart';
import '../../amazon_payment/controllers/amazon_pay_controller.dart';
import '../../amazon_payment/controllers/stcPay_payment_controller.dart';
import '../../amazon_payment/providers/pay_appointment_provider.dart';
import '../../amazon_payment/views/stc_pay_view.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale!.languageCode == 'ar';
    final ImmediateConsultationController controller =
        Get.put(ImmediateConsultationController());
    final paymentController = Get.put(PaymentController());
    var appointment = Get.arguments;
    final amazonPay = Get.put(AmazonPayController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.greyColor,
        elevation: 0,
        leading: Padding(
          padding: isArabic
              ? const EdgeInsets.only(right: AppPadding.p30)
              : const EdgeInsets.only(left: AppPadding.p30),
          child: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsManager.blackColor,
            ),
          ),
        ),
        title: Text(
          'payment'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s15,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: Get.height * 0.75,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // AppointmentInformation widget describe doctor information and appointment information
                    appointmentInfo(context, appointment),
                    const SizedBox(
                      height: 15,
                    ),

                    // BookingDetails widget describe booking details
                    bookingDetails(context, appointment),
                    const SizedBox(
                      height: 15,
                    ),

                    // Payment Method Widget
                    paymentMethod(context, paymentController),

                    const SizedBox(
                      height: 15,
                    ),

                    // Tabbay Payment Method Widget
                    tabbyMethod(context, paymentController, appointment),

                    // Terms And Conditions
                    termsAndConditions(context, controller),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Pay Button
            ButtonsManager.primaryButton(
              text: 'pay'.tr,
              onPressed: () {
                if (controller.readTerms.value == true) {
                  appointmentPay(
                    context,
                    paymentController,
                    appointment,
                    amazonPay,
                  );
                } else {
                  Dialogs.errorDialog(
                      context, 'accepte_terms_and_conditions'.tr);
                }
              },
              context: context,
              minimumSize: const Size(315, 50),
              maximumSize: const Size(315, 50),
            ),
          ],
        ),
      ),
    );
  }

  // method to handle the payment of the appointment
  void appointmentPay(
      BuildContext context, paymentController, appointment, amazonPay) {
    final storage = GetStorage();
    if (paymentController.creditOrDebitCard.value == true ||
        paymentController.madaCard.value == true) {
      amazonPay.paymentWithCreditOrDebitCard(
        onSucceeded: (result) {
          final paymentAppointmentProvider = PayAppointmentProvider();
          Dialogs.successDialog(context, 'payment_done_begin_consultation'.tr);
          paymentAppointmentProvider.sendAppointmentPay(
              appointmentId: appointment.id!.toString(),
              paymentOption: 'Credit Card');
        },
        onFailed: (error) {
          Dialogs.errorDialog(context, '${'transaction_failed'.tr} $error');
        },
        onCancelled: () {
          Dialogs.errorDialog(context, 'transaction_cancelled'.tr);
        },
        amount: paymentController.showDiscount.value == true
            ? double.parse(paymentController.getPaymentCoupon.data!.totalPrice!)
                .toInt()
            : double.parse(appointment.price!).toInt(),
        doctorName: appointment.doctorName!,
        customerEmail: storage.read('email'),
        customerName: '${storage.read('fname')} ${storage.read('lname')}',
        phoneNumber: '${storage.read('phone')}',
        merchantReference: appointment.id!.toString(),
        sessionType: appointment.sessionType!,
      );
    } else if (paymentController.applePayCard.value == true) {
      if (GetPlatform.isIOS) {
        amazonPay.paymentWithApplePay(
          onSucceeded: (result) {
            Dialogs.successDialog(
                context, 'payment_done_begin_consultation'.tr);
            final paymentAppointmentProvider = PayAppointmentProvider();
            paymentAppointmentProvider.sendAppointmentPay(
              appointmentId: appointment.id!.toString(),
              paymentOption: 'Credit Card',
            );
          },
          onFailed: (error) {
            Dialogs.errorDialog(context, '${'transaction_failed'.tr} $error');
            log(error);
          },
          amount: paymentController.showDiscount.value == true
              ? double.parse(
                      paymentController.getPaymentCoupon.data!.totalPrice!)
                  .toInt()
              : double.parse(appointment.price!).toInt(),
          doctorName: appointment.doctorName!,
          customerEmail: storage.read('email'),
          customerName: '${storage.read('fname')} ${storage.read('lname')}',
          phoneNumber: '${storage.read('phone')}',
          merchantReference: appointment.id!.toString(),
          sessionType: appointment.sessionType!,
        );
      }
    } else if (paymentController.tabbyOption.value == true) {
      if (appointment.id != null) {
        Get.put(TabbyPaymentController());
        Get.to(
          () => const TabbyPaymentView(),
          arguments: appointment.id!.toString(),
        );
      }
    } else if (paymentController.stcPayOption.value == true) {
      if (appointment.id != null) {
        Get.put(StcPayPaymentController());
        Get.to(
          () => const StcPayPaymentView(),
          arguments: appointment.id!.toString(),
        );
      }
    } else {
      Dialogs.errorDialog(
        context,
        'please_choose_payment_method'.tr,
      );
    }
  }
}
