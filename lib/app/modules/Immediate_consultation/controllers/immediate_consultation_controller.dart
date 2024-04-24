import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/immediate_consultation_details/controllers/immediate_consultation_details_controller.dart';

import '../../../../widgets/best_doctors_widgets/doctor_details.dart';
import '../../doctors/models/doctor_details_model.dart';
import '../../doctors/providers/doctor_details_provider.dart';
import '../../filter/controllers/filter_controller.dart';
import '../models/get_available_session_instants_doctor_model.dart';
import '../models/get_immediate_consultation_model.dart';
import '../models/get_immediate_consultation_price.dart';
import '../providers/get_available_doctors_immediate_consultation_provider.dart';
import '../providers/get_immediate_consultation_price_provider.dart';
import '../providers/get_immediate_consultation_provider.dart';
import '../providers/get_immediate_session_details_provider.dart';
import '../providers/send_immediate_consultation_provider.dart';

class ImmediateConsultationController extends GetxController {
  var getICProvider = GetImmediateConsultationProvider();

  var iCDController = Get.put(ImmediateConsultationDetailsController());

  var getICPriceProvider = GetImmediateConsultationPriceProvider();

  var storage = GetStorage();

  var filterController = Get.put(FilterController());

  RxList<GetImmediateConsultation> iCList = <GetImmediateConsultation>[].obs;

  var sendICProvider = SendImmediateConsultationProvider();

  var getAvailableICDoctorProvider = GetAvailableICDoctorProvider();

  var doctorDetailsProvider = DoctorDetailsProvider();

  var getICDProvider = GetImmediateConsultationDetails();

  var doctorId = 0.obs;

  List<ImmediateConsultationDoctors> myData =
      <ImmediateConsultationDoctors>[].obs;

  set setDoctorData(List<ImmediateConsultationDoctors> data) {
    myData = data;
  }

  DoctorData myDoctor = DoctorData();

  set setDoctor(DoctorData doctor) {
    myDoctor = doctor;
    update();
  }

  RxBool selectValue = false.obs;

  set selectAboutDoctorOrRatings(bool value) {
    selectValue.value = value;
    update();
  }

  bool get selectAboutDoctorOrRatings => selectValue.value;

  DoctorData get getDoctor => myDoctor;

  List<ImmediateConsultationDoctors> get getDoctorData => myData;

  RxBool isLoading = false.obs;

  RxInt sessionId = 0.obs;

  RxList sessionList = [].obs;

  RxInt sessionNatureId = 0.obs;

  RxList sessionNatureList = [].obs;

  RxBool isFavorite = false.obs;

  void setFavorite(bool value) {
    isFavorite.value = value;
    update();
  }

  RxBool readTerms = false.obs;
  changeReadTerms(bool value) {
    readTerms.value = value;
    log('readTerms.value: ${readTerms.value}');
    storage.write('readTerms', readTerms.value);
    log('${storage.read(readTerms.toString())}');
    update();
  }

  RxList<GetImmediateConsultationPrice> sessionPeriodList =
      <GetImmediateConsultationPrice>[].obs;

  GetImmediateConsultation consultationData = GetImmediateConsultation();

  set setData(GetImmediateConsultation data) {
    consultationData = data;
  }

  GetImmediateConsultation get getData => consultationData;

  GetImmediateConsultationPrice sessionPeriodData =
      GetImmediateConsultationPrice();

  set setSessionPeriodData(GetImmediateConsultationPrice data) {
    sessionPeriodData = data;
  }

  GetImmediateConsultationPrice get getSessionPData => sessionPeriodData;

  RxInt specializationTypeId = 0.obs;
  RxList specializationList = [].obs;

  late TextEditingController cardHolderNameController,
      cardNumberController,
      expiryDateController,
      cvvController;

  // bool to switch when the user click on the button to chooose the first period
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

  selectSessionById(int id) {
    sessionId.value = id;
    getImmediatePrice();
  }

  selectSessionNatureById(int id) {
    sessionNatureId.value = id;
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

  selectClinic(bool value) {
    selectValue.value = value;
    log('this is the value1: ${selectValue.value}');
    update();
  }

  RxBool selectValue2 = false.obs;
  selectClinic2(bool value) {
    selectValue2.value = value;
    log('this is the value1: ${selectValue2.value}');
    update();
  }

  RxInt fellingIndex = 0.obs;
  selectFellingIndex(int value) {
    fellingIndex.value = value;
    update();
  }

  // for first card selected
  RxBool firstCard = true.obs;
  void changeCard1() {
    firstCard.value = !firstCard.value;
    update();
  }

  // for second card selected
  RxBool secondCard = true.obs;
  void changeCard2() {
    secondCard.value = !secondCard.value;
    update();
  }

  // for third card selected
  RxBool thirdCard = true.obs;
  void changeCard3() {
    thirdCard.value = !thirdCard.value;
    update();
  }

  getImmediateConsultation() async {
    isLoading.value = false;
    iCList.clear();
    var data = await getICProvider.getImmediateConsultation();
    setData = data;
    iCList.add(data);
    log('this is the list: ${iCList.length}');
    isLoading.value = true;
    update();
  }

  void selectDoctorSpecialization(int value) {
    log('this is the value: $value');
    specializationTypeId.value = value;
    update();
  }

  void getImmediatePrice() async {
    isLoading.value = true;
    if (sessionId.value != 0 && filterController.specializationId.value != 0) {
      var data = await getICPriceProvider.getImmediateConsultationPrice(
        periodId: sessionId.value,
        specializationTypeId: filterController.specializationId.value,
      );
      setSessionPeriodData = data;
      log('this is the slotId: ${data.data!.slot!.id!}');
      // storage.write('departmentId',data.data!.department!.id!);
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      update();
    }
    update();
  }

  getAvailableDoctors() async {
    isLoading.value = false;
    try {
      var data = await getAvailableICDoctorProvider.getAvailabeDoctors(
        specializationTypeId: specializationTypeId.value,
      );
      setDoctorData = data;
      log('this is the length: ${getDoctorData.length}');
      isLoading.value = true;
      update();
    } catch (e) {
      log(e.toString());
      isLoading.value = true;
      update();
    }
  }

  Future<void> getDoctorDetails({required int? doctorId}) async {
    isLoading.value = true;
    try {
      var data = await doctorDetailsProvider.getDoctorDetails(doctorId!);
      setDoctor = data;
      doctorDetailsWidget(
        Get.context!,
        Get.put(ImmediateConsultationController()),
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

  getImmediateConsultationDetails(doctorId) async {
    var data = await getICDProvider.getImmediateConsultationDetails(
      doctorId: doctorId,
      slotId: getSessionPData.data!.slot!.id!,
      typeIds: sessionNatureList,
    );
    log('this is the doctorId: $doctorId');
    iCDController.setICD = data;
    log('this is the length: ${iCDController.getICD.data!.doctorId}');
  }

  @override
  void onInit() {
    cardHolderNameController = TextEditingController();
    cardNumberController = TextEditingController();
    expiryDateController = TextEditingController();
    cvvController = TextEditingController();
    getImmediateConsultation();
    super.onInit();
  }
}
