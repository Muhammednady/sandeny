import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/images_manager.dart';

import '../models/program_details_model.dart';
import '../models/programs_model.dart';
import '../providers/program_details_provider.dart';
import '../providers/programs_provider.dart';
import '../views/program_details_view.dart';

class ProgramsController extends GetxController {
  static ProgramsController get instance => Get.find();
  List<String> imagesList = [
    Images.program1,
    Images.program2,
    Images.program1,
    Images.program2,
    Images.program1,
    Images.program2,
  ];

  List<String> titleList = [
    'program1',
    'program2',
    'program1',
    'program2',
    'program1',
    'program2',
  ];

  RxBool isShowMore = false.obs;
  void changeShowMore() {
    isShowMore.value = !isShowMore.value;
  }

  RxBool isShowMoreObj = false.obs;
  void changeShowMoreObj() {
    isShowMoreObj.value = !isShowMoreObj.value;
  }

  RxBool showStage = false.obs;
  void changeStage() {
    showStage.value = !showStage.value;
  }

  RxInt stageIndex = 0.obs;
  void changeStageIndex(int index) {
    stageIndex.value = index;
  }

  final count = 0.obs;

  var programProvider = ProgramsProvider();
  // var scalesDetailsProvider = ScaleDetailsProvider();
  var programDetailsProvider = ProgramDetailsProvider();

  RxList<ProgramData> programsList = <ProgramData>[].obs;
  // RxList<ScaleDetailsModel> scalesDetailsList = <ScaleDetailsModel>[].obs;
  var isLoading = false.obs;

  ProgramDetailsData programDetails = ProgramDetailsData();

  set setProgram(ProgramDetailsData program) {
    programDetails = program;
    update();
  }

  ProgramDetailsData get getProgram => programDetails;

  getPrograms() async {
    isLoading.value = true;
    try {
      var data = await programProvider.getPrograms();
      programsList.addAll(data);
      log(programsList.length.toString());
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      log('$e');
    }
    update();
  }

  getProgramDetails(int programId) async {
    try {
      EasyLoading.show(status: 'loading'.tr);
      await programDetailsProvider.getProgramDetails(programId).then(
        (value) {
          programDetails = value;
          Get.to(const ProgramDetailsView());
          EasyLoading.dismiss();
        },
      );
      update();
    } catch (e) {
      log('$e');
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getPrograms();
  }



  void increment() => count.value++;
}
