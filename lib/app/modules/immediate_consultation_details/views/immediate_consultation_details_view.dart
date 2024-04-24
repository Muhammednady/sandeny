import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/buttons_manager.dart';
import '../../../../constants/colors_manager.dart';
import '../../../../constants/dialogs.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/immediate_consultation_details/consultation_info.dart';
import '../../../../widgets/immediate_consultation_details/immediate_consultation_booking_details.dart';
import '../../../../widgets/immediate_consultation_details/tabby_immediate_consultation.dart';
import '../../../../widgets/payment_widgets/payment_method.dart';
import '../../../../widgets/payment_widgets/terms_and_conditions.dart';
import '../../Immediate_consultation/controllers/immediate_consultation_controller.dart';
import '../../payment/controllers/payment_controller.dart';
import '../controllers/immediate_consultation_details_controller.dart';

class ImmediateConsultationDetailsView
    extends GetView<ImmediateConsultationDetailsController> {
  const ImmediateConsultationDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isArabic = Get.locale!.languageCode == 'ar';
    var paymentController = Get.put(PaymentController());
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
          'immediate_consultation_details'.tr,
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
                    consultationInfo(context),
                    const SizedBox(
                      height: 15,
                    ),

                    // BookingDetails widget describe booking details
                    iCBookingDetails(context, controller),
                    const SizedBox(
                      height: 15,
                    ),

                    // Payment Method Widget
                    paymentMethod(context, paymentController),

                    const SizedBox(
                      height: 15,
                    ),

                    // Handle Tabby Payment Widget
                    iCTabbyPayment(context, paymentController, controller),

                    // Terms And Conditions Widget
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
                  paymentController.sendImmediateConsultation();
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
}
