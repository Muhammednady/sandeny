import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/bilateral_session/controllers/bilateral_session_controller.dart';
import '../../Auth/models/countries_model.dart';
import '../../Auth/providers/countries_provider.dart';
import '../../appointment_booking/controllers/appointment_booking_controller.dart';
import '../models/get_bilateral_session_details_model.dart';
import '../models/send_bilateral_session_doctors_model.dart';
import '../providers/get_bilateral_session_details.dart';
import '../providers/send_bilateral_session_details_provider.dart';
import '../views/bilateral_session_payment_view.dart';

class BilateralSessionDetailsController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  final countriesProvider = CountriesProvider();
  final sendBSDProvider = SendBilateralSessionDetailsProvider();
  var getBSDProvider = GetBilateralSessionDetailsProvider();
  final bilateralSC = Get.put(BilateralSessionController());
  final appointmentBC = Get.put(AppointmentBookingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxList<CountryData> countriesList = <CountryData>[].obs;
  final RxBool isLoading = false.obs;
  final RxString fileName = ''.obs;
  final RxInt key = 966.obs;
  final RxInt selectedIndex = 0.obs;
  final RxBool isObscure = true.obs;
  final RxBool isObscureConfirm = true.obs;

  FilePickerResult? result;
  List<PlatformFile> pickedFiles = [];
  List<File> filesToDisplay = [];

  String reason = '';
  String relativeRelation = '';
  String phone = '';
  String problem = '';

  @override
  void onInit() {
    getCountries();
    super.onInit();
  }

  GetBilateralSessionDetailsModel bilateralSD =
      GetBilateralSessionDetailsModel();

  SendBilateralSessionDetailsModel bilateralData =
      SendBilateralSessionDetailsModel();

  set setSBSD(SendBilateralSessionDetailsModel data) {
    bilateralData = data;
    update();
  }

  set setBSD(GetBilateralSessionDetailsModel bSDdata) {
    bilateralSD = bSDdata;
    update();
  }

  GetBilateralSessionDetailsModel get getBSD => bilateralSD;

  SendBilateralSessionDetailsModel get getSBSD => bilateralData;

  Future<void> getCountries() async {
    isLoading.value = true;
    try {
      final data = await countriesProvider.getCountries();
      countriesList.assignAll(data);
    } catch (e) {
      log(e.toString());
    }
    EasyLoading.dismiss();
    isLoading.value = false;
  }
  void selectFiles() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      pickedFiles = result!.files;
      filesToDisplay = pickedFiles.map((file) => File(file.path!)).toList();
      log('filesToDisplay: $filesToDisplay');
    }
    update();
  }

  Future<void> sendBilateralSessionDetails() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }

      formKey.currentState!.save();

      final doctorId = bilateralSC.getDoctorData[0].id!;
      final specializationTypeId = bilateralSC.specializationTypeId.value;
      final departmentId =
          bilateralSC.filterController.ratingPercentage.value.toInt();
      final workDayId = bilateralSC.getDoctorData[0].workDays![0].id!;
      final periodId = bilateralSC.sessionId.value;
      final date = appointmentBC.selectedDate.toString().split(' ')[0];
      final startTime = appointmentBC.startAt.value;
      final endTime = appointmentBC.endAt.value;
      final startTime2 =
          appointmentBC.getAvailableAppointmentData.data!.first.startAt!;
      final endTime2 =
          appointmentBC.getAvailableAppointmentData.data!.first.endAt!;

      final data = await sendBSDProvider.sendBilateralSessionDetails(
        doctorId: doctorId,
        specializationTypeId: specializationTypeId,
        departmentId: departmentId,
        workDayId: workDayId,
        periodId: periodId,
        reason: problem,
        date: date,
        phone: phone,
        relativeRelation: appointmentBC.relationType.value,
        files: filesToDisplay,
        startTime: startTime.isEmpty ? startTime2 : startTime,
        endTime: endTime.isEmpty ? endTime2 : endTime,
      );
      setSBSD = data;
      if (data.code == 1) {
        getBilateralSessionDetails();
        EasyLoading.dismiss();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getBilateralSessionDetails() async {
    try {
      var data = await getBSDProvider.getBSDetails(
        appointmentId: getSBSD.data!.appointmentId,
      );
      setBSD = data;
      if (data.code == 1) {
        EasyLoading.dismiss();
        Get.to(() => const BilateralSessionPaymentView());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}
