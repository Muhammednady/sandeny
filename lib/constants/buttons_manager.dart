import 'package:flutter/material.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/fonts_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';
import 'package:get/get.dart';

class ButtonsManager {
  static Widget primaryButton({
    required String text,
    required Function onPressed,
    required BuildContext context,
    Size? minimumSize,
    Size? maximumSize,
    Color? buttonColor,
    Color? textColor,
    double? fontSize,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? Size(Get.width * 0.8, Get.height * 0.07),
        maximumSize: maximumSize ?? Size(Get.width * 0.8, Get.height * 0.07),
        textStyle: getRegularStyle(
          color: ColorsManager.whiteColor,
          fontSize: fontSize ?? FontSizeManager.s13,
        ),
        backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: getRegularStyle(
          color: textColor ?? ColorsManager.whiteColor,
          fontSize: fontSize ?? FontSizeManager.s15,
        ),
      ),
    );
  }

  // secondary button
  static Widget secondaryButton({
    required String text,
    required Function onPressed,
    required BuildContext context,
    Size? minimumSize,
    Size? maximumSize,
    Color? buttonColor,
    Color? textColor,
    double? fontSize,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? Size(Get.width * 0.8, Get.height * 0.07),
        maximumSize: maximumSize ?? Size(Get.width * 0.8, Get.height * 0.07),
        textStyle: getMediumStyle(
          color: ColorsManager.whiteColor,
          fontSize: fontSize ?? FontSizeManager.s15,
        ),
        backgroundColor: buttonColor ?? ColorsManager.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: getRegularStyle(
          color: textColor ?? ColorsManager.whiteColor,
          fontSize: fontSize ?? FontSizeManager.s15,
        ),
      ),
    );
  }
}
