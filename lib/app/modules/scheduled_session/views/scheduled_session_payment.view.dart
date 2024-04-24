import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/amazon_payment/controllers/stcPay_payment_controller.dart';
import 'package:sandeny/app/modules/amazon_payment/views/stc_pay_view.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/payment_widgets/terms_and_conditions.dart';
import '../../../../widgets/scheduled_session_widgets/scheduled_scheduled_booking_details.dart';
import '../../../../widgets/scheduled_session_widgets/scheduled_session_consultation_info.dart';
import '../../../../widgets/scheduled_session_widgets/scheduled_session_payment_method.dart';
import '../../../../widgets/scheduled_session_widgets/tabby_scheduled_session.dart';
import '../../../routes/app_pages.dart';
import '../../Immediate_consultation/controllers/immediate_consultation_controller.dart';
import '../../amazon_payment/controllers/amazon_pay_controller.dart';
import '../../amazon_payment/controllers/tabby_payment_controller.dart';
import '../../amazon_payment/providers/pay_appointment_provider.dart';
import '../../amazon_payment/views/tabby_payment_view.dart';
import '../controllers/booking_scheduled_session_controller.dart';
import '../controllers/scheduled_session_payment_controller.dart';

class ScheduledSessionPaymentView
    extends GetView<ScheduledSessionPaymentController> {
  const ScheduledSessionPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var controller = Get.put(BookingScheduledSessionController());
    final paymentController = Get.put(ScheduledSessionPaymentController());
    final ImmediateConsultationController immediateController =
        Get.put(ImmediateConsultationController());
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
                    // Appointment Information widget describe doctor information and appointment information
                    scheduledSessionConsultationInfo(context, controller),
                    const SizedBox(
                      height: 15,
                    ),

                    // BookingDetails widget describe booking details
                    scheduledSessionBookingDetails(context, controller),
                    const SizedBox(
                      height: 15,
                    ),

                    // Payment Method Widget
                    scheduledSessionPaymentMethod(context),

                    const SizedBox(
                      height: 15,
                    ),

                    // Tabby Payment Widget
                    scheduledSTabbyPayment(
                      context,
                      paymentController,
                      controller,
                    ),

                    // Terms And Conditions
                    termsAndConditions(context, immediateController),
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
                if (immediateController.readTerms.value == true) {
                  payAppointmentValue(
                    context,
                    paymentController,
                    controller,
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

  void payAppointmentValue(
    BuildContext context,
    ScheduledSessionPaymentController paymentController,
    BookingScheduledSessionController controller,
  ) {
    final payAppointmentProvider = PayAppointmentProvider();
    final storage = GetStorage();
    final amazonPay = Get.put(AmazonPayController());
    if (paymentController.creditOrDebitCard.value == true) {
      amazonPay.paymentWithCreditOrDebitCard(
        onSucceeded: (result) async {
          Dialogs.successDialog(context, 'booking_success_des'.tr);
          try {
            await payAppointmentProvider.sendAppointmentPay(
              appointmentId: controller.getSD.data!.appointmentId!.toString(),
              paymentOption: 'Credit Card',
            );
            Get.offAllNamed(Routes.HOME);
          } catch (e) {
            log('this is the error: $e');
          }
        },
        onFailed: (error) {
          Dialogs.errorDialog(context, '${'transaction_failed'.tr} $error');
        },
        onCancelled: () {
          Dialogs.errorDialog(context, 'transaction_cancelled'.tr);
        },
        amount: paymentController.showDiscount.value == true
            ? double.parse(paymentController.getCoupon.data!.totalPrice!)
                .toInt()
            : double.parse(controller.getSSD.data!.totalPrice!).toInt(),
        doctorName: controller.getSSD.data!.name!,
        customerEmail: storage.read('email'),
        customerName: '${storage.read('fname')} ${storage.read('lname')}',
        phoneNumber: '${storage.read('phone')}',
        merchantReference: controller.getSD.data!.appointmentId!.toString(),
        sessionType: 'scheduled'.tr,
      );
    } else if (paymentController.applePayCard.value == true) {
      if (GetPlatform.isIOS) {
        amazonPay.paymentWithApplePay(
          onSucceeded: (result) {
            Dialogs.successDialog(context, 'booking_success_des'.tr);
          },
          onFailed: (error) {
            Dialogs.errorDialog(context, '${'transaction_failed'.tr} $error');
          },
          amount: paymentController.showDiscount.value == true
              ? int.parse(paymentController.getCoupon.data!.totalPrice!)
              : int.parse(controller.getSSD.data!.totalPrice!),
          doctorName: controller.getSSD.data!.name!,
          customerEmail: storage.read('email'),
          customerName: '${storage.read('fname')} ${storage.read('lname')}',
          phoneNumber: '${storage.read('phone')}',
          merchantReference: controller.getSD.data!.appointmentId!.toString(),
          sessionType: 'scheduled'.tr,
        );
      }
    } else if (paymentController.tabbyOption.value == true) {
      if (controller.getSD.data!.appointmentId != null) {
        Get.put(TabbyPaymentController());
        Get.to(
          () => const TabbyPaymentView(),
          arguments: controller.getSD.data!.appointmentId.toString(),
        );
      }
    } else if (paymentController.stcPayOption.value == true) {
      if (controller.getSD.data!.appointmentId != null) {
        Get.put(StcPayPaymentController());
        Get.to(
          () => const StcPayPaymentView(),
          arguments: controller.getSD.data!.appointmentId.toString(),
        );
      }
    } else {
      Dialogs.errorDialog(context, 'please_choose_payment_method'.tr);
    }
  }
}
