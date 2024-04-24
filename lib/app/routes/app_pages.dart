import 'package:get/get.dart';
import 'package:sandeny/app/modules/Auth/bindings/splash_screen_binding.dart';
import 'package:sandeny/app/modules/Auth/views/splash_screen_view.dart';

import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/auth_view.dart';
import '../modules/Immediate_consultation/bindings/immediate_consultation_binding.dart';
import '../modules/Immediate_consultation/views/immediate_consultation_view.dart';
import '../modules/appointment_booking/bindings/appointment_booking_binding.dart';
import '../modules/appointment_booking/views/appointment_booking_view.dart';
import '../modules/bilateral_session/bindings/bilateral_session_binding.dart';
import '../modules/bilateral_session/views/bilateral_session_view.dart';
import '../modules/changePassword/bindings/change_password_binding.dart';
import '../modules/changePassword/views/change_password_view.dart';
import '../modules/completeAccountInformation/bindings/complete_account_information_binding.dart';
import '../modules/completeAccountInformation/views/complete_account_information_view.dart';
import '../modules/completeAccountInformation2/bindings/complete_account_information2_binding.dart';
import '../modules/completeAccountInformation2/views/complete_account_information2_view.dart';
import '../modules/completeAccountInformation3/bindings/complete_account_information3_binding.dart';
import '../modules/completeAccountInformation3/views/complete_account_information3_view.dart';
import '../modules/completeAccountInformation4/bindings/complete_account_information4_binding.dart';
import '../modules/completeAccountInformation4/views/complete_account_information4_view.dart';
import '../modules/doctors/bindings/doctors_binding.dart';
import '../modules/doctors/views/doctors_view.dart';
import '../modules/favorite_doctor/bindings/favorite_doctor_binding.dart';
import '../modules/favorite_doctor/views/favorite_doctor_view.dart';
import '../modules/filter/bindings/filter_binding.dart';
import '../modules/filter/views/filter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/immediate_consultation_details/bindings/immediate_consultation_details_binding.dart';
import '../modules/immediate_consultation_details/views/immediate_consultation_details_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/myAppointments/bindings/my_appointments_binding.dart';
import '../modules/myAppointments/views/my_appointments_view.dart';
import '../modules/network/bindings/network_binding.dart';
import '../modules/network/views/network_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/personal-clinc/bindings/personal_clinc_binding.dart';
import '../modules/personal-clinc/views/personal_clinc_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/programs/bindings/programs_binding.dart';
import '../modules/programs/views/programs_view.dart';
import '../modules/scale_questions/bindings/scale_questions_binding.dart';
import '../modules/scale_questions/views/scale_questions_view.dart';
import '../modules/scale_results/bindings/scale_results_binding.dart';
import '../modules/scale_results/views/scale_results_view.dart';
import '../modules/scales/bindings/scales_binding.dart';
import '../modules/scales/views/scales_view.dart';
import '../modules/scheduled_session/bindings/scheduled_session_binding.dart';
import '../modules/scheduled_session/views/scheduled_session_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/welcome_screen/bindings/welcome_screen_binding.dart';
import '../modules/welcome_screen/views/welcome_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => const WelcomeScreenView(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_APPOINTMENTS,
      page: () => const MyAppointmentsView(),
      binding: MyAppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_CLINC,
      page: () => const SanednyClincView(),
      binding: SanednyClincBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORS,
      page: () => const DoctorsView(),
      binding: DoctorsBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT_BOOKING,
      page: () => const AppointmentBookingView(),
      binding: AppointmentBookingBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE_DOCTOR,
      page: () => const FavoriteDoctorView(),
      binding: FavoriteDoctorBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_ACCOUNT_INFORMATION,
      page: () => const CompleteAccountInformationView(),
      binding: CompleteAccountInformationBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_ACCOUNT_INFORMATION2,
      page: () => const CompleteAccountInformation2View(),
      binding: CompleteAccountInformation2Binding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_ACCOUNT_INFORMATION3,
      page: () => const CompleteAccountInformation3View(),
      binding: CompleteAccountInformation3Binding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_ACCOUNT_INFORMATION4,
      page: () => const CompleteAccountInformation4View(),
      binding: CompleteAccountInformation4Binding(),
    ),
    GetPage(
      name: _Paths.NETWORK,
      page: () => NetworkView(),
      binding: NetworkBinding(),
    ),
    GetPage(
      name: _Paths.FILTER,
      page: () => const FilterView(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: _Paths.SCALES,
      page: () => const ScalesView(),
      binding: ScalesBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAMS,
      page: () => const ProgramsView(),
      binding: ProgramsBinding(),
    ),
    GetPage(
      name: _Paths.SCALE_QUESTIONS,
      page: () => const ScaleQuestionsView(),
      binding: ScaleQuestionsBinding(),
    ),
    GetPage(
      name: _Paths.SCALE_RESULTS,
      page: () => const ScaleResultsView(),
      binding: ScaleResultsBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULED_SESSION,
      page: () => const ScheduledSessionView(),
      binding: ScheduledSessionBinding(),
    ),
    GetPage(
      name: _Paths.IMMEDIATE_CONSULTATION,
      page: () => const ImmediateConsultationView(),
      binding: ImmediateConsultationBinding(),
    ),
    GetPage(
      name: _Paths.BILATERAL_SESSION,
      page: () => const BilateralSessionView(),
      binding: BilateralSessionBinding(),
    ),
    GetPage(
      name: _Paths.IMMEDIATE_CONSULTATION_DETAILS,
      page: () => const ImmediateConsultationDetailsView(),
      binding: ImmediateConsultationDetailsBinding(),
    ),
  ];
}
