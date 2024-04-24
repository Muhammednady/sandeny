import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/colors_manager.dart';
import '../../../../widgets/home_screen_widgets.dart/bottom_navigation_bar_widget.dart';
import '../../../../widgets/home_screen_widgets.dart/home_page_widget.dart';
import '../../more/views/more_view.dart';
import '../../myAppointments/views/my_appointments_view.dart';
import '../../scales/views/scales_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorsManager.greyColor,
          body: GetX(
            init: HomeController.instance,
            builder: (ctx) {
              return _body(context);
            },
          ),
          bottomNavigationBar: bottomNavigarionBarWidget(context),
        );
      },
    );
  }

  _body(BuildContext context) {
    switch (HomeController.instance.pageIndex.value) {
      case 0:
        return homePage(context);
      case 1:
        return const MyAppointmentsView();
      case 2:
        return const ScalesView();
      // case 3:
      //   return const ProgramsView();
      case 3:
        return const MoreView();
      default:
        return homePage(context);
    }
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sandeny/constants/colors_manager.dart';
// import 'package:showcaseview/showcaseview.dart';

// import '../../../../widgets/home_screen_widgets.dart/bottom_navigation_bar_widget.dart';
// import '../../../../widgets/home_screen_widgets.dart/home_page_widget.dart';
// import '../../more/views/more_view.dart';
// import '../../myAppointments/views/my_appointments_view.dart';
// import '../../network/controllers/network_controller.dart';
// import '../../scales/views/scales_view.dart';
// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var homeController = Get.put(HomeController());
//     return Scaffold(
//       backgroundColor: ColorsManager.greyColor,
//       // body of the home page
//       body: GetX(
//         init: controller,
//         builder: (ctx) {
//           return ShowCaseWidget(
//             builder: Builder(
//               builder: (context) => _body(context),
//             ),
//           );
//         },
//       ),

//       // bottom navigation bar of the home page
//       bottomNavigationBar: bottomNavigarionBarWidget(context),
//     );
//   }

//   _body(BuildContext context) {
//     switch (controller.pageIndex.value) {
//       case 0:
//         return homePage(context);
//       case 1:
//         return const MyAppointmentsView();
//       case 2:
//         return const ScalesView();
//       // case 3:
//       //   return const ProgramsView();
//       case 3:
//         return const MoreView();
//       default:
//         return homePage(context);
//     }
//   }
// }
