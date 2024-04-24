import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings androidInitializationSettings =
  const AndroidInitializationSettings('logo');
  final DarwinInitializationSettings iosInitializationSettings =
  const DarwinInitializationSettings();
  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    log('Title: ${message.notification?.title}');
    log('Body: ${message.notification?.body}');
    log('Payload: ${message.data}');
  }

  void handleMessage(RemoteMessage? message) async {
    if (message == null) return;
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      final data = message.data;
      log('Title: ${notification?.title}');
      log('Body: ${notification?.body}');
      log('Payload: $data');
      sendNotification(0, notification?.title ?? '', notification?.body ?? '');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final notification = message.notification;
      final data = message.data;
      log('onMessageOpenedApp: $notification');
      log('onMessageOpenedApp: $data');
    });

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(int id, String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
        'high_importance_channel', 'High Importance Notifications',
        importance: Importance.max, priority: Priority.max);
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails, iOS: const DarwinNotificationDetails());

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }
}

