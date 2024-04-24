import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/filter/models/price_list_model.dart';
import 'package:sandeny/app/modules/scheduled_session/controllers/scheduled_session_controller.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';
import 'package:sandeny/constants/validations.dart';
import 'package:sandeny/widgets/select_country_code.dart';

import '../app/modules/changePassword/controllers/change_password_controller.dart';
import '../app/modules/filter/controllers/filter_controller.dart';
import '../app/modules/filter/models/experience_years_model.dart';
import '../app/modules/more/controllers/more_controller.dart';
import '../constants/fonts_manager.dart';
import '../constants/images_manager.dart';
import '../constants/values_manager.dart';

// phone number text form field
Widget phoneNumberFormField(
  BuildContext context,
  dynamic controller,
  Color color,
  String hinText,
  Color hintTextColor,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: controller.phoneNumberController,
        onSaved: (value) {
          controller.phone = '+${controller.key}${value!}';
        },
        validator: (value) {
          return Validations().validatePhoneNumber(value);
        },
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hintTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          suffixIcon: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    selectCountryCode(context, controller);
                  },
                  child: Obx(
                    () => Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: ColorsManager.blackColor,
                          size: 15,
                        ),
                        Text(
                          '${controller.key.value}+' ?? '966+',
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: FontSizeManager.s16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget editPhoneNumberFormField(
  BuildContext context,
  dynamic controller,
  Color color,
  String hinText,
  Color hintTextColor,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: controller.phoneNumberController,
        onChanged: (value) {
          controller.phone = '+${controller.key}$value';
        },
        validator: (value) {
          return Validations().validatePhoneNumber(value);
        },
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hintTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          suffixIcon: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    selectCountryCode(context, controller);
                  },
                  child: Obx(
                    () => Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: ColorsManager.blackColor,
                          size: 15,
                        ),
                        Text(
                          '${controller.key.value}+' ?? '966+',
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: FontSizeManager.s16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// family member phone number text form field
Widget familyMemberPhoneNumberFormField(
  BuildContext context,
  dynamic controller,
  Color color,
  String hinText,
  Color hintTextColor,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: controller.familyMemberPhoneNumberController,
        onSaved: (value) {
          controller.familyPhoneNumber = '+${controller.key}${value!}';
        },
        validator: (value) {
          return Validations().validatePhoneNumber(value);
        },
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hintTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          suffixIcon: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    selectCountryCode(context, controller);
                  },
                  child: Obx(
                    () => Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: ColorsManager.blackColor,
                          size: 15,
                        ),
                        Text(
                          '${controller.key.value}+' ?? '966+',
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: FontSizeManager.s16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// other family member phone number text form field
Widget otherPhoneNumberFormField(
  BuildContext context,
  dynamic controller,
  Color color,
  String hinText,
  Color hintTextColor,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: controller.otherPhoneNumberController,
        onSaved: (value) {
          controller.otherPhoneNumber = '+${controller.key}${value!}';
          var storage = GetStorage();
          storage.write('otherPhone', '${controller.otherPhoneNumber}');
        },
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hintTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          suffixIcon: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    selectCountryCode(context, controller);
                  },
                  child: Obx(
                    () => Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: ColorsManager.blackColor,
                          size: 15,
                        ),
                        Text(
                          '${controller.key.value}+' ?? '+966',
                          style: getRegularStyle(
                            color: ColorsManager.blackColor,
                            fontSize: FontSizeManager.s16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// password text form field
Widget passwordFormField(BuildContext context, dynamic controller, Color color,
    String hinText, Color hintTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Obx(
      (() => SizedBox(
            width: 315,
            child: TextFormField(
              obscureText: controller.isObscure.value == true ? true : false,
              controller: controller.passwordController,
              validator: (value) {
                return Validations().validatePassword(value!);
              },
              onSaved: (String? value) {
                controller.password = value!;
              },
              decoration: InputDecoration(
                hintText: hinText,
                hintStyle: getRegularStyle(
                  color: hintTextColor,
                  fontSize: FontSizeManager.s14,
                ),
                fillColor: color,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isObscure.value = !controller.isObscure.value;
                    },
                    child: Icon(
                      controller.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          )),
    ),
  );
}

// old password form field
Widget oldPasswordFormField(
    BuildContext context, Color color, String hinText, Color hintTextColor) {
  var controller = Get.put(ChangePasswordController());
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Obx(
      (() => SizedBox(
            width: 315,
            child: TextFormField(
              obscureText: controller.isObscure.value == true ? true : false,
              controller: controller.oldPasswordController,
              validator: (value) {
                return Validations().validatePassword(value!);
              },
              onSaved: (String? value) {
                controller.oldPassword = value!;
              },
              decoration: InputDecoration(
                hintText: hinText,
                hintStyle: getRegularStyle(
                  color: hintTextColor,
                  fontSize: FontSizeManager.s14,
                ),
                fillColor: color,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isObscure.value = !controller.isObscure.value;
                    },
                    child: Icon(
                      controller.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          )),
    ),
  );
}

// new password form field
Widget newPasswordFormField(BuildContext context, dynamic controller,
    Color color, String hinText, Color hintTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Obx(
      (() => SizedBox(
            width: 315,
            child: TextFormField(
              obscureText: controller.isObscureNew.value == true ? true : false,
              controller: controller.passwordController,
              validator: (value) {
                return Validations().validatePassword(value!);
              },
              onSaved: (String? value) {
                controller.newPassword = value!;
              },
              decoration: InputDecoration(
                hintText: hinText,
                hintStyle: getRegularStyle(
                  color: hintTextColor,
                  fontSize: FontSizeManager.s14,
                ),
                fillColor: color,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isObscureNew.value =
                          !controller.isObscureNew.value;
                    },
                    child: Icon(
                      controller.isObscureNew.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          )),
    ),
  );
}

// confirm new password form field
Widget confirmNewPasswordFormField(BuildContext context, dynamic controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Obx(
      (() => SizedBox(
            width: 315,
            child: TextFormField(
              obscureText:
                  controller.isObscureConfirm.value == true ? true : false,
              controller: controller.confirmPasswordController,
              validator: (value) {
                return Validations().validateConfirmPassword(
                    value!, controller.passwordController.text);
              },
              onSaved: (String? value) {
                controller.confirmPassword = value!;
              },
              decoration: InputDecoration(
                hintText: 'confirm_password'.tr,
                fillColor: ColorsManager.greyColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isObscureConfirm.value =
                          !controller.isObscureConfirm.value;
                    },
                    child: Icon(
                      controller.isObscureConfirm.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          )),
    ),
  );
}

// first name form field
Widget firstNameFormField(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 40),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: controller.firstNameController,
        onSaved: (String? value) {
          controller.fname = value!;
        },
        validator: (value) {
          return Validations().validateFirstName(value!);
        },
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

Widget editFirstNameFormField(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 40),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: controller.firstNameController,
        onChanged: (value) {
          controller.fname = value;
        },
        validator: (value) {
          return Validations().validateFirstName(value!);
        },
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

// last name form field
Widget lastNameFormField(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 40),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: controller.lastNameController,
        onSaved: (String? value) {
          controller.lname = value!;
        },
        validator: (value) {
          return Validations().validateLastName(value!);
        },
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

Widget editLastNameFormField(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 40),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: controller.lastNameController,
        onChanged: (String? value) {
          controller.lname = value!;
        },
        validator: (value) {
          return Validations().validateLastName(value!);
        },
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

// identity text form field
Widget identityFormField(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller.identityNumberController,
        validator: (value) {
          return Validations().validateIdentityNumber(value!);
        },
        onSaved: (String? value) {
          controller.igama = value!;
        },
        decoration: InputDecoration(
          hintText: hinText,
          fillColor: color,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s14,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

Widget editIdentityFormField(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller.identityNumberController,
        validator: (value) {
          return Validations().validateIdentityNumber(value!);
        },
        onChanged: (String? value) {
          controller.igama = value!;
        },
        decoration: InputDecoration(
          hintText: hinText,
          fillColor: color,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s14,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

// confirm password widget
Widget confirmPasswordFormField(BuildContext context, dynamic controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Obx(
      (() => SizedBox(
            width: 315,
            child: TextFormField(
              obscureText:
                  controller.isObscureConfirm.value == true ? true : false,
              controller: controller.confirmPasswordController,
              validator: (value) {
                return Validations().validateConfirmPassword(
                    value!, controller.passwordController.text);
              },
              onSaved: (String? value) {
                controller.confirmPassword = value!;
              },
              decoration: InputDecoration(
                hintText: 'confirm_password'.tr,
                fillColor: ColorsManager.greyColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isObscureConfirm.value =
                          !controller.isObscureConfirm.value;
                    },
                    child: Icon(
                      controller.isObscureConfirm.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          )),
    ),
  );
}

consultationPriceDropDown(FilterController controller) {
  return DropdownButtonFormField<PricesList>(
    items: controller.pricesList.map((price) {
      return DropdownMenuItem<PricesList>(
        value: price,
        child: Text(
          '${price.fromTo!}  ${'SAR'.tr}',
          style: getRegularStyle(
              color: ColorsManager.fontColor, fontSize: FontSizeManager.s12),
        ),
      );
    }).toList(),
    value:
        controller.pricesList.isNotEmpty ? controller.pricesList.first : null,
    onChanged: (selectedItem) {
      controller.selectText(selectedItem!.fromTo!);
      controller.selectConsultationPrice(selectedItem.id!);
    },
    decoration: InputDecoration(
      // hintText: controller.pricesList.first.fromTo!,
      hintText: controller.priceOne.value,
      hintStyle: getRegularStyle(
        color: ColorsManager.lightGreyColor,
        fontSize: FontSizeManager.s12,
      ),
      fillColor: ColorsManager.lightGreyColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

consultationPriceDropDownBilateral(ScheduledSessionController controller) {
  return DropdownButtonFormField<PricesList>(
    items: controller.pricesList.map((price) {
      return DropdownMenuItem<PricesList>(
        value: price,
        child: Text(
          '${price.fromTo!}  ${'SAR'.tr}',
          style: getRegularStyle(
              color: ColorsManager.fontColor, fontSize: FontSizeManager.s12),
        ),
      );
    }).toList(),
    value:
        controller.pricesList.isNotEmpty ? controller.pricesList.first : null,
    onChanged: (selectedItem) {
      controller.selectText(selectedItem!.fromTo!);
      controller.selectConsultationPrice(selectedItem.id!);
    },
    decoration: InputDecoration(
      // hintText: controller.pricesList.first.fromTo!,
      hintText: controller.priceOne.value,
      hintStyle: getRegularStyle(
        color: ColorsManager.lightGreyColor,
        fontSize: FontSizeManager.s12,
      ),
      fillColor: ColorsManager.lightGreyColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

//years of experience text form field
yearsOfExperienceDropDown(FilterController controller) {
  return DropdownButtonFormField<ExperienceData>(
    items: controller.experienceYearsList.map((experience) {
      return DropdownMenuItem<ExperienceData>(
        value: experience,
        child: Text(
          '${experience.fromTo!}  ${'years'.tr}',
          style: getRegularStyle(
              color: ColorsManager.fontColor, fontSize: FontSizeManager.s12),
        ),
      );
    }).toList(),
    value: controller.experienceYearsList.isNotEmpty
        ? controller.experienceYearsList.first
        : null,
    onChanged: (selectedItem) {
      controller.selectText(selectedItem!.fromTo!);
      controller.selectExperience(selectedItem.id!);
    },
    decoration: InputDecoration(
      // hintText: controller.experienceYearsList.first.fromTo!,
      hintText: controller.yearsOfExperience.value,
      hintStyle: getRegularStyle(
        color: ColorsManager.lightGreyColor,
        fontSize: FontSizeManager.s12,
      ),
      fillColor: ColorsManager.lightGreyColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

//years of experience text form field
yearsOfExperienceDropDownBilateral(ScheduledSessionController controller) {
  return DropdownButtonFormField<ExperienceData>(
    items: controller.experienceYearsList.map((experience) {
      return DropdownMenuItem<ExperienceData>(
        value: experience,
        child: Text(
          '${experience.fromTo!}  ${'years'.tr}',
          style: getRegularStyle(
              color: ColorsManager.fontColor, fontSize: FontSizeManager.s12),
        ),
      );
    }).toList(),
    value: controller.experienceYearsList.isNotEmpty
        ? controller.experienceYearsList.first
        : null,
    onChanged: (selectedItem) {
      controller.selectText(selectedItem!.fromTo!);
      controller.selectExperience(selectedItem.id!);
    },
    decoration: InputDecoration(
      hintText: controller.yearsOfExperience,
      hintStyle: getRegularStyle(
        color: ColorsManager.lightGreyColor,
        fontSize: FontSizeManager.s12,
      ),
      fillColor: ColorsManager.lightGreyColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

// Birth Date Widget
Widget birthDateWidget(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        onTap: () async {
          var date = await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: ColorsManager.primaryColor,
                  ),
                  dialogBackgroundColor: ColorsManager.greyColor,
                ),
                child: child!,
              );
            },
          );
          controller.birthDateController.text =
              date.toString().substring(0, 10);
        },
        validator: (value) {
          return Validations()
              .textValidation(value!, controller.birthDateController.text);
        },
        onSaved: (value) {
          controller.birthDateController.text = value;
          if (value != null) {
            var storage = GetStorage();
            log('value: $value');
            controller.birthDate = value;
            storage.write('birthDate', value);
          }
        },
        controller: controller.birthDateController,
        readOnly: true,
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            onPressed: () async {
              var date = await showDatePicker(
                context: Get.context!,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: ColorsManager.primaryColor,
                      ),
                      dialogBackgroundColor: ColorsManager.greyColor,
                    ),
                    child: child!,
                  );
                },
              );
              controller.birthDateController.text =
                  date.toString().substring(0, 10);
            },
            icon: SvgPicture.asset(
              Images.calenderIcon,
              height: 24,
              width: 24,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ),
    ),
  );
}

Widget editBirthDateWidget(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        onTap: () async {
          log('&&&&&&&&&&########');
          var date = await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: ColorsManager.primaryColor,
                  ),
                  dialogBackgroundColor: ColorsManager.greyColor,
                ),
                child: child!,
              );
            },
          );
          controller.birthDateController.text =
              date.toString().substring(0, 10);
          controller.birthDate = date.toString().substring(0, 10);
        },
        validator: (value) {
          return Validations()
              .textValidation(value!, controller.birthDateController.text);
        },
        onChanged: (String? value) {
          controller.birthDate = value!;
          controller.birthDateController.text = value;
          log('this is the birthDate: ${controller.birthDate}');
          final storage = GetStorage();
          storage.write('birthDate', value);
        },
        controller: controller.birthDateController,
        readOnly: true,
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s14,
          ),
          fillColor: color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            onPressed: () async {
              var date = await showDatePicker(
                context: Get.context!,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: ColorsManager.primaryColor,
                      ),
                      dialogBackgroundColor: ColorsManager.greyColor,
                    ),
                    child: child!,
                  );
                },
              );
              controller.birthDateController.text =
                  date.toString().substring(0, 10);
            },
            icon: SvgPicture.asset(
              Images.calenderIcon,
              height: 24,
              width: 24,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ),
    ),
  );
}

// Card Name Holder Form Field
Widget cardHolderNameFormField(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller.cardHolderNameController,
        validator: (value) {
          return null;

          // return Validations().validateIdentityNumber(value!);
        },
        decoration: InputDecoration(
          hintText: hinText,
          fillColor: color,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s12,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

// Card Number Form Field
Widget cardNumberFormField(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return SizedBox(
    width: 315,
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: controller.cardNumberController,
      validator: (value) {
        return null;

        // return Validations().validateIdentityNumber(value!);
      },
      decoration: InputDecoration(
        hintText: hinText,
        fillColor: color,
        hintStyle: getRegularStyle(
          color: hinTextColor,
          fontSize: FontSizeManager.s12,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

// Cvv Form Field
Widget cvvFormField(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller.cvvController,
        validator: (value) {
          return null;

          // return Validations().validateIdentityNumber(value!);
        },
        decoration: InputDecoration(
          hintText: hinText,
          fillColor: color,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s12,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

// Expiry Date Form Field
Widget expiryDateFormField(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: controller.expiryDateController,
    validator: (value) {
      return null;

      // return Validations().validateIdentityNumber(value!);
    },
    decoration: InputDecoration(
      hintText: hinText,
      fillColor: color,
      hintStyle: getRegularStyle(
        color: hinTextColor,
        fontSize: FontSizeManager.s12,
      ),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

// Ticket Title Form Field
Widget ticketTitleFormField(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  var isEnglish = Get.locale!.languageCode == 'en';
  return Padding(
    padding: isEnglish
        ? const EdgeInsets.only(
            right: 10,
          )
        : const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
    child: SizedBox(
      width: 315,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller.addressController,
        validator: (value) {
          return Validations().textValidation(value!, controller);
        },
        onSaved: (value) {
          controller.address = value;
        },
        decoration: InputDecoration(
          hintText: hinText,
          fillColor: color,
          hintStyle: getRegularStyle(
            color: hinTextColor,
            fontSize: FontSizeManager.s13,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

// Ticket Type Drop Down
Widget ticketTypeDropDown(BuildContext context) {
  var controller = Get.put(MoreController());
  var isEnglish = Get.locale!.languageCode == 'en';
  return Padding(
    padding: isEnglish
        ? const EdgeInsets.only(
            right: 10,
          )
        : const EdgeInsets.only(right: 0),
    child: DropdownButtonHideUnderline(
      child: Obx(
        (() => DropdownButton2(
              isExpanded: true,
              hint: Text(
                controller.ticketTypeList.first,
                style: getRegularStyle(
                  color: ColorsManager.defaultGreyColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
              value: controller.ticketType.value,
              onChanged: (value) {
                controller.changeTicketType(value!);
              },
              buttonHeight: 50,
              buttonWidth: 315,
              itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              buttonPadding: const EdgeInsets.only(left: 20, right: 20),
              buttonDecoration: BoxDecoration(
                color: ColorsManager.greyColor,
                borderRadius: BorderRadius.circular(50),
              ),
              dropdownDecoration: BoxDecoration(
                color: ColorsManager.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              items: [
                for (var item in controller.ticketTypeList)
                  DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: getRegularStyle(
                        color: ColorsManager.defaultGreyColor,
                        fontSize: FontSizeManager.s13,
                      ),
                    ),
                  ),
              ],
            )),
      ),
    ),
  );
}

// Importance Type Drop Down
Widget importanceTypeDropDown(BuildContext context) {
  var controller = Get.put(MoreController());
  var isEnglish = Get.locale!.languageCode == 'en';
  return Padding(
    padding: isEnglish
        ? const EdgeInsets.only(
            right: 10,
          )
        : const EdgeInsets.only(right: 0),
    child: DropdownButtonHideUnderline(
      child: Obx(
        (() => DropdownButton2(
              isExpanded: true,
              hint: Text(
                controller.importanceTypeList.first,
                style: getRegularStyle(
                  color: ColorsManager.defaultGreyColor,
                  fontSize: FontSizeManager.s14,
                ),
              ),
              value: controller.importanceType.value,
              onChanged: (value) {
                controller.changeImportanceType(value!);
              },
              buttonHeight: 50,
              buttonWidth: 315,
              itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              buttonPadding: const EdgeInsets.only(left: 20, right: 20),
              buttonDecoration: BoxDecoration(
                color: ColorsManager.greyColor,
                borderRadius: BorderRadius.circular(50),
              ),
              dropdownDecoration: BoxDecoration(
                color: ColorsManager.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              items: [
                for (var item in controller.importanceTypeList)
                  DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: getRegularStyle(
                        color: ColorsManager.defaultGreyColor,
                        fontSize: FontSizeManager.s13,
                      ),
                    ),
                  ),
              ],
            )),
      ),
    ),
  );
}

//Notes Form Field
Widget notesFormField(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  return Padding(
    padding: isArabic
        ? const EdgeInsets.only(
            left: 20,
            right: 20,
          )
        : const EdgeInsets.only(
            right: 10,
          ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 103,
        width: 315,
        decoration: BoxDecoration(
          color: ColorsManager.greyColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          maxLines: 5,
          controller: controller.noteController,
          onSaved: (value) {
            controller.note = value;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'notes'.tr,
            hintStyle: getRegularStyle(
              color: ColorsManager.defaultGreyColor,
              fontSize: FontSizeManager.s13,
            ),
          ),
        ),
      ),
    ),
  );
}

// Attach File
Widget attachFileWidget(BuildContext context, dynamic controller) {
  var isArabic = Get.locale!.languageCode == 'ar';
  return Padding(
    padding: isArabic
        ? const EdgeInsets.only(top: 15, right: 40, left: 40)
        : const EdgeInsets.only(
            top: 15,
            right: 10,
          ),
    child: GestureDetector(
      onTap: () {
        // controller.requestPermission();
        controller.selectFiles();
      },
      child: Container(
        height: 103,
        width: 315,
        decoration: BoxDecoration(
          color: ColorsManager.greyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: isArabic
                  ? const EdgeInsets.only(
                      top: 30,
                    )
                  : const EdgeInsets.only(
                      top: 30,
                    ),
              child: SvgPicture.asset(
                Images.attachFileIcon,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Obx(
            //   () => controller.filesToDisplay.isEmpty
            //       ? Text(
            //           '${'selected_file'.tr} ${controller.filesToDisplay.lenght + 1} ${'file'.tr}')
            //       : const SizedBox(),
            // ),
            Text(
              'attach'.tr,
              style: getRegularStyle(
                color: ColorsManager.blackColor,
                fontSize: FontSizeManager.s13,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// weight name form field
Widget weightFormField(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  return SizedBox(
    width: 153,
    height: 50,
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: controller.weightController,
      validator: (value) {
        Validations().validateWeight(value!);
        return null;
      },
      onSaved: (value) {
        controller.weight = value!;
        log('weight is ${controller.weight}');
      },
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: getRegularStyle(
          color: hinTextColor,
          fontSize: FontSizeManager.s14,
        ),
        fillColor: color,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

// height name form field
Widget heightFormField(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  return SizedBox(
    width: 153,
    height: 50,
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: controller.heightController,
      validator: (value) {
        Validations().validateHeight(value!);
        return null;
      },
      onSaved: (value) {
        var storage = GetStorage();
        controller.height = value!;
        log('height is ${controller.height}');
      },
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: getRegularStyle(
          color: hinTextColor,
          fontSize: FontSizeManager.s14,
        ),
        fillColor: color,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

// Social Status Widget

Widget selectSocialStatus(BuildContext context, dynamic controller,
    Color hinTextColor, String hinText) {
  return DropdownButtonHideUnderline(
    child: Obx(
      (() => DropdownButton2(
            isExpanded: true,
            hint: Text(
              hinText,
              style: getRegularStyle(
                color: hinTextColor,
                fontSize: FontSizeManager.s14,
              ),
            ),
            items: controller.addDividersAfterItems(controller.listOfStatus),
            customItemsHeights: controller.getCustomItemsHeights(),
            value: controller.maritalStatus.value,
            onChanged: (value) {
              controller.selectStatus(value!);
              controller.maritalStatus.value = value;
              log('this is the maritalStatus ${controller.maritalStatus.value}');
            },
            buttonHeight: 50,
            buttonWidth: 315,
            itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            buttonPadding: const EdgeInsets.only(left: 20, right: 20),
            buttonDecoration: BoxDecoration(
              color: ColorsManager.greyColor,
              borderRadius: BorderRadius.circular(50),
            ),
            dropdownDecoration: BoxDecoration(
              color: ColorsManager.greyColor,
              borderRadius: BorderRadius.circular(15),
            ),
          )),
    ),
  );
}

// Select Gender Widget
Widget selectGender(BuildContext context, controller) {
  return Obx(
    (() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.isMale.value = true;
                controller.isFemale.value = false;
                if (controller.isMale.value) {
                  controller.gender = 'male';
                  log('this is the gender:${controller.gender}');
                  controller.changeGender(controller.gender);
                } else {
                  controller.gender = 'female';
                  log('this is the gender:${controller.gender}');
                  controller.changeGender(controller.gender);
                }
              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: controller.isMale.value
                      ? ColorsManager.primaryColor
                      : ColorsManager.greyColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'male'.tr,
                    textAlign: TextAlign.center,
                    style: getRegularStyle(
                      color: controller.isMale.value
                          ? ColorsManager.whiteColor
                          : ColorsManager.fontColor,
                      fontSize: FontSizeManager.s14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                controller.isFemale.value = true;
                controller.isMale.value = false;
                if (controller.isFemale.value == true) {
                  controller.gender = 'female';
                } else {
                  controller.gender = 'male';
                }
              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: controller.isFemale.value
                      ? ColorsManager.primaryColor
                      : ColorsManager.greyColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'female'.tr,
                    textAlign: TextAlign.center,
                    style: getRegularStyle(
                      color: controller.isFemale.value
                          ? ColorsManager.whiteColor
                          : ColorsManager.fontColor,
                      fontSize: FontSizeManager.s14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
  );
}

// Details Widget
Widget psychiatristDetailsWidget(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: controller.otherDetailsController,
    enabled: true,
    onChanged: (value) {
      controller.otherAnswer = value;
    },
    decoration: InputDecoration(
      hintText: hinText,
      hintStyle: getRegularStyle(
        color: hinTextColor,
        fontSize: FontSizeManager.s12,
      ),
      contentPadding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
        bottom: 20,
      ),
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.lightGreyColor),
      ),
      filled: true,
      fillColor: color,
    ),
  );
}

// Details Widget
Widget disabilityDetailsWidget(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: controller.otherDetailsController2,
    enabled: true,
    onChanged: (value) {
      controller.otherAnswer2 = value;
    },
    decoration: InputDecoration(
      hintText: hinText,
      hintStyle: getRegularStyle(
        color: hinTextColor,
        fontSize: FontSizeManager.s12,
      ),
      contentPadding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
        bottom: 20,
      ),
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.lightGreyColor),
      ),
      filled: true,
      fillColor: color,
    ),
  );
}

// Details Widget
Widget healthProblemWidget(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: controller.otherDetailsController,
    enabled: true,
    onChanged: (value) {
      controller.healthProblemDescription = value;
      log('this is the health problem description ${controller.healthProblemDescription}');
    },
    decoration: InputDecoration(
      hintText: hinText,
      hintStyle: getRegularStyle(
        color: hinTextColor,
        fontSize: FontSizeManager.s12,
      ),
      contentPadding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
        bottom: 20,
      ),
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.lightGreyColor),
      ),
      filled: true,
      fillColor: color,
    ),
  );
}

// Details Widget
Widget medicationWidget(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: controller.otherDetailsController2,
    enabled: true,
    onChanged: (value) {
      controller.medicationDescription = value;
      log('this is the medication description ${controller.medicationDescription}');
    },
    decoration: InputDecoration(
      hintText: hinText,
      hintStyle: getRegularStyle(
        color: hinTextColor,
        fontSize: FontSizeManager.s12,
      ),
      contentPadding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
        bottom: 20,
      ),
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.lightGreyColor),
      ),
      filled: true,
      fillColor: color,
    ),
  );
}

// Details Widget
Widget habitsDetailsWidget(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: controller.otherDetailsController,
    enabled: true,
    onChanged: (value) {
      controller.habitsDetails = value;
      log('this is the habits description ${controller.habitsDetails}');
    },
    decoration: InputDecoration(
      hintText: hinText,
      hintStyle: getRegularStyle(
        color: hinTextColor,
        fontSize: FontSizeManager.s12,
      ),
      contentPadding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
        bottom: 20,
      ),
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.lightGreyColor),
      ),
      filled: true,
      fillColor: color,
    ),
  );
}

// Details Widget
Widget diseasesDetailsWidget(BuildContext context, dynamic controller,
    Color color, String hinText, Color hinTextColor) {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: controller.otherDetailsController2,
    enabled: true,
    onChanged: (value) {
      controller.diseasesDetails = value;
      log('this is the diseases description ${controller.diseasesDetails}');
    },
    decoration: InputDecoration(
      hintText: hinText,
      hintStyle: getRegularStyle(
        color: hinTextColor,
        fontSize: FontSizeManager.s12,
      ),
      contentPadding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
        bottom: 20,
      ),
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.lightGreyColor),
      ),
      filled: true,
      fillColor: color,
    ),
  );
}

// Email Widget
Widget emailWidget(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  var isEnglish = Get.locale!.languageCode == 'en';
  return Padding(
    padding: isEnglish
        ? const EdgeInsets.only(left: 60, right: 60)
        : const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller.emailController,
      onSaved: (value) {
        controller.email = value!;
        log('this is the email ${controller.email}');
      },
      validator: (value) {
        return Validations().validateEmail(value!);
      },
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: getRegularStyle(
          color: hinTextColor,
          fontSize: FontSizeManager.s14,
        ),
        fillColor: color,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

// Edit Email Widget
Widget editEmailWidget(BuildContext context, dynamic controller, Color color,
    String hinText, Color hinTextColor) {
  var isEnglish = Get.locale!.languageCode == 'en';
  return Padding(
    padding: isEnglish
        ? const EdgeInsets.only(left: 60, right: 60)
        : const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller.emailController,
      onChanged: (value) {
        controller.email = value;
        log('this is the email ${controller.email}');
      },
      validator: (value) {
        return Validations().validateEmail(value!);
      },
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: getRegularStyle(
          color: hinTextColor,
          fontSize: FontSizeManager.s14,
        ),
        fillColor: color,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
