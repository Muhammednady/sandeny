import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../home/providers/select_favorite_doctor_provider.dart';
import '../models/get_favorite_doctor_model.dart';
import '../providers/get_favorite_doctor_provider.dart';

class FavoriteDoctorController extends GetxController {
  static FavoriteDoctorController get instance =>
      FavoriteDoctorController.instance;
  RxBool isFavorite = true.obs;
  RxBool isLoading = false.obs;
  var provider = GetFavoriteDoctorProvider.instance;
  var favoriteDoctorProvider = SelectFavoriteDoctorProvider();
  void setFavorite(bool value) {
    isFavorite.value = value;
    isFavorite.value = isFavorite.value;
    update();
  }

  var getDoctorsList = List<FavoriteDoctorsData>.empty(growable: true).obs;

  List<FavoriteDoctorsData> get getFavoriteDoctorsList => getDoctorsList;

  FavoriteDoctorsData getData = FavoriteDoctorsData();

  set setDoctor(FavoriteDoctorsData favoriteDoctors) {
    getData = favoriteDoctors;
  }

  FavoriteDoctorsData get getDoctor => getData;

  Future<void> getBestDoctor() async {
    isLoading.value = true;
    await provider.getFavoriteDoctors().then((response) {
      if (response.code == 1 && response.data != null) {
        for (var element in response.data!) {
          getDoctorsList.add(element);
          isLoading.value = false;
          EasyLoading.dismiss();
        }
      } else {
        isLoading.value = false;
        log("error value is null ${response.data}");
        EasyLoading.dismiss();
      }
      EasyLoading.dismiss();
    }).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        EasyLoading.dismiss();
        // Dialogs.connectionErrorDialog(Get.context!);
      },
    );
    update();
  }

  // Future<void> selectFavoriteDoctor({required int? doctorId}) async {
  //   await favoriteDoctorProvider
  //       .selectFavoriteDoctor(doctorId: doctorId);
  // }

  @override
  void onInit() async {
    super.onInit();
    await getBestDoctor();
  }


}
