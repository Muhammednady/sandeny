import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sandeny/app/modules/myAppointments/models/get_appointment_details_model.dart';
import 'package:sandeny/app/modules/myAppointments/models/get_my_appointments_model.dart';
import 'package:sandeny/app/modules/myAppointments/providers/cancele_appointments_provider.dart';
import 'package:sandeny/app/modules/myAppointments/providers/get_appointment_details_provider.dart';
import 'package:sandeny/app/modules/myAppointments/providers/get_my_appointments_provider.dart';
import 'package:sandeny/app/modules/myAppointments/views/apointment_details_view.dart';
import 'package:sandeny/app/modules/network/controllers/network_controller.dart';
import 'package:sandeny/constants/dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/get_my_appointment_history_model.dart';
import '../providers/doctor_rating_provider.dart';
import '../providers/get_appointment_history_provider.dart';

class MyAppointmentsController extends GetxController {
  static MyAppointmentsController get instance =>
      Get.find<MyAppointmentsController>();

  final myAppointmentsProvider = GetMyAppointmentsProvider();

  RxList<AppointmentHistoryData> appointmentHistoryList =
      <AppointmentHistoryData>[].obs;

  RxList<AppointmentHistoryData> appointmentHistoryList2 =
      <AppointmentHistoryData>[].obs;

  RxList<AppointmentData> appointmentList = <AppointmentData>[].obs;

  final canceleAppointmentProvider = CanceleAppointmentProvider();

  final getAppointmentDetailsProvider = GetAppointmentDetailsProvider();

  final myAppointmentHistoryProvider = GetMyAppointmentsHistoryProvider();

  var networkController = NetworkController.instance;

  // page controller
  final PageController pageController = PageController();

  ScrollController scrollController = ScrollController();

  ScrollController scrollController2 = ScrollController();

  final Dio dio = Dio();

  RxInt nextAPageNumber = 1.obs;

  RxInt previousAPageNumber = 1.obs;

  RxBool isLoading = false.obs;

  RxBool isMoreDataAvailable = false.obs;

  String comment = "";
  int rate = 0;

  List<AppointmentDetails> myData = <AppointmentDetails>[].obs;

  set setAD(List<AppointmentDetails> data) {
    myData = data;
  }

  List<AppointmentDetails> get getAD => myData;

  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  RxInt selectIndex = 0.obs;

  void changeSelectIndex(int i) {
    selectIndex.value = i;
    update();
  }

  void getAppointment(int index) {
    appointmentList.clear();
    isLoading.value = true;
    try {
      myAppointmentsProvider.getMyAppointment(index).then(
        (value) {
          appointmentList.addAll(value);
          log('this is the appointmentList: ${appointmentList.length}');
          isLoading.value = false;
          update();
        },
      );
    } catch (e) {
      isLoading.value = false;
      update();
    }
  }

  void canceleAppointment(int appointmentId) {
    EasyLoading.show(status: 'loading'.tr);
    try {
      canceleAppointmentProvider.getMyAppointment(appointmentId).then((value) {
        update();
        EasyLoading.dismiss();
      });
    } catch (e) {
      EasyLoading.dismiss();
      update();
    }
  }

  void getNextAppointment(int status, int number) {
    appointmentHistoryList.clear();
    isLoading.value = true;
    log('this is the pageNumber : $number');
    try {
      myAppointmentHistoryProvider
          .getAppointmentHistory(status, number)
          .then((value) {
        if (value.isNotEmpty) {
          isMoreDataAvailable.value = true;
          appointmentHistoryList.addAll(value);
          isLoading.value = false;
          nextAPageNumber.value++;
        } else {
          isMoreDataAvailable.value = false;
          isLoading.value = false;
          // Dialogs.errorDialog(Get.context!, 'no_more_data'.tr);
        }
        update();
      });
    } catch (e) {
      isMoreDataAvailable.value = false;
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  void getPreviousAppointment(int status, int number) {
    appointmentHistoryList2.clear();
    isLoading.value = true;
    log('this is the pageNumber : $number');
    try {
      myAppointmentHistoryProvider
          .getAppointmentHistory(status, number)
          .then((value) {
        if (value.isNotEmpty) {
          isMoreDataAvailable.value = true;
          appointmentHistoryList2.addAll(value);
          isLoading.value = false;
          previousAPageNumber.value++;
        } else {
          isMoreDataAvailable.value = false;
          isLoading.value = false;
          Dialogs.errorDialog(Get.context!, 'no_more_data'.tr);
        }

        update();
      });
    } catch (e) {
      isMoreDataAvailable.value = false;
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  void getAppointmentDetails(int appointmentId) {
    EasyLoading.show(status: 'loading'.tr);
    try {
      getAppointmentDetailsProvider.getAppointmentDetails(appointmentId).then(
        (value) {
          setAD = value;
          update();
          log('this is the appointment details: ${getAD.length}');
          Get.to(
            () => const ApointmentDetailsView(
              index: 0,
            ),
          );
        },
      );
    } catch (e) {
      update();
    }
  }

  Future<void> saveFile(String url, String fileName) async {
    if (Platform.isAndroid) {
      await FlutterDownloader.enqueue(
        url: url,
        savedDir: await _getDownloadDirectory(),
        showNotification: true,
        openFileFromNotification: true,
      );
    } else if (Platform.isIOS) {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        try {
          final appDocDir = await getApplicationDocumentsDirectory();
          final downloadPath = appDocDir.path;
          final savedPath =
              '$downloadPath/$fileName'; // Update the file name and extension as needed
          await dio.download(url, savedPath);
          Dialogs.successDialog(Get.context!, 'sucssesfully_download_file'.tr);
          await launch(Uri.parse(url).toString());
          // download the file in the storgage
          log(savedPath);
        } catch (e) {
          Dialogs.errorDialog(Get.context!, 'error_download_file'.tr);
        }
      } else {
        Dialogs.errorDialog(Get.context!, 'permission_denied'.tr);
      }
    }
  }

  Future<String> _getDownloadDirectory() async {
    final directory = await getExternalStorageDirectory();
    return directory!.path;
  }

  Future<void> downloadFile(String url, String fileName) async {
    EasyLoading.show(status: 'loading'.tr);
    try {
      await saveFile(url, fileName);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      update();
    }
  }

  // logic for rating doctor

  void addRating({
    required int doctorId,
  }) async {
    EasyLoading.show(status: 'loading'.tr);
    try {
      await DoctorRatingProvider.instance.addRating(
        doctorId: doctorId,
        comment: comment,
        rate: rate,
      );
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      update();
    }
  }

  @override
  void onInit() {
    getNextAppointment(1, nextAPageNumber.value);
    super.onInit();
  }
}
