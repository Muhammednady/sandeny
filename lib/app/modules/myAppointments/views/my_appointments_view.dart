import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/myAppointments/views/appointments_list_view.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/styles_manager.dart';

import '../../../../constants/fonts_manager.dart';
import '../controllers/my_appointments_controller.dart';

class MyAppointmentsView extends GetView<MyAppointmentsController> {
  const MyAppointmentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.greyColor,
        elevation: 0,
        title: Text(
          'my_appointments'.tr,
          style: getMediumStyle(
            color: ColorsManager.mainColor,
            fontSize: FontSizeManager.s16,
          ),
        ),
        centerTitle: true,
      ),
      body: const AppointmentsListView(),
    );
  }
}
