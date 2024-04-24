import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sandeny/app/modules/profile/controllers/profile_controller.dart';
import '../../../../../constants/dialogs.dart';
import '../../Auth/models/countries_model.dart';
import '../../Auth/providers/countries_provider.dart';
import '../../network/controllers/network_controller.dart';
import '../providers/edit_profile_provider.dart';

class EditProfileController extends GetxController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var birthDateController = TextEditingController();
  var identityNumberController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var profileController = ProfileController.instance;
  var editProfileProvider = EditProfileProvider.instance;
  var networkController = NetworkController.instance;

  String date = DateFormat("yyyy/MM/dd").format(DateTime.now());
  String? selectedValue;

  // for drop down social statusType
  String fname = '';
  String lname = '';
  String igama = '';
  String phone = '';
  String birthDate = '';
  RxString maritalStatus = 'married'.tr.obs;
  RxString statusType = 'married'.tr.obs;
  String gender = 'male';
  RxString imagePath = ''.obs;
  String email = '';
  int genderIndex = 1;

  List<String> listOfStatus = [
    'married'.tr,
    'single'.tr,
    'divorced'.tr,
    'widow'.tr,
  ].obs;

  void selectStatus(String value) {
    statusType.value = value;
    update();
  }

  File image = File('');

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

  final countriesProvider = CountriesProvider();

  final isLoading = false.obs;
  // get the countries list here
  RxList<CountryData> countriesList = <CountryData>[].obs;

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

  Future updatePatientProfile() async {
    return await editProfileProvider.editProfile(
      fname: fname == ''
          ? fname = profileController.profileList[0].data!.firstName!
          : fname,
      lname: lname == ''
          ? lname = profileController.profileList[0].data!.lastName!
          : lname,
      igama: igama == ''
          ? igama = profileController.profileList[0].data!.iqamaNumber!
          : igama,
      phone: phone == ''
          ? phone = profileController.profileList[0].data!.phone!
          : phone,
      birthDate: birthDate == ''
          ? birthDate = profileController.profileList[0].data!.dOB!
          : birthDate,
      // birthDate: birthDate,
      gender: genderIndex,
      maritalStatus: maritalStatus.value,
      // ignore: unrelated_type_equality_checks
      image: image == ''
          ? image = profileController.profileList[0].profileImage
          : image,
      email: email == ''
          ? email = profileController.profileList[0].data!.email!
          : email,
    );
  }

  void checkUpdateProfile() {
      EasyLoading.show(status: 'loading'.tr);
      try {
        updatePatientProfile();
      } catch (e) {
        EasyLoading.dismiss();
        log('$e');
      }
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
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
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

  // logic to change the sex according to the select value
  RxBool isMale = true.obs;
  RxBool isFemale = false.obs;
  void changeSex(bool value) {
    if (value) {
      isMale.value = true;
      isFemale.value = false;
    } else {
      isMale.value = false;
      isFemale.value = true;
    }
    update();
  }

  RxInt key = 966.obs;
  var isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    birthDateController = TextEditingController();
    identityNumberController = TextEditingController();
    emailController = TextEditingController();
    getCountries();
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    birthDateController.dispose();
    identityNumberController.dispose();
  }
}
