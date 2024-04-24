import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/home/models/best_doctors_model.dart';
import 'package:sandeny/app/modules/more/providers/add_ticket_provider.dart';
import 'package:sandeny/app/modules/more/providers/delete_account_provider.dart';

import '../../../../constants/dialogs.dart';
import '../../../../constants/images_manager.dart';
import '../../Auth/providers/biometric_auth_provider.dart';
import '../providers/logout_provider.dart';

class MoreController extends GetxController {
  static MoreController get instance => Get.put(MoreController());
  var storage = GetStorage();

  List<BestDoctorData> favoriteDoctor = [];
  List<BestDoctorData> get favoriteDoctorList => favoriteDoctor;
  final provider = LogoutProvider();
  final deleteAccountProvider = DeleteAccountProvider();
  final ticketProvider = AddTicketProvider();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  final secureStorage = const FlutterSecureStorage(
     aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // biometric auth class
  final BiometricAuth biometricAuth = BiometricAuth();

  //add favorite doctor
  void addFavoriteDoctor(BestDoctorData doctor) {
    favoriteDoctor.add(doctor);
    update();
  }

  //remove favorite doctor
  void removeFavoriteDoctor(BestDoctorData doctor) {
    favoriteDoctor.remove(doctor);
    update();
  }

  // list of the icons used in the more screen
  List<String> icons = [
    Images.personIcon,
    Images.settingIcon,
    Images.heartIcon,
    Images.callcenterIcon,
    Images.fileIcon,
    Images.starIcon,
  ];

  // list of the titles used in the more screen
  List<String> titles = [
    'my_informations'.tr,
    'account_settings'.tr,
    'favorite_doctors'.tr,
    'connect_with_callcenter'.tr,
    'conditions_and_terms'.tr,
    'rate_app'.tr,
  ];
  RxBool isLoading = false.obs;

  String address = '';
  String note = '';
  FilePickerResult? result;
  RxString fileName = ''.obs;
  List<PlatformFile> pickedFiles = [];
  List<File> filesToDisplay = [];
  String problem = '';

  void selectFiles() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      pickedFiles = result!.files;
      filesToDisplay = pickedFiles.map((file) => File(file.path!)).toList();
      log('filesToDisplay: ${filesToDisplay.length}');
    }
    update();
  }

  RxString ticketType = 'questions'.tr.obs;

  void changeTicketType(String value) {
    ticketType.value = value;
    update();
  }

  List<String> ticketTypeList = [
    'questions'.tr,
    'complaint'.tr,
  ];

  RxString importanceType = 'high'.tr.obs;

  void changeImportanceType(String value) {
    importanceType.value = value;
    update();
  }

  List<String> importanceTypeList = [
    'high'.tr,
    'medium'.tr,
    'low'.tr,
  ];

  RxBool biometricSwitch = true.obs;

  String? fPrint = "";

  void enableBiometricAuth(bool value) async {
    if (value) {
      bool isBiometricEnabled = await biometricAuth.isBiometricAuthEnabled();
      if (isBiometricEnabled) {
        await secureStorage.write(key: 'biometric', value: 'checked');

        Dialogs.successDialog(Get.context!, 'biometric_auth_enabled'.tr);
      }
    } else {
      await secureStorage.delete(key: 'biometric');
      Dialogs.errorDialog(Get.context!, 'biometric_auth_disabled'.tr);
    }
    biometricSwitch.value = value;
    update();
  }

  Future<void> submitLogot() async {
    isLoading.value = true;
    storage.remove('token');
    await provider.getLogout();
    EasyLoading.show(status: 'loading'.tr);
    update();
  }

  Future<void> deleteAccount() async {
    isLoading.value = true;
    await deleteAccountProvider.deleteAccount();
    EasyLoading.show(status: 'loading'.tr);
    update();
  }

  Future<void> addTicket() async {
    await AddTicketProvider.instance.addTicket(
      address: address,
      type: ticketType.value,
      importance: importanceType.value,
      note: note,
      files: filesToDisplay,
    );
  }

  void checkAddTicket() {
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    addTicket();
    EasyLoading.show(status: 'loading'.tr);
    update();
  }

  @override
  void onInit() async {
    addressController = TextEditingController();
    noteController = TextEditingController();
    fPrint = await secureStorage.read(key: 'biometric') ?? '';

    if (fPrint == 'checked') {
      biometricSwitch.value = true;
    } else {
      biometricSwitch.value = false;
    }
    super.onInit();
  }
}
