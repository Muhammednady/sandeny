import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/colors_manager.dart';
import '../../../../constants/dialogs.dart';
import '../../../routes/app_pages.dart';
import '../../Auth/models/countries_model.dart';
import '../../Auth/providers/countries_provider.dart';
import '../../network/controllers/network_controller.dart';
import '../provider/complete_profile_provider.dart';

class CompleteAccountInformationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var networkController = NetworkController.instance;

  static CompleteAccountInformationController get instance =>
      Get.put(CompleteAccountInformationController());

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController familyMemberPhoneNumberController =
      TextEditingController();
  TextEditingController otherPhoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  File image = File('');

  var provider = CompleteProfileProvider();

  RxBool isMale = true.obs;
  RxBool isFemale = false.obs;
  String fname = '';
  String lname = '';
  String weight = '';
  String height = '';
  String birthDate = '';
  String email = '';
  String gender = 'male';
  int genderIndex = 1;
  RxString maritalStatus = 'married'.obs;
  String familyPhoneNumber = '';
  String otherPhoneNumber = '';
  RxString imagePath = ''.obs;

  List<String> listOfStatus = [
    'married',
    'single',
    'divorced',
    'widow',
  ].obs;

  void selectStatus(String value) {
    maritalStatus.value = value;
    update();
  }

  // logic for select status and make the divider between the items
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
    for (var i = 0; i < (listOfStatus.length * 2) - 1; i++) {
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

  void getImageFromGallery(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath.value = pickedFile.path;
      update();
      Get.back();
    }
    update();
  }

  void getImageFromCamera(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath.value = pickedFile.path;
      update();
      Get.back();
    }
    update();
  }

  void changeGender(String gender) {
    if (gender == "male") {
      genderIndex = 1;
    } else {
      genderIndex = 2;
    }
    update();
  }

  RxBool addOtherNumber = false.obs;

  void checkComplatePatientAccount() async {
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    Get.toNamed(Routes.COMPLETE_ACCOUNT_INFORMATION2);
    update();
  }

  Future<void> completeProfile() async {
    try {
      await provider.completeProfile(
        familyPhone: familyPhoneNumber,
        birthDate: birthDate,
        gender: genderIndex,
        maritalStatus: maritalStatus.value,
        otherPhone: otherPhoneNumber,
        // email: email,
        height: height,
        weight: weight,
      );
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
    }
  }

  checkSubmit() async {
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    EasyLoading.show(status: 'loading'.tr);
    completeProfile();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    weightController = TextEditingController();
    heightController = TextEditingController();
    birthDateController = TextEditingController();
    familyMemberPhoneNumberController = TextEditingController();
    otherPhoneNumberController = TextEditingController();
    emailController = TextEditingController();
    getCountries();
  }
}
