import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/widgets/myAppointments_widgets.dart/booking_management2.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/fonts_manager.dart';
import '../../../../constants/images_manager.dart';
import '../../../../constants/styles_manager.dart';
import '../../../../constants/values_manager.dart';
import '../../../../widgets/myAppointments_widgets.dart/appointment_detailes_widget.dart';
import '../../../../widgets/myAppointments_widgets.dart/choose_appointmentDetails_or_Prescription.dart';
import '../../../../widgets/myAppointments_widgets.dart/not_complete_prescription.dart';
import '../controllers/my_appointments_controller.dart';

class ApointmentDetailsView extends GetView {
  const ApointmentDetailsView({Key? key, required int index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MyAppointmentsController());
    var index = Get.arguments;
    if (index == 0) {
      controller.selectIndex.value == 0;
    } else {
      controller.selectIndex.value == 1;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.greyColor,
        elevation: 0,
        title: Text(
          'apoointment_details'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s16,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: Get.locale!.languageCode == 'ar'
              ? const EdgeInsets.only(right: AppPadding.p30)
              : const EdgeInsets.only(left: 35),
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
        actions: [
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(left: 70)
                : const EdgeInsets.only(right: 70),
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  bookingManagement2(context);
                },
                child: controller.selectIndex.value == 0
                    ? SvgPicture.asset(
                        Images.menueIcon,
                      )
                    : const SizedBox(),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          chooseAppointmentDetailesorPrescriptionWidget(context),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(
              () => controller.selectIndex.value == 0
                  ? appointmentDetailsWidget(context, controller)
                  : notCompletePrescriptionWidget(context),
            ),
          ),
        ],
      ),
    );
  }
}
