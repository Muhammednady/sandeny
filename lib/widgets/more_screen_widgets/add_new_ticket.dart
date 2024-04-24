import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/more/controllers/more_controller.dart';
import '../../constants/buttons_manager.dart';
import '../../constants/colors_manager.dart';
import '../../constants/fonts_manager.dart';
import '../../constants/styles_manager.dart';
import '../text_form_fields.dart';

addNewTicketWidget(BuildContext context) {
  var isArabic = Get.locale!.languageCode == 'ar';
  var controller = Get.put(MoreController());
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) => Container(
      width: Get.width,
      height: Get.height * 0.85,
      decoration: const BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  width: 44,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: ColorsManager.lightGreyColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  'add_ticket'.tr,
                  style: getMediumStyle(
                    color: ColorsManager.fontColor,
                    fontSize: FontSizeManager.s15,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 30, right: 40)
                        : const EdgeInsets.only(top: 30, left: 50),
                    child: Text(
                      'ticket_title'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.mainColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ticketTitleFormField(context, controller, ColorsManager.greyColor,
                  'ticket_title'.tr, ColorsManager.defaultGreyColor),
              Row(
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 30, right: 40)
                        : const EdgeInsets.only(top: 30, left: 50),
                    child: Text(
                      'ticket_type'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.mainColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // Ticket Type DropDown
              ticketTypeDropDown(context),
              Row(
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 30, right: 40)
                        : const EdgeInsets.only(top: 30, left: 50),
                    child: Text(
                      'Importance'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.mainColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // Importance DropDown
              importanceTypeDropDown(context),

              // Notes
              Row(
                children: [
                  Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(top: 30, right: 40)
                        : const EdgeInsets.only(top: 30, left: 50),
                    child: Text(
                      'notes'.tr,
                      style: getRegularStyle(
                        color: ColorsManager.mainColor,
                        fontSize: FontSizeManager.s14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // Notes Text Form Field
              notesFormField(context, controller),

              // Add Attach File
              attachFileWidget(context, controller),

              const SizedBox(
                height: 20,
              ),
              ButtonsManager.primaryButton(
                text: 'add_ticket_button'.tr,
                onPressed: () {
                  controller.checkAddTicket();
                },
                context: context,
                minimumSize: const Size(287, 50),
                maximumSize: const Size(287, 50),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
