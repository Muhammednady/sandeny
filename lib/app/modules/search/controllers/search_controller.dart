import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/routes/app_pages.dart';

import '../../../../constants/dialogs.dart';
import '../../doctors/providers/filter_doctor_provider.dart';
import '../../home/providers/select_favorite_doctor_provider.dart';
import '../../network/controllers/network_controller.dart';
import '../models/search_doctors_model.dart';
import '../providers/search_doctors_provider.dart';

class SearchDoctorController extends GetxController {
  TextEditingController consultationPriceController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  var networkController = NetworkController.instance;
  var provider = FilterModelProvider();
  var favoriteDoctorProvider = SelectFavoriteDoctorProvider();
  var searchProvider = SearchDoctorsProvider();
  var storage = GetStorage();

  RxBool isFavorite = false.obs;
  RxBool isLoading = false.obs;

  void setFavorite(bool value) {
    isFavorite.value = value;
    isFavorite.value = isFavorite.value;
    update();
  }

  var searchResultList = List<SearchDoctorData>.empty(growable: true).obs;

  List<SearchDoctorData> get getSearchResultList => searchResultList;

  SearchDoctorData searchData = SearchDoctorData();

  set setDoctor(SearchDoctorData search) {
    searchData = search;
  }

  SearchDoctorData get getDoctor => searchData;

  List<dynamic> clinicsList = [];

  RxBool selectValue = false.obs;

  set selectAboutDoctorOrRatings(bool value) {
    selectValue.value = value;
    update();
  }

  bool get selectAboutDoctorOrRatings => selectValue.value;

  // Future<void> selectFavoriteDoctor({required int? doctorId}) async {
  //   await favoriteDoctorProvider
  //       .selectFavoriteDoctor(doctorId: doctorId).timeout(
  //     const Duration(seconds: 1),
  //     onTimeout: () {
  //       EasyLoading.dismiss();
  //       isLoading.value = false;
  //       update();
  //       return null;
  //     },
  //   );
  // }

  Future<void> getSearchDoctor() async {
    isLoading.value = true;
    await searchProvider
        .getDoctor(
      searchController.text,
    )
        .then((response) {
      if (response.code == 1 && response.data != null) {
        searchResultList.clear();
        for (var element in response.data!) {
          searchResultList.add(element);
        }
        isLoading.value = false;
        EasyLoading.dismiss();
        Get.toNamed(Routes.SEARCH);
      } else {
        isLoading.value = false;
        EasyLoading.dismiss();
        Dialogs.errorDialog(Get.context!, "error_occured".tr);
      }
      EasyLoading.dismiss();
    }).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        EasyLoading.dismiss();
        isLoading.value = false;
        update();
        return null;
      },
    );
    update();
  }

  searchDoctor(String query) {
    final suggestions = searchResultList
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    searchResultList.clear();
    searchResultList.addAll(suggestions);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    consultationPriceController = TextEditingController();
    searchController = TextEditingController();
  }


  @override
  void onClose() {
    super.onClose();
    consultationPriceController.dispose();
    searchController.dispose();
  }
}
