import 'dart:developer';

import 'package:get/get.dart';

import '../models/get_user_notification_model.dart';
import '../providers/get_user_notifications.dart';

class NotificationController extends GetxController {
  static NotificationController get instance =>
      Get.put(NotificationController());

  final getNotificationProvider = GetUserNotificationProvider();

  RxBool isLoading = false.obs;

  List<NotificationData> notificationList =
      <NotificationData>[].obs;

  set setNotificationData(List<NotificationData> data) {
    notificationList = data;
  }

  List<NotificationData> get getNotificationData => notificationList;

  getNotification() async {
    isLoading.value = false;
    notificationList.clear();
    var data = await getNotificationProvider.getUserNotifications();
    setNotificationData = data;
    notificationList = data;
    log('this is the notification list: ${notificationList.length}');
    isLoading.value = true;
    update();
  }

  List<String> notificationTitles = [
    'reminder'.tr,
    'reply'.tr,
    'new_discounts'.tr,
    'welcome_in_sanedny'.tr,
  ];

  List<String> notificationDetails = [
    'reminder_booking'.tr,
    'reminder_booking'.tr,
    'sanedny_notification'.tr,
    'sanedny_notification'.tr,
  ];
  final count = 0.obs;
  @override
  void onInit() {
    getNotification();
    super.onInit();
  }



  void increment() => count.value++;
}
