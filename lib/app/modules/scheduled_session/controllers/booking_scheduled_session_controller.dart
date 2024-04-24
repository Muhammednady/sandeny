import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/scheduled_session/controllers/scheduled_session_controller.dart';

import '../../appointment_booking/controllers/appointment_booking_controller.dart';
import '../../filter/controllers/filter_controller.dart';
import '../models/get_available_scheduled_session_doctors.dart';
import '../models/get_scheduled_session_details_model.dart';
import '../models/save_scheduled_session_model.dart';
import '../providers/get_available_scheduled_session_doctors_provider.dart';
import '../providers/get_scheduled_session_details_provider.dart';
import '../providers/get_scheduled_session_provider.dart';
import '../providers/save_scheduled_session_provider.dart';
import '../views/scheduled_session_payment.view.dart';

class BookingScheduledSessionController extends GetxController {
  static BookingScheduledSessionController get instance =>
      BookingScheduledSessionController.instance;

  var storage = GetStorage();

  var scheduledSessionProvider = GetScheduledSessionProvider();

  final scheduledSC = Get.put(ScheduledSessionController());

  final getScheduledSDP = Get.put(GetScheduledSessionDetailsProvider());

  RxBool isLoading = false.obs;

  RxInt sessionId = 0.obs;

  final getASDProvider = GetAvailableSSDoctorProvider();

  var filterController = Get.put(FilterController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final appointmentBC = Get.put(AppointmentBookingController());

  final sendScheduledSP = SendScheduledSessionProvider();

  SaveScheduledSessionModel scheduledData = SaveScheduledSessionModel();

  GetScheduledSessionDetailsModel ssData = GetScheduledSessionDetailsModel();

  set setSSD(GetScheduledSessionDetailsModel data) {
    ssData = data;
    update();
  }

  GetScheduledSessionDetailsModel get getSSD => ssData;

  set setSD(SaveScheduledSessionModel data) {
    scheduledData = data;
    update();
  }

  SaveScheduledSessionModel get getSD => scheduledData;

  List<ScheduledSessionDoctors> myData = <ScheduledSessionDoctors>[].obs;

  set setDoctorData(List<ScheduledSessionDoctors> data) {
    myData = data;
  }

  List<ScheduledSessionDoctors> get getDoctorData => myData;

  Future<void> bookingScheduledSession() async {
    try {
      final periodId = sessionId.value;
      final date = appointmentBC.selectedDate.toString().split(' ')[0];
      final startTime = appointmentBC.startAt.value;
      final endTime = appointmentBC.endAt.value;
      final startTime2 =
          appointmentBC.getAvailableAppointmentData.data!.first.startAt!;
      final endTime2 =
          appointmentBC.getAvailableAppointmentData.data!.first.endAt!;

      final data = await sendScheduledSP.sendScheduledSession(
        doctorId: scheduledSC.doctorId.value,
        specializationTypeId: scheduledSC.specializationTypeId.value,
        departmentId: filterController.specializationTypeId.value,
        periodId: periodId,
        reason: scheduledSC.problem,
        date: date,
        file: scheduledSC.fileToDisplay ?? File(''),
        startTime: startTime.isEmpty ? startTime2 : startTime,
        endTime: endTime.isEmpty ? endTime2 : endTime,
        feelings: scheduledSC.fellingsList,
      );
      setSD = data;
      if (data.code == 1) {
        getScheduledSessionDetails();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getScheduledSessionDetails() async {
    try {
      var data = await getScheduledSDP.getSSDetails(
        appointmentId: getSD.data!.appointmentId!,
      );
      setSSD = data;
      log('this is the doctorId : ${getSSD.data!.doctorId}');
      if (data.code == 1) {
        EasyLoading.dismiss();
        Get.to(() => const ScheduledSessionPaymentView());
      }
    } catch (e) {
      log(e.toString());
    }
  }



}
