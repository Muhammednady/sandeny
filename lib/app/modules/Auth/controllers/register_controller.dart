import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../constants/dialogs.dart';
import '../../network/controllers/network_controller.dart';
import '../models/countries_model.dart';
import '../providers/countries_provider.dart';
import '../providers/sing_up_provider.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.put(RegisterController());
  // form key
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  RxBool isConnected = false.obs;

  var networkController = NetworkController.instance;

  var lang = Get.locale!.languageCode;

  // text field controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userTypeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // storage insialisations
  GetStorage storage = GetStorage();
  // text field values
  String fname = '';
  String lname = '';
  String igama = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  String email = '';
  RxInt userType = 0.obs;

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
      // Dialogs.errorDialog(Get.context!, 'Failed_to_load_laws'.tr);
    }
    EasyLoading.dismiss();
    isLoading.value = false;
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

  // get the sing_up provider here
  final registerProvider = SingUpProvider.instance;

  Future<void> register() async {
    await registerProvider.register(
      fname: fname,
      lname: lname,
      igama: igama,
      phone: phone,
      password: password,
      fcmToken: storage.read('fcmToken').toString(),
      lang: lang,
      email: email,
    );
  }

  void checkRegister() {
    var isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();
    EasyLoading.show(status: 'loading'.tr);
    register();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    identityNumberController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userTypeController = TextEditingController();
    emailController = TextEditingController();
    getCountries();
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    identityNumberController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    userTypeController.dispose();
  }

  RxInt key = 966.obs;
  var isObscure = true.obs;
  var isObscureConfirm = true.obs;
  void selectCountry(int value) {
    // key.value = value;
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
}
