import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/Auth/providers/biometric_auth_provider.dart';

import '../../../../constants/dialogs.dart';
import '../../network/controllers/network_controller.dart';
import '../models/countries_model.dart';
import '../providers/countries_provider.dart';
import '../providers/login_provider.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  static LoginController get instance => Get.put(LoginController());
  // form key
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // get the sing_up provider here
  var loginProvider = LoginProvider.instance;

  var lang = Get.locale!.languageCode;

  // Biometric Auth class
  final BiometricAuth biometricAuth = BiometricAuth();

  RxString fprint = "".obs;

  FlutterSecureStorage secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  void checkBiometricEnabled() async {
    fprint.value = await secureStorage.read(key: 'biometric') ?? '';
    log('fingerprint is: $fprint');
    update();
  }

  // text field controllers
  RxBool isConnected = false.obs;

  // var networkController = NetworkController.instance;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // storage insialisations
  GetStorage storage = GetStorage();
  // text field values
  String phone = '';
  String password = '';
  final http.Client? client = http.Client();

  void biometricLogin() async {
    bool isBiometricEnabled = await biometricAuth.isBiometricAuthEnabled();
    if (isBiometricEnabled) {
      bool isAuth = await biometricAuth.isAuth('login_with_biometric'.tr);
      if (isAuth) {
        String phoneNumber = await secureStorage.read(key: 'phone') ?? '';
        String password = await secureStorage.read(key: 'password') ?? '';
        if (phoneNumber.isNotEmpty && password.isNotEmpty) {
          login(phoneNumber: phoneNumber, userPassword: password);
        }
      }
    }
  }

  Future<void> login(
      {required String phoneNumber, required String userPassword}) async {
    await loginProvider.login(
      phone: phoneNumber,
      password: userPassword,
      fcmToken: storage.read('fcmToken').toString(),
      lang: lang,
    );
  }

  void checkLogin() async {
    var isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    EasyLoading.show(status: 'loading'.tr);
    login(phoneNumber: phone, userPassword: password);
    update();
  }

  final countriesProvider = CountriesProvider();

  final isLoading = false.obs;
  // get the countries list here
  RxList<CountryData> countriesList = <CountryData>[].obs;

  Future<void> getCountries() async {
    isLoading.value = true;
    try {
      final data = await countriesProvider.getCountries();
      countriesList.clear();
      countriesList.addAll(data);
    } catch (e) {
      log(e.toString());
    }
    EasyLoading.dismiss();
    isLoading.value = false;
    update();
  }

  RxInt key = 966.obs;
  var isObscure = true.obs;
  var isObscureConfirm = true.obs;
  void selectCountry(int value) {
    countriesList[value].code = value.toString();
    key.value = int.parse(countriesList[value].code!);
    log('key is :${key.value}');
    update();
  }

  RxInt selectedIndex = 0.obs;
  void selectCountryIndex(int value) {
    selectedIndex.value = value;
    key.value = int.parse(countriesList[value].code!);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    checkBiometricEnabled();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    getCountries();
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
