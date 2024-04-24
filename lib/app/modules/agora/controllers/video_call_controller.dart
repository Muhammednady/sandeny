import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:sandeny/app/modules/agora/models/video_call_model.dart';
import 'package:sandeny/app/modules/agora/providers/video_call_provider.dart';
import 'package:intl/intl.dart';

import '../../../../constants/pusher_config.dart';

class VideoCallController extends GetxController {
  final videoCallProvider = VideoCallProvider();

  static VideoCallController get instance => Get.put(VideoCallController());

  late AgoraClient client;

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  RxBool isVideoCallApproved = false.obs;

  late DateTime appointmentEndMinute;

  late DateTime appointmentStartMinute;

  int maxDurationInSeconds = 0;

  String appointmentEndTimeString = Get.arguments[5];

  String appointmentStartTimeString = Get.arguments[6];

  void clearTimers() {
    // Clear any existing timers
    Timer? existingTimer;
    existingTimer!.cancel();
  }

  void setupAppointmentEndTime() {
    log('appointmentEndTimeString: $appointmentEndTimeString');

    try {
      // Parse the time string with the specified format
      appointmentEndMinute =
          DateFormat('HH:mm').parse(appointmentEndTimeString);

      // Get the current date
      DateTime currentDate = DateTime.now();

      // Combine the current date and the time from the parsed string
      appointmentEndMinute = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        appointmentEndMinute.hour,
        appointmentEndMinute.minute,
      );

      // Parse the time string for appointment start time
      appointmentStartMinute =
          DateFormat('HH:mm').parse(appointmentStartTimeString);

      // Combine the current date and the time from the parsed string
      appointmentStartMinute = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        appointmentStartMinute.hour,
        appointmentStartMinute.minute,
      );

      log('Parsed appointment end time: $appointmentEndMinute');

      // Start updating the remaining time
      startUpdatingRemainingTime();
    } catch (e) {
      log('Error parsing appointment end time: $e');
    }
  }

  // This is the current date
  int currentMinute = DateTime.now().minute;

  RxString remainingTime = ''.obs;

  void updateRemainingTime() {
    // Calculate the duration between current time and appointment end time
    Duration duration = appointmentEndMinute.difference(DateTime.now());

    // Check if the appointment has not ended yet
    if (duration.isNegative) {
      // Handle the case when the appointment has ended
      remainingTime.value = '0:00';
      clearTimers();
      log('##############Appointment Ended###########');
    } else {
      // Format remaining time as minutes and seconds
      int minutes = duration.inMinutes;
      int seconds = duration.inSeconds % 60;

      remainingTime.value = '$minutes:${seconds.toString().padLeft(2, '0')}';

      // Calculate the total duration (from appointment start to end)
      Duration totalDuration =
          appointmentEndMinute.difference(appointmentStartMinute);

      // Calculate the remaining percentage
      double remainingPercentage =
          (duration.inSeconds.toDouble() / totalDuration.inSeconds.toDouble()) *
              100;

      // Log the percentage for debugging
      log('Percentage Remaining: $remainingPercentage');

      checkReminderStatus();
    }
  }

  // Call this function periodically to update the remaining time
  void startUpdatingRemainingTime() {
    // Update immediately
    updateRemainingTime();

    // Update every second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateRemainingTime();
    });
  }

  RxBool isGreen = false.obs;
  RxBool isYellow = false.obs;
  RxBool isRed = false.obs;

  void checkReminderStatus() {
    log('this is the appointment end time: $appointmentEndMinute');
    log('this is the appointment start time: $appointmentStartMinute');

    // Calculate the duration between current time and appointment end time
    Duration duration = appointmentEndMinute.difference(DateTime.now());

    // Calculate the total duration (from appointment start to end)
    Duration totalDuration = appointmentEndMinute
        .difference(DateTime.parse(appointmentStartMinute.toString()));

    // Calculate the remaining percentage
    double remainingPercentage =
        (duration.inSeconds.toDouble() / totalDuration.inSeconds.toDouble()) *
            100;

    String formattedPercentage = remainingPercentage.toStringAsFixed(2);

    // Check the color based on the remaining percentage
    if (remainingPercentage > 50) {
      // Green color
      log('Remaining time: $formattedPercentage% - Green');
      isGreen.value = true;
      isYellow.value = false;
      isRed.value = false;
    } else if (remainingPercentage <= 50 && remainingPercentage > 20) {
      // Yellow color
      log('Remaining time: $formattedPercentage% - Yellow');
      isYellow.value = true;
      isGreen.value = false;
      isRed.value = false;
    } else {
      // Red color
      log('Remaining time: $formattedPercentage% - Red');
      isRed.value = true;
      isGreen.value = false;
      isYellow.value = false;
    }
  }

  void initPusher() async {
    try {
      await pusher.init(
        apiKey: PusherConfig.key,
        cluster: PusherConfig.cluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onSubscriptionCount: onSubscriptionCount,
      );
      log('pusher initialized successfully');
    } catch (e) {
      log('this is the error: $e');
    }
    // subscribe to channel
    pusher.subscribe(channelName: pusherChannelName.value);
    // Connect to Pusher
    pusher.connect();
  }

  RxString pusherChannelName = ''.obs;

  RxString pusherEvent = ''.obs;

  GetVideoCallModel videoCallData = GetVideoCallModel();

  set setVideoCallData(GetVideoCallModel data) {
    videoCallData = data;
  }

  GetVideoCallModel get getVideoCallData => videoCallData;

  RxInt remoteUid = 0.obs;
  RxInt localUid = 0.obs;

  // method to get the video call data
  Future<void> getVideoCall({
    required int appointmentId,
  }) async {
    try {
      log('this is the appointment: $appointmentId');
      final response = await videoCallProvider.getAvailabeAppointments(
        appointmentId: appointmentId,
      );
      setVideoCallData = response;

      final channelName = videoCallData.data!.channel!;
      final uid = int.parse(videoCallData.data!.uid!);
      localUid.value = uid;
      pusherChannelName.value = channelName;
      pusherEvent.value = videoCallData.data!.pusherEvent!;
      onSubscriptionSucceeded(pusherChannelName.value, pusherEvent.value);
      initPusher();
    } catch (e) {
      log('this is the error: $e');
      Get.back();
    }
    update();
  }

  void initAgora(
      String appId, String channelName, String token, int uid) async {
    log('this is the app id: $appId');
    log('this is the channel name: $channelName');
    log('this is the token: $token');
    log('this is the uid: $uid');

    client = AgoraClient(
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
      agoraConnectionData: AgoraConnectionData(
        appId: appId,
        channelName: channelName,
        tempToken: token,
        uid: localUid.value,
        screenSharingEnabled: true,
        rtmEnabled: false,
      ),
      agoraEventHandlers: AgoraRtcEventHandlers(
        onJoinChannelSuccess: (
          channel,
          uid,
        ) {
          log('local user joined: $uid');
        },
        onRejoinChannelSuccess: (connection, elapsed) {
          log('this is the channel: ${connection.channelId}');
          log('this is the elapsed: $elapsed');
          localUid.value = connection.localUid!;
        },
        onUserJoined: (connection, uid, elapsed) {
          if (uid != localUid.value) {
            remoteUid.value = uid;
            log('remote user joined: $uid');
            sendRemoteUserId(uid);
          }
        },
        onUserOffline: (connection, uid, reason) {
          remoteUid.value = 0; // Handle when the user goes offline
          log('remote user offline: $uid');
        },
        onTokenPrivilegeWillExpire: (connection, token) {
          log('this is the connection: $connection');
          log('this token is will expired: $token');
        },
      ),
    );

    await client.initialize();
  }

  void sendRemoteUserId(int remoteUserId) {
    log('Sending remote user ID: $remoteUserId');
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
    final jsonData = jsonDecode(event.data);
    final status = jsonData['data']['status'];
    log('this is the event status: $status');
    if (status == '2') {
      handleVideoCallApproved();
    } else if (status == '3') {
      handleVideoCallRejected();
    } else {
      // this logic if the 5 minutes passed and the doctor didn't approve or reject the video call
      Timer(
        const Duration(minutes: 5),
        () {
          getVideoCall(
            appointmentId: int.parse(videoCallData.data!.appointmentId!),
          );
        },
      );
    }
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  void handleVideoCallApproved() {
    // Logic to handle video call approved by the doctor
    // NotificationService().sendNotification(
    //   0,
    //   'video_call_approved'.tr,
    //   'video_call_approved_body'.tr,
    // );

    isVideoCallApproved.value = true;

    if (isVideoCallApproved.value == true) {
      initAgora(
        videoCallData.data!.appId!,
        videoCallData.data!.channel!,
        videoCallData.data!.token!,
        int.parse(videoCallData.data!.uid!),
      );

      // Set up appointment end time and start updating remaining time
      setupAppointmentEndTime();
    }
  }

  // method to handle video call rejected by the doctor
  void handleVideoCallRejected() {
    // NotificationService().sendNotification(
    //   0,
    //   'video_call_rejected'.tr,
    //   'video_call_rejected_body'.tr,
    // );
    isVideoCallApproved.value = false;
    clearTimers();
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    pusher.disconnect();
    isVideoCallApproved.value = false;
    client.release();
    clearTimers();
  }
}
