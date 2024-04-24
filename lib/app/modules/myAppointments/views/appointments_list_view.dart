import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sandeny/widgets/myAppointments_widgets.dart/previous_booking_widget.dart';

import '../../../../widgets/myAppointments_widgets.dart/canclled_booking_widget.dart';
import '../../../../widgets/myAppointments_widgets.dart/choose_appointment_type_widget.dart';
import '../../../../widgets/myAppointments_widgets.dart/next_booking_widget.dart';
import '../controllers/my_appointments_controller.dart';

class AppointmentsListView extends GetView<MyAppointmentsController> {
  const AppointmentsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        chooseAppointmentType(context),
        const SizedBox(
          height: 20.0,
        ),
        Column(
          children: [
            GetX(
              init: controller,
              builder: (ctx) {
                return _body(context);
              },
            ),
          ],
        ),
      ]),
    );
  }

  Widget _body(BuildContext context) {
    switch (controller.tabIndex.value) {
      case 0:
        return nextBooking(context);
      case 1:
        return previousBooking(context);
      case 2:
        return canclledBooking(context);
      default:
        return nextBooking(context);
    }
  }
}
