import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../../routes/app_pages.dart';
import '../../doctors/models/filter_model_model.dart';
import '../../doctors/providers/filter_doctor_provider.dart';
import '../../home/providers/select_favorite_doctor_provider.dart';
import '../../network/controllers/network_controller.dart';
import '../models/experience_years_model.dart';
import '../models/price_list_model.dart';
import '../models/specialization_model.dart';
import '../providers/experince_years_provider.dart';
import '../providers/price_list_provider.dart';
import '../providers/spectialization_provider.dart';

class FilterController extends GetxController {
  TextEditingController consultationPriceController = TextEditingController();
  var networkController = NetworkController.instance;
  var provider = FilterModelProvider();
  var pricesListProvider = PricesListProvider();
  var exportListProvider = ExperienceYearsProvider();
  var favoriteDoctorProvider = SelectFavoriteDoctorProvider();
  var specializationProvider = SpecializationProvider();
  var storage = GetStorage();
  RxInt genderId = 0.obs;

  RxBool isFavorite = false.obs;
  RxBool isLoading = false.obs;
  void setFavorite(bool value) {
    isFavorite.value = value;
    isFavorite.value = isFavorite.value;
    update();
  }

  RxInt specializationTypeId = 0.obs;

  RxList specializationList = [].obs;

  var searchResultList = List<FilterData>.empty(growable: true).obs;

  RxList<PricesList> pricesList = <PricesList>[].obs;

  RxList<ExperienceData> experienceYearsList = <ExperienceData>[].obs;

  RxList<SpecializationModel> specializationDataList =
      <SpecializationModel>[].obs;

  List<FilterData> get getSearchResultList => searchResultList;

  RxInt specializationId = 0.obs;

  FilterData filterData = FilterData();

  SpecializationModel specializationData = SpecializationModel();

  set setSpecializationData(SpecializationModel value) {
    specializationData = value;
    update();
  }

  SpecializationModel get getSpecializationData => specializationData;

  set setDoctor(FilterData filter) {
    filterData = filter;
  }

  FilterData get getDoctor => filterData;

  set selectAboutDoctorOrRatings(bool value) {
    selectValue.value = value;
    update();
  }

  bool get selectAboutDoctorOrRatings => selectValue.value;

  // method to select the doctor clinic
  void selectDoctorClinics(int value) {
    log('this is the specializationId value: $value');
    specializationId.value = value;
    update();
  }

  void selectDoctorSpecialization(int value) {
    log('this is the value: $value');
    specializationTypeId.value = value;
    update();
  }

  void selectDoctorGender(int value) {
    genderId.value = value;
    log('this is the genderId value: $genderId');
    update();
  }

  RxInt consultationPriceId = 0.obs;
  RxInt experienceId = 0.obs;
  RxInt doctorGendersId = 0.obs;

  String? priceConsultation;
  RxString priceOne = '50-99'.tr.obs;

  void selectConsultationPrice(int value) {
    consultationPriceId.value = value;
    log('this is the consultationPriceId value: $consultationPriceId');
    update();
  }

  void selectExperience(int value) {
    experienceId.value = value;
    log('this is the experienceId value: $experienceId');
    update();
  }

  void selectSpecialization(int value) {
    specializationId.value = value;
    log('this is the clinicId value: $specializationId');
    update();
  }

  void selectText(String value) {
    priceOne.value = value;
    priceConsultation = priceOne.value;
    update();
  }

  RxString yearsOfExperience = '0-2'.tr.obs;

  void selectText2(String value) {
    yearsOfExperience.value = value;
    log('this is the yearsOfExperience value: $yearsOfExperience');
    update();
  }

  List<dynamic> genderList = [];

  // bool to switch when the user click on the button to choose personal consultation
  RxBool selectValue = false.obs;
  selectClinic(bool value) {
    selectValue.value = value;
    log('this is the value1: ${selectValue.value}');
    update();
  }

  // bool to switch when the user click on the button to choose family consultation
  RxBool selectValue2 = false.obs;
  selectClinic2(bool value) {
    selectValue2.value = value;
    log('this is the value1: ${selectValue2.value}');
    update();
  }

  // bool to switch when the user click on the button to choose doctor gender male
  RxBool gender1 = false.obs;
  selectGender1(bool value) {
    gender1.value = value;
    log('this is the gender1 value: ${gender1.value}');
    if (gender1.value == true) {
      gender2 = false.obs;
      selectDoctorGender(1);
    } else {
      selectDoctorGender(2);
    }
    update();
  }

  // bool to switch when the user click on the button to choose doctor gender male
  RxBool gender2 = false.obs;
  selectGender2(bool value) {
    gender2.value = value;
    log('this is the gender2 value: ${gender2.value}');
    if (gender1.value == true) {
      gender1 = false.obs;
      selectDoctorGender(1);
    } else {
      selectDoctorGender(2);
    }
    update();
  }

  RxBool unImportant = false.obs;
  selectUnImportant(bool value) {
    unImportant.value = value;
    update();
  }

  RxDouble ratingPercentage = 1.0.obs;

  selectRatingPercentage(double value) {
    ratingPercentage.value = value;
    log('this is the rating percentage: ${ratingPercentage.value}');
    update();
  }

  getPriceFilterList() async {
    try {
      var data = await pricesListProvider.getPricesList();
      pricesList.addAll(data);
      priceOne.value = pricesList.first.fromTo!;
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  getExperienceFilterList() async {
    try {
      var data = await exportListProvider.getExperienceList();
      experienceYearsList.addAll(data);
      yearsOfExperience.value = experienceYearsList.first.fromTo!;
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  getSpecializationList() async {
    try {
      var data = await specializationProvider.getSpecialization();
      specializationDataList.add(data);
      setSpecializationData = data;
      log('this is the specialization list: ${specializationDataList.length}');
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  Future submitFilter() async {
    await provider
        .filterDoctor(
      consultationPriceId.value,
      experienceId.value,
      genderId.value,
      ratingPercentage.value,
      specializationId.value,
    )
        .then((res) {
      if (res.code == 1 && res.data != null) {
        searchResultList.clear();
        for (FilterData e in res.data as List<FilterData>) {
          searchResultList.add(e);
          setDoctor = e;
        }
        log('this is the searchResultList: ${searchResultList.length}');
        Get.back();
        Get.toNamed(Routes.FILTER);
        EasyLoading.dismiss();
      } else if (res.data == null) {
        EasyLoading.dismiss();
        Get.toNamed(Routes.FILTER);
        Dialogs.errorDialog(Get.context!, "error_occured".tr);
      }
    }).catchError(
      (e) {
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, "error_occured".tr);
        log('this is the error: ${e.toString()}');
      },
    );
    update();
  }

  Future<void> checkSubmitFilter() async {
    EasyLoading.show(status: 'loading'.tr);
    await submitFilter();
    update();
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    consultationPriceController = TextEditingController();
    await getPriceFilterList();
    await getExperienceFilterList();
    await getSpecializationList();
  }

  @override
  void onClose() {
    super.onClose();
    consultationPriceController.dispose();
  }

  void increment() => count.value++;
}
