import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/doctors/models/doctor_details_model.dart';
import 'package:sandeny/app/modules/filter/controllers/filter_controller.dart';

import '../../../../constants/pagination.dart';
import '../../../../widgets/best_doctors_widgets/doctor_details.dart';
import '../../home/models/get_doctors_model.dart';
import '../../home/providers/get_doctors_provider.dart';
import '../../home/providers/select_favorite_doctor_provider.dart';
import '../models/department_doctors_model.dart';
import '../providers/department_doctors_provider.dart';
import '../providers/doctor_details_provider.dart';

class DoctorsController extends GetxController {
  List<String> doctorList = [
    'dr_mohamed'.tr,
    'dr_mohamed'.tr,
    'dr_mohamed'.tr,
    'dr_mohamed'.tr,
    'dr_mohamed'.tr,
  ];
  List<String> doctorSpeciality = [
    'psychiatry'.tr,
    'psychiatry'.tr,
    'psychiatry'.tr,
    'psychiatry'.tr,
    'psychiatry'.tr,
  ];

  List<String> doctorRate = [
    '5/5',
    '5/5',
    '5/5',
    '5/5',
    '5/5',
  ];

  List<String> doctorDescription = [
    'dr_mohamed_description'.tr,
    'dr_mohamed_description'.tr,
    'dr_mohamed_description'.tr,
    'dr_mohamed_description'.tr,
    'dr_mohamed_description'.tr,
  ];

  RxBool isLoading = false.obs;

  RxBool isFavorite = false.obs;

  final _paginationFilter = PaginationFilter().obs;

  var doctorDetailsProvider = DoctorDetailsProvider();

  RxBool selectValue = false.obs;

  set selectAboutDoctorOrRatings(bool value) {
    selectValue.value = value;
    update();
  }

  bool get selectAboutDoctorOrRatings => selectValue.value;

  final _lastPage = false.obs;
  int? get limit => _paginationFilter.value.limit;
  int? get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  void setFavorite(bool value) {
    isFavorite.value = value;
    isFavorite.value = isFavorite.value;
    log('value: ${isFavorite.value}');
    update();
  }

  var getDoctorsProvider = GetDoctorsProvider();

  var departmentClinicProvider = DepartmentClinicsProvider();

  RxList<ResultData> allDoctorsList = <ResultData>[].obs;
  RxList<DepartmentClinicsData> personalDoctorsList =
      <DepartmentClinicsData>[].obs;
  RxList<DepartmentClinicsData> familyDoctorsList =
      <DepartmentClinicsData>[].obs;

  List<DoctorData> doctorDetailsList = <DoctorData>[].obs;

  var favoriteDoctorProvider = SelectFavoriteDoctorProvider();

  DoctorData myDoctor = DoctorData();

  set setDoctor(DoctorData doctor) {
    myDoctor = doctor;
    update();
  }

  DoctorData get getDoctor => myDoctor;

  RxInt tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  RxInt selectIndex = 0.obs;
  void changeSelectIndex(int i) {
    selectIndex.value = i;
    update();
  }

  // To get all the doctors in all clinics
  Future<void> getAllDoctors() async {
    isLoading.value = true;
    var response = await getDoctorsProvider.getAllDoctors();
    for (var element in response) {
      allDoctorsList.add(element);
    }
    isLoading.value = false;
    EasyLoading.dismiss();
    update();
  }

  // To get the doctor details
  Future<void> getDoctorDetails({required int? doctorId}) async {
    isLoading.value = true;
    try {
      var data = await doctorDetailsProvider.getDoctorDetails(doctorId!);
      setDoctor = data;
      doctorDetailsWidget(Get.context!, Get.put(DoctorsController()));
      isLoading.value = false;
      EasyLoading.dismiss();
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
      EasyLoading.dismiss();
    }
    update();
  }

  // to get the personal clinic doctors
  Future<void> getPersonalDoctors() async {
    isLoading.value = true;
    await departmentClinicProvider
        .getDepartmentDoctors(_paginationFilter.value, id: '1')
        .then((response) {
      if (response.data!.isEmpty) {
        _lastPage.value = true;
      }

      for (var element in response.data!) {
        personalDoctorsList.add(element);
      }
      isLoading.value = false;
      EasyLoading.dismiss();
    }).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        EasyLoading.dismiss();
        // Dialogs.connectionErrorDialog(Get.context!);
        isLoading.value = false;
        update();
        return null;
      },
    );

    update();
  }

  // to get the family clinic doctors
  Future<void> getFamilyDoctors() async {
    isLoading.value = true;
    await departmentClinicProvider
        .getDepartmentDoctors(_paginationFilter.value, id: '2')
        .then((response) {
      if (response.data!.isEmpty) {
        _lastPage.value = true;
      }

      for (var element in response.data!) {
        familyDoctorsList.add(element);
      }
      isLoading.value = false;
      EasyLoading.dismiss();
    }).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        EasyLoading.dismiss();
        // Dialogs.connectionErrorDialog(Get.context!);
        isLoading.value = false;
        update();
        return null;
      },
    );

    update();
  }

  Future<void> addDoctorToFavorite({required int? doctorId}) async {
    await favoriteDoctorProvider.addToFavorite(doctorId: doctorId);
    update();
  }

  Future<void> removeDoctorFromFavorite({required int? doctorId}) async {
    await favoriteDoctorProvider.removeFromFavorite(doctorId: doctorId);
    update();
  }

  void changeTotalPerPage(int limitValue) {
    allDoctorsList.clear();
    personalDoctorsList.clear();
    familyDoctorsList.clear();
    _lastPage.value = false;
    _changePaginationFilter(1);
  }

  void _changePaginationFilter(int page) {
    _paginationFilter.update((val) {
      val!.page = page;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page! + 1);

  @override
  void onInit() async {
    Get.put(FilterController());
    super.onInit();
  }
}
