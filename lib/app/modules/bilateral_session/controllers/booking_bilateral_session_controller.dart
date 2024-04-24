import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../doctors/models/doctor_details_model.dart';
import '../../doctors/providers/doctor_details_provider.dart';
import '../../filter/controllers/filter_controller.dart';
import '../models/get_available_bilateral_session_doctors_model.dart';
import '../models/get_bilateral_session_model.dart';
import '../providers/get_available_bilateral_session_doctors_provider.dart';
import '../providers/get_bilateral_session_details.dart';
import '../providers/get_bilateral_session_provider.dart';
import 'bilateral_session_payment_controller.dart';

class BookingBilateralSessionController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  final storage = GetStorage();

  GetBilateralSession sessionData = GetBilateralSession();

  var getBSProvider = GetBilateralSessionProvider();

  var getAvailableBSDoctorProvider = GetAvailableBSDoctorProvider();

  var getBSDProvider = GetBilateralSessionDetailsProvider();

  var doctorDetailsProvider = DoctorDetailsProvider();

  var filterController = Get.put(FilterController());


  // var iBSDController = Get.put(ImmediateConsultationDetailsController());
  final bilateralSBC = Get.put(BilateralSessionPaymentController());

  RxList<GetBilateralSession> bSList = <GetBilateralSession>[].obs;

  List<BilateralSessionDoctors> myData = <BilateralSessionDoctors>[].obs;

  set setDoctorData(List<BilateralSessionDoctors> data) {
    myData = data;
  }

  List<BilateralSessionDoctors> get getDoctorData => myData;

  DoctorData myDoctor = DoctorData();

  set setDoctor(DoctorData doctor) {
    myDoctor = doctor;
    update();
  }

  RxInt specializationTypeId = 0.obs;
  RxList specializationList = [].obs;

  set setData(GetBilateralSession data) {
    sessionData = data;
  }

  GetBilateralSession get getData => sessionData;

  RxBool isLoading = false.obs;

  String phone = '';

  RxInt sessionId = 0.obs;

  RxList sessionList = [].obs;

  RxInt sessionNatureId = 0.obs;

  RxList sessionNatureList = [].obs;

  RxList<int> countries = [966, 971, 965, 974, 973, 968].obs;
  RxInt key = 966.obs;
  var isObscure = true.obs;
  var isObscureConfirm = true.obs;
  void selectCountry(int value) {
    key.value = value;
    update();
  }

  RxString relationType = 'brother_sister'.tr.obs;
  void selectRelation(String value) {
    relationType.value = value;
    update();
  }

  // list of Relative Relation
  List<String> listOfRelativeRelation = [
    'brother_sister'.tr,
    'father_mother'.tr,
    'son_daughter'.tr,
    'other'.tr,
  ];

  RxInt selectedIndex = 0.obs;
  void selectCountryIndex(int value) {
    selectedIndex.value = value;
    key.value = countries[value];
    update();
  }

  void selectDoctorSpecialization(int value) {
    log('this is the value: $value');
    specializationTypeId.value = value;
    update();
  }

  selectSessionById(int id) {
    sessionId.value = id;
  }

  RxBool sessionPeriodValue = false.obs;
  selectSessionPeriod(bool value) {
    sessionPeriodValue.value = value;
    log('this is the value1: ${sessionPeriodValue.value}');
    update();
  }

  RxBool sessionNatureValue = false.obs;
  selectSessionNature(bool value) {
    log('this is the sessionNatureValue: ${sessionNatureValue.value}');
    sessionNatureValue.value = value;
    update();
  }

  RxList fellingsList = [].obs;

  selectListItems(int item) {
    if (fellingsList.contains(item)) {
      fellingsList.remove(item);
      log('this is the length: $fellingsList');
    } else {
      fellingsList.add(item);
      log('this is the length: $fellingsList');
    }
  }

  getBilateralSession() async {
    isLoading.value = false;
    bSList.clear();
    var data = await getBSProvider.getBilateralSession();
    setData = data;
    bSList.add(data);
    isLoading.value = true;
    update();
  }

  getAvailableDoctors() async {
    isLoading.value = false;
    try {
      var data = await getAvailableBSDoctorProvider.getAvailabeDoctors(
        specializationTypeId: specializationTypeId.value,
      );
      setDoctorData = data;
      storage.write('sessionPeriodList', getData.data!.periods!.toString());
      isLoading.value = true;
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    getBilateralSession();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
  }
}
