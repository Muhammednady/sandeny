import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../widgets/best_doctors_widgets/doctor_details.dart';
import '../../doctors/models/doctor_details_model.dart';
import '../../doctors/providers/doctor_details_provider.dart';
import '../../filter/controllers/filter_controller.dart';
import '../models/get_available_bilateral_session_doctors_model.dart';
import '../models/get_bilateral_session_model.dart';
import '../providers/get_available_bilateral_session_doctors_provider.dart';
import '../providers/get_bilateral_session_provider.dart';

class BilateralSessionController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  final storage = GetStorage();

  GetBilateralSession sessionData = GetBilateralSession();

  var getBSProvider = GetBilateralSessionProvider();

  var getAvailableBSDoctorProvider = GetAvailableBSDoctorProvider();
  // var getICPriceProvider = GetImmediateConsultationPriceProvider();

  var doctorDetailsProvider = DoctorDetailsProvider();

  var filterController = Get.put(FilterController());

  // var iBSDController = Get.put(ImmediateConsultationDetailsController());

  RxList<GetBilateralSession> bSList = <GetBilateralSession>[].obs;

  List<BilateralSessionDoctors> myData = <BilateralSessionDoctors>[].obs;

  set setDoctorData(List<BilateralSessionDoctors> data) {
    myData = data;
  }

  List<BilateralSessionDoctors> get getDoctorData => myData;

  DoctorData myDoctor = DoctorData();

  RxInt doctorId = 0.obs;

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

  RxList<String> countryName = [
    'saudi_arabia'.tr,
    'uae'.tr,
    'kuwait'.tr,
    'qatar'.tr,
    'oman'.tr,
    'bahrain'.tr
  ].obs;

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

  RxBool firstPeriod = false.obs;
  selectFirstPeriod(bool value) {
    firstPeriod.value = value;
    update();
  }

  // bool to switch when the user click on the button to choose second period
  RxBool secondPeriod = false.obs;
  selectSecondPeriod(bool value) {
    secondPeriod.value = value;
    update();
  }

  RxBool thirdPeriod = false.obs;
  selectThirdPeriod(bool value) {
    thirdPeriod.value = value;
    update();
  }

  RxBool selectSpecialist = false.obs;
  selectSpecialization(bool value) {
    selectSpecialist.value = value;
    log('this is the value1: ${selectSpecialist.value}');
    update();
  }

  RxBool selectSpecialist2 = false.obs;
  selectSpecialization2(bool value) {
    selectSpecialist2.value = value;
    log('this is the value1: ${selectSpecialist2.value}');
    update();
  }

  RxBool videoSession = false.obs;
  selectVideoSession(bool value) {
    videoSession.value = value;
    update();
  }

  RxBool audioSession = false.obs;
  selectAudioSession(bool value) {
    audioSession.value = value;
    update();
  }

  RxList selectedNumbers = [
    '1_session'.tr,
    '2_sessions'.tr,
    '3_sessions'.tr,
    '4_sessions'.tr,
  ].obs;

  selectSessionById(int id) {
    sessionId.value = id;
  }

  selectDoctorSpecialization(int value) {
    log('this is the value: $value');
    specializationTypeId.value = value;
    update();
  }

  selectDoctorClinics(int id) {
    filterController.specializationId.value = id;
    log('this is the filter specialization id: ${filterController.specializationId.value}');
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
      isLoading.value = true;
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  Future<void> getDoctorDetails({required int? doctorId}) async {
    isLoading.value = true;
    try {
      var data = await doctorDetailsProvider.getDoctorDetails(doctorId!);
      setDoctor = data;
      doctorDetailsWidget(
        Get.context!,
        Get.put(BilateralSessionController()),
      );
      isLoading.value = false;
      EasyLoading.dismiss();
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
      EasyLoading.dismiss();
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
