import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sandeny/constants/notification_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sandeny/app/modules/network/bindings/network_binding.dart';

import 'app/controller/language_controller.dart';
import 'app/routes/app_pages.dart';
import 'constants/theme_manager.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final navigatorKey = GlobalKey<NavigatorState>();

// function to show the performance in the app
performance() async {
  final transaction = Sentry.startTransaction(
    'processOrderBatch()',
    'task',
  );

  try {
    await processOrderBatch(transaction);
  } catch (exception) {
    transaction.throwable = exception;
    transaction.status = const SpanStatus.internalError();
  } finally {
    await transaction.finish();
  }
}

Future<void> processOrderBatch(ISentrySpan span) async {
  // span operation: task, span description: operation
  final innerSpan = span.startChild('task', description: 'operation');

  try {
    // omitted code
  } catch (exception) {
    innerSpan.throwable = exception;
    innerSpan.status = const SpanStatus.notFound();
  } finally {
    await innerSpan.finish();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'Sanedny',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initNotifications();

  await GetStorage.init();

  await Firebase.initializeApp();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://561e764fad67cfa1fdec2c952acd9d76@o4506620722020352.ingest.sentry.io/4506620766322688';
      options.tracesSampleRate = 0.01;
    },
    appRunner: () => runApp,
  );
  performance();

  FirebaseMessaging.instance.getToken().then(
    (value) {
      GetStorage().write('fcmToken', value);
      log('this is the fcm token: $value');
    },
  );

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      translations: LanguageController.instance,
      locale: Locale(LanguageController.instance.getLocale),
      fallbackLocale: LanguageController.instance.fallbackLocale,
      initialRoute: AppPages.INITIAL,
      initialBinding: NetworkBinding(),
      getPages: AppPages.routes,
      theme: getApplicationTheme(),
      builder: EasyLoading.init(),
    ),
  );
  configLoading();
}

void configLoading() async {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
