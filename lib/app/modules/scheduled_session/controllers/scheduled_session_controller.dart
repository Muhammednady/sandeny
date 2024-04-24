import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sandeny/app/modules/filter/models/experience_years_model.dart';
import 'package:sandeny/app/modules/filter/models/price_list_model.dart';
import 'package:sandeny/app/modules/filter/providers/experince_years_provider.dart';
import 'package:sandeny/app/modules/filter/providers/price_list_provider.dart';

import '../../filter/controllers/filter_controller.dart';
import '../../filter/models/specialization_model.dart';
import '../../filter/providers/spectialization_provider.dart';
import '../models/get_available_scheduled_session_doctors.dart';
import '../models/get_scheduled_session_model.dart';
import '../models/save_scheduled_session_model.dart';
import '../providers/get_available_scheduled_session_doctors_provider.dart';
import '../providers/get_scheduled_session_provider.dart';
import '../providers/save_scheduled_session_provider.dart';
import '../views/get_scheduled_session_doctor_view.dart';

class ScheduledSessionController extends GetxController {
  static ScheduledSessionController get instance =>
      ScheduledSessionController.instance;

  var storage = GetStorage();

  var scheduledSessionProvider = GetScheduledSessionProvider();

  RxBool isLoading = false.obs;

  RxInt sessionId = 0.obs;

  final getASDProvider = GetAvailableSSDoctorProvider();

  var filterController = Get.put(FilterController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxString fileName = ''.obs;

  final sendScheduledSP = SendScheduledSessionProvider();

  final pricesListProvider = PricesListProvider();

  final exportListProvider = ExperienceYearsProvider();

  final specializationProvider = SpecializationProvider();

  String? priceConsultation;

  RxString priceOne = '50-99'.tr.obs;

  String? yearsOfExperience = '0-2'.tr;

  SaveScheduledSessionModel scheduledData = SaveScheduledSessionModel();

  set setSD(SaveScheduledSessionModel data) {
    scheduledData = data;
    update();
  }

  SaveScheduledSessionModel get getSD => scheduledData;

  SpecializationModel specializationData = SpecializationModel();

  set setSpecializationData(SpecializationModel value) {
    specializationData = value;
    update();
  }

  SpecializationModel get getSpecializationData => specializationData;

  FilePickerResult? result;
  PlatformFile? pickedFile;
  File? fileToDisplay;

  String reason = '';
  String problem = '';

  RxInt specializationTypeId = 0.obs;
  RxInt consultationPriceId = 0.obs;
  RxInt experienceId = 0.obs;
  RxInt doctorGendersId = 0.obs;
  RxInt languageId = 0.obs;
  RxInt genderId = 0.obs;
  RxInt doctorId = 0.obs;

  void selectDoctorGender(int value) {
    genderId.value = value;
    log('this is the genderId value: $genderId');
    update();
  }

  List<ScheduledSessionDoctors> myData = <ScheduledSessionDoctors>[].obs;

  set setDoctorData(List<ScheduledSessionDoctors> data) {
    myData = data;
  }

  List<ScheduledSessionDoctors> get getDoctorData => myData;

  RxList<PricesList> pricesList = <PricesList>[].obs;

  RxList<ExperienceData> experienceYearsList = <ExperienceData>[].obs;

  RxList<SpecializationModel> specializationDataList =
      <SpecializationModel>[].obs;

  void selectDoctorSpecialization(int value) {
    log('this is the value: $value');
    specializationTypeId.value = value;
    update();
  }

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

  void selectDoctorLanguage(int value) {
    log('this is the language id: $value');
    languageId.value = value;
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

  GetScheduledSession consultationData = GetScheduledSession();

  RxList<GetScheduledSession> sSList = <GetScheduledSession>[].obs;

  void selectText(String value) {
    priceOne.value = value;
    priceConsultation = priceOne.value;
    update();
  }

  set setData(GetScheduledSession data) {
    consultationData = data;
  }

  GetScheduledSession get getData => consultationData;

  void selectText2(String value) {
    yearsOfExperience = value;
    log('this is the yearsOfExperience value: $yearsOfExperience');
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

  List<String> listOfYearsOfExperience = [
    '0-2'.tr,
    '3-5'.tr,
    '6-10'.tr,
    'more_than_10'.tr,
  ].obs;

  List<dynamic> genderList = [];

  // bool to switch when the user click on the button to choose personal consultation
  RxBool selectValue = false.obs;

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

  RxInt fellingIndex = 0.obs;
  selectFellingIndex(int value) {
    fellingIndex.value = value;
    update();
  }

  getScheduledSession() async {
    isLoading.value = false;
    sSList.clear();
    var data = await scheduledSessionProvider.getScheduledSession();
    setData = data;
    sSList.add(data);
    log('this is the data: $data');
    isLoading.value = true;
    update();
  }

  getAvailableDoctors() async {
    isLoading.value = false;
    try {
      EasyLoading.show(status: 'loading'.tr);
      var data = await getASDProvider.getAvailabeDoctors(
        departmentId: filterController.specializationTypeId.value,
        specializationTypeId: specializationTypeId.value,
        priceRange: filterController.consultationPriceId.value,
        gender: genderId.value,
        yearsOfExperiences: filterController.experienceId.value,
        languageId: languageId.value,
      );
      EasyLoading.dismiss();
      setDoctorData = data;
      isLoading.value = true;
      Get.to(const GetAvailableSSDoctorView());
      update();
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
      isLoading.value = true;
    }
  }

  getPriceFilterList() async {
    try {
      var data = await pricesListProvider.getPricesList();
      pricesList.addAll(data);
      priceOne.value = pricesList.first.fromTo!;
      log('this is the prices list: ${pricesList.length}');
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  getExperienceFilterList() async {
    try {
      var data = await exportListProvider.getExperienceList();
      experienceYearsList.addAll(data);
      yearsOfExperience = experienceYearsList.first.fromTo!;
      log('this is the experience list: ${experienceYearsList.length}');
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  Future<void> requestPermission() async {
    final PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      selectFile();
    } else if (status.isDenied) {
      await showDialog(
        context: Get.overlayContext!,
        builder: (_) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text('Please grant permission to select a file.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(Get.context!),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else if (status.isPermanentlyDenied) {
      await showDialog(
        context: Get.overlayContext!,
        builder: (_) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
              'Please grant permission to select a file. Go to app settings > permissions and enable storage permission.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(Get.context!),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => openAppSettings(),
              child: const Text('Settings'),
            ),
          ],
        ),
      );
    }
  }

  void selectFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      fileName.value = result!.files.single.name;
      pickedFile = result!.files.first;
      fileToDisplay = File(pickedFile!.path!);
      log('fileToDisplay: $fileToDisplay');
    }
  }

  @override
  void onInit() async{
    await getScheduledSession();
    await getPriceFilterList();
    await getExperienceFilterList();
    await getSpecializationList();
    super.onInit();
  }


}
