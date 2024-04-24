import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/widgets/myAppointments_widgets.dart/appointment_time_finished.dart';
import '../../app/modules/chat/controllers/chat_controller.dart';
import '../../app/modules/connect_with_doctor/views/connect_with_doctor_view.dart';
import '../../constants/colors_manager.dart';
import '../../constants/dialogs.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';
import 'cancel_appointment.dart';
import 'not_coming_appointments.dart';
import 'not_payed_appointment_widget.dart';

bookingManagement(BuildContext context, dynamic appointment) {
  return showModalBottomSheet(
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (context) => Container(
      height: 200,
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorsManager.greyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Container(
              width: 44,
              height: 6,
              decoration: const BoxDecoration(
                color: ColorsManager.defaultGreyColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(
                    top: 40,
                    right: 40,
                  )
                : const EdgeInsets.only(
                    top: 40,
                    left: 40,
                  ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    handleAppointmenTap(context, appointment);
                  },
                  child: SvgPicture.asset(
                    Images.videoIcon2,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'start_consultation'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.blackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Divider(
              color: ColorsManager.primaryColor,
              thickness: 0.1,
            ),
          ),
          Padding(
            padding: Get.locale!.languageCode == 'ar'
                ? const EdgeInsets.only(
                    top: 10,
                    right: 40,
                  )
                : const EdgeInsets.only(
                    top: 10,
                    left: 40,
                  ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    cancellApoointment(context, appointment.id);
                  },
                  child: SvgPicture.asset(
                    Images.cancelIcon,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'cancel_booking'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.blackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

// method to handle all the appointment events
void handleAppointmenTap(BuildContext context, dynamic appointment) {
  // This is the appointment date
  DateTime appointmentDate = DateTime.parse(appointment.date);

  // This is the current date
  DateTime currentDate = DateTime.now();

  // make the appointmentDate format and the currentDate format its the same as yyyy-mm-dd
  appointmentDate = DateTime(
    appointmentDate.year,
    appointmentDate.month,
    appointmentDate.day,
  );

  currentDate = DateTime(
    currentDate.year,
    currentDate.month,
    currentDate.day,
  );

  // this is the appointment start time
  final appointmentStartTime = appointment.startAt;

  // this is the appointment end time
  final appointmentEndTime = appointment.endAt;

  // this is the current hour
  final currentHour = DateTime.now().hour;

  // this is the current minute
  int currentMinute = DateTime.now().minute;

  // Convert appointment.startDate to hours and minutes
  final List<String> timeParts = appointmentStartTime.split(':');
  final int appointmentStartHour = int.parse(timeParts[0]);
  final int appointmentStartMinute = int.parse(timeParts[1]);

  // Convert appointment.endDate to hours and minutes
  final List<String> timeParts2 = appointmentEndTime.split(':');
  final int appointmentEndHour = int.parse(timeParts2[0]);
  final int appointmentEndMinute = int.parse(timeParts2[1]);

  if (appointment.sessionType == 'instant') {
    if (appointmentDate == currentDate) {
      if (currentHour.isLowerThan(appointmentStartHour)) {
        notComingAppointments(context, appointment);

        // if the current time grater than the appointment time
      }
      if (currentHour.isGreaterThan(appointmentEndHour)) {
        appointmentTimeFinished(context, appointment);

        // if the current minute is grater than the appointment finished minute
      } else if ((currentHour >= appointmentEndHour &&
          currentMinute >= appointmentEndMinute)) {
        appointmentTimeFinished(context, appointment);

        // if the current time is == or less than the appointment finished time then the appointment start
      } else if ((currentHour >= appointmentStartHour ||
          currentHour <= appointmentEndHour &&
              currentMinute < appointmentEndMinute)) {
        if (appointment.isPaid == 1) {
          final controller = Get.put(ChatController());
          controller.getChatMessages(
            doctorId: appointment.doctorId!,
          );
          Get.to(
            const ConnectWithDoctorView(),
            arguments: [
              appointment.id,
              appointment.doctorId,
              appointment.profileImage,
              appointment.doctorName,
              appointment.patientId,
              appointment.endAt,
              appointment.startAt,
            ],
          );
        } else {
          notPayedApoointment(context, appointment);
        }
      }

      // if the current date is after the appointment date
    } else if (currentDate.isAfter(appointmentDate)) {
      appointmentTimeFinished(context, appointment);

      // if the current date is before the appointment date
    } else if (currentDate.isBefore(appointmentDate)) {
      notComingAppointments(context, appointment);
    }
  }

  // if the appointment type other than instance (bilateral or scheduled)
  else {
    if (appointmentDate == currentDate) {
      // here we handled all the cases of the appointment time
      if (currentHour.isLowerThan(appointmentStartHour)) {
        notComingAppointments(context, appointment);

        // if the current time grater than the appointment time
      } else if (currentHour.isGreaterThan(appointmentEndHour)) {
        appointmentTimeFinished(context, appointment);

        // if the current minute is grater than the appointment finished minute
      } else if ((currentHour >= appointmentEndHour &&
          currentMinute >= appointmentEndMinute)) {
        appointmentTimeFinished(context, appointment);

        // if the current time is == or less than the appointment finished time then the appointment start
      } else if ((currentHour >= appointmentStartHour &&
              currentMinute >= appointmentStartMinute ||
          currentHour <= appointmentEndHour &&
              currentMinute < appointmentEndMinute)) {
        if (appointment.isPaid == 1) {
          final controller = Get.put(ChatController());
          controller.getChatMessages(doctorId: appointment.doctorId!);
          Get.to(
            const ConnectWithDoctorView(),
            arguments: [
              appointment.id,
              appointment.doctorId,
              appointment.profileImage,
              appointment.doctorName,
              appointment.patientId,
              appointment.endAt,
              appointment.startAt,
            ],
          );
        } else {
          notPayedApoointment(context, appointment);
        }
      }
    }

    // if the current date is after the appointment date
    else if (currentDate.isAfter(appointmentDate)) {
      appointmentTimeFinished(context, appointment);

      // if the current date is before the appointment date
    } else if (currentDate.isBefore(appointmentDate)) {
      notComingAppointments(context, appointment);
    }
  }
}
