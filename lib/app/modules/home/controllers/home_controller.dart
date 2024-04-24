import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:sandeny/app/modules/home/models/best_doctors_model.dart';
import 'package:sandeny/app/modules/home/models/specialization_model.dart';
import 'package:sandeny/app/modules/home/providers/best_doctors.dart';
import 'package:sandeny/app/modules/personal-clinc/controllers/personal_clinc_controller.dart';
import 'package:sandeny/constants/images_manager.dart';

import '../../network/controllers/network_controller.dart';
import '../../programs/controllers/programs_controller.dart';
import '../../scales/controllers/scales_controller.dart';
import '../models/get_doctors_model.dart';
import '../providers/select_favorite_doctor_provider.dart';
import '../providers/specializations_provider.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  RxBool isFavorite = false.obs;

  GlobalKey<ScaffoldState> globalKeyOne = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> globalKeyTwo = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> globalKeyThree = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> globalKeyFour = GlobalKey<ScaffoldState>();

  final networkController = NetworkController.instance;

  final isFirstRun = IsFirstRun();

  var specializationProvider = SpecializationsProvider();

  RxList<SpecificationData> specializationList = <SpecificationData>[].obs;

  var scaleController = ScalesController();

  var programController = ProgramsController();

  var storage = GetStorage();

  List<String> imgList = [Images.homeImage];

  void setFavorite(bool value) {
    isFavorite.value = value;
    personalController.isFavorite.value = isFavorite.value;
    update();
  }

  RxInt pageIndex = 0.obs;
  set setPage(int setPage) {
    pageIndex.value = setPage;
  }

  var personalController = PersonalClincController();
  var bestDoctorProvider = BestDoctorsProvider();
  var favoriteDoctorProvider = SelectFavoriteDoctorProvider();
  RxList<BestDoctorData> bestDoctorsList = <BestDoctorData>[].obs;
  BestDoctorData myDoctor = BestDoctorData();
  set setDoctor(BestDoctorData doctor) {
    myDoctor = doctor;
  }

  BestDoctorData get getDoctor => myDoctor;
  List<SpecificationData> doctoSpec = <SpecificationData>[].obs;
  set setSpecificationData(List<SpecificationData> data) {
    doctoSpec = data;
  }

  List<SpecificationData> get getSpecificationData => doctoSpec;
  List<ResultData> myData = <ResultData>[].obs;
  set setDoctorData(List<ResultData> data) {
    myData = data;
  }

  List<ResultData> get getDoctorData => myData;

  RxBool isLoading = false.obs;

  getSpecializations() async {
    isLoading.value = false;
    specializationList.clear();
    var data = await specializationProvider.getSpecialization();
    specializationList.addAll(data);
    setSpecificationData = data;
    log('this is the specialization id ${getSpecificationData[0].id}');
    isLoading.value = true;
    update();
  }

  getDoctorSpecificationId({required int? id}) async {
    log('this is the id: $id');
    isLoading.value = true;
    var data = await specializationProvider.getDoctorsBySPId(id!);
    setDoctorData = data;
    log('this is the doctor data: ${getDoctorData.length}');
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getSpecializations();
    scaleController.getScales();
    programController.getPrograms();
  }
}
