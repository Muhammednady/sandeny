import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors_manager.dart';
import '../../bilateral_session/controllers/bilateral_session_controller.dart';
import '../../scheduled_session/controllers/scheduled_session_controller.dart';
import '../models/get_available_appointment_model.dart';
import '../providers/get_available_appointments_provider.dart';

class AppointmentBookingController extends GetxController {
  late TextEditingController firstNameController,
      lastNameController,
      birthDateController,
      identityNumberController,
      phoneNumberController;

  DateTime selectedDate = DateTime.now();

  // make the date format like this 2024-02-04 only
  String get formattedDate => "${selectedDate.toLocal()}".split(' ')[0];

  RxList<AvailableAppointmentModel> aAList = <AvailableAppointmentModel>[].obs;

  AvailableAppointmentModel getAAData = AvailableAppointmentModel();

  set setAvailableAppointmentData(AvailableAppointmentModel data) {
    getAAData = data;
  }

  final scheduledSC = Get.put(ScheduledSessionController());

  AvailableAppointmentModel get getAvailableAppointmentData => getAAData;

  RxInt currentDateSelectedIndex = 0.obs; //For Horizontal Date
  ScrollController scrollController = ScrollController();

  final getAvailableAppointmentsProvider = GetAvailableAppointmentsProvider();
  final bilateralSessionController = Get.put(BilateralSessionController());

  void changeSelectedDate(int index) {
    currentDateSelectedIndex.value = index;
    update();
  }

  List<String> listOfMonths = [
    'january'.tr,
    'february'.tr,
    'march'.tr,
    'april'.tr,
    'may'.tr,
    'june'.tr,
    'july'.tr,
    'august'.tr,
    'september'.tr,
    'october'.tr,
    'november'.tr,
    'december'.tr,
  ];

  RxList<String> listOfDays =
      ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"].obs;

  List<String> listOfTime = [
    '9:00'.tr,
    '9:00'.tr,
    '9:00'.tr,
    '9:00'.tr,
  ];

  RxBool isLoading = false.obs;

  RxInt selected = 0.obs;

  RxString startAt = ''.obs;
  RxString endAt = ''.obs;

  void changeSelectedIndex(int index) {
    selected.value = index;
    log('this is the index $index');
    update();
  }

  RxBool isMale = true.obs;
  RxBool isFemale = false.obs;
  void changeSex(bool value) {
    if (value) {
      isMale.value = true;
      isFemale.value = false;
    } else {
      isMale.value = false;
      isFemale.value = true;
    }
    update();
  }

  // bool to switch when the user click on the button to choose doctor gender male
  RxBool gender1 = false.obs;
  set selectGender1(bool value) {
    gender1.value = value;
    update();
  }

  // bool to switch when the user click on the button to choose doctor gender male
  RxBool gender2 = false.obs;
  set selectGender2(bool value) {
    gender2.value = value;
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

  // logic for select relation and make the divider between the items
  List<DropdownMenuItem<String>> addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                color: ColorsManager.primaryColor,
                thickness: 0.1,
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> getCustomItemsHeights() {
    List<double> itemsHeights = [];
    for (var i = 0; i < (listOfRelativeRelation.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  RxInt key = 966.obs;
  var isObscure = true.obs;
  void selectCountry(int value) {
    key.value = value;
    update();
  }

  RxList<int> countries = [966, 971, 965, 974, 973, 968].obs;

  RxInt selectedIndex = 0.obs;
  void selectCountryIndex(int value) {
    selectedIndex.value = value;
    key.value = countries[value];
    update();
  }

  getAvailableAppointment() async {
    isLoading.value = false;
    aAList.clear();
    final periodId = bilateralSessionController.sessionId.value;
    final doctorId = bilateralSessionController.doctorId.value;
    try {
      log('this is the ################ : $formattedDate');
      log('this is the periodId : $periodId');
      log('this is the doctorId : $doctorId');
      final data =
          await getAvailableAppointmentsProvider.getAvailabeAppointments(
        doctorId: doctorId,
        periodId: periodId,
        date: formattedDate.toString(),
      );
      isLoading.value = true;
      setAvailableAppointmentData = data;
      aAList.add(data);
      log('this is the available appointment list: ${aAList.length}}');
    } catch (e) {
      isLoading.value = true;
      log(e.toString());
    }
  }

  getSelectedAvailableAppointment(DateTime currentDate) async {
    // log('this is the day now: $selectedDate');
    isLoading.value = false;
    aAList.clear();
    final periodId = bilateralSessionController.sessionId.value;
    final doctorId = bilateralSessionController.doctorId.value;
    try {
      final data =
          await getAvailableAppointmentsProvider.getAvailabeAppointments(
        doctorId: doctorId,
        periodId: periodId,
        date: currentDate.toString(),
      );
      isLoading.value = true;
      setAvailableAppointmentData = data;
      aAList.add(data);
      log('this is the available appointment list: ${aAList.length}}');
    } catch (e) {
      isLoading.value = true;
      log(e.toString());
    }
  }

  getAvailableScheduledAppointment() async {
    log('this is the day now: $selectedDate');
    isLoading.value = false;
    final periodId = scheduledSC.sessionId.value;
    final doctorId = scheduledSC.doctorId.value;
    log('this is the doctor id: $doctorId');
    log('this is the period id: $periodId');
    try {
      final data = await getAvailableAppointmentsProvider
          .getAvailabeScheduledAppointments(
        doctorId: doctorId,
        periodId: periodId,
        date: selectedDate.toString(),
      );
      isLoading.value = true;
      setAvailableAppointmentData = data;
      aAList.clear();
      aAList.add(data);
      log('this is the available appointment list: ${data.data!.length}}');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    birthDateController = TextEditingController();
    identityNumberController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    birthDateController.dispose();
    identityNumberController.dispose();
  }
}
